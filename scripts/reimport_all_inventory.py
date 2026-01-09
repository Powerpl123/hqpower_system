#!/usr/bin/env python3
"""
Reimport ALL inventory data to correct locations.
Each classification gets its own folder structure.
"""

import csv
import hashlib
from datetime import datetime
import os

def escape_sql(text):
    """Escape single quotes for SQL"""
    if text is None:
        return ''
    return text.replace("'", "''").strip()

def generate_item_number(prefix, index, name):
    """Generate unique item number"""
    hash_suffix = hashlib.md5(f'{name}{index}'.encode()).hexdigest()[:6].upper()
    return f'{prefix}-{datetime.now().strftime("%Y%m%d")}-{index:04d}-{hash_suffix}'

def parse_quantity(value):
    """Parse quantity value, handling decimals"""
    try:
        return int(float(str(value).replace(',', '').strip()))
    except (ValueError, AttributeError):
        return 0

def read_csv_file(filepath, encoding='latin-1'):
    """Read CSV file and return rows"""
    items = []
    with open(filepath, 'r', encoding=encoding) as f:
        reader = csv.reader(f)
        header = next(reader)  # Skip header
        for row in reader:
            if row and row[0].strip():
                items.append(row)
    return items

def read_xls_as_csv(filepath, encoding='latin-1'):
    """Read XLS file (saved as tab-delimited or CSV)"""
    items = []
    try:
        # Try reading as tab-delimited first
        with open(filepath, 'r', encoding=encoding) as f:
            # Check if tab-delimited
            first_line = f.readline()
            f.seek(0)
            
            if '\t' in first_line:
                reader = csv.reader(f, delimiter='\t')
            else:
                reader = csv.reader(f)
            
            header = next(reader)  # Skip header
            for row in reader:
                if row and len(row) > 0 and row[0].strip():
                    items.append(row)
    except Exception as e:
        print(f"Error reading {filepath}: {e}")
    return items

def main():
    base_dir = os.path.dirname(os.path.dirname(__file__))
    output_file = os.path.join(base_dir, 'supabase', 'migrations', '20260109000000_reimport_all_inventory.sql')
    
    # Define classifications and their source files
    classifications = [
        {
            'name': 'IT Equipment',
            'description': 'IT equipment and devices',
            'color': '#3B82F6',
            'file': '2026_01_08_10_33_25_tovars_IT equipment and devices.xls',
            'prefix': 'IT',
            'location': 'IT Storage'
        },
        {
            'name': 'Land Survey',
            'description': 'Land survey devices',
            'color': '#10B981',
            'file': 'Land survey devices.xls',
            'prefix': 'LS',
            'location': 'Survey Equipment'
        },
        {
            'name': 'Peat Containers',
            'description': 'Peat containers inventory',
            'color': '#8B5CF6',
            'file': 'Peat containers.xls',
            'prefix': 'PC',
            'location': 'Container Storage'
        },
        {
            'name': 'Personal Protective Items',
            'description': 'PPE and safety equipment',
            'color': '#EF4444',
            'file': 'PERSONAL PROTECTIVE ITEMS.xls',
            'prefix': 'PPE',
            'location': 'Safety Equipment'
        },
        {
            'name': 'Spare Parts',
            'description': 'Spare parts and other materials',
            'color': '#F59E0B',
            'file': 'Spare parts and other materials in peat containers.xls',
            'prefix': 'SP',
            'location': 'Parts Storage'
        },
        {
            'name': 'Warehouse Main',
            'description': 'Main warehouse inventory',
            'color': '#6366F1',
            'file': 'Warehouse.csv',
            'prefix': 'WH',
            'location': 'Main Storage'
        }
    ]
    
    sql = f"""-- Reimport ALL inventory with correct classifications and locations
-- Generated on: {datetime.now().isoformat()}
-- This properly separates items into their respective classifications

-- First, clear existing warehouse items to avoid duplicates
DELETE FROM public.inventory_items 
WHERE department_id = '22222222-2222-2222-2222-222222222222';

DO $$
DECLARE
  wh_dept_id UUID := '22222222-2222-2222-2222-222222222222';
  class_id UUID;
  loc_id UUID;
BEGIN
"""

    total_items = 0
    
    for classification in classifications:
        filepath = os.path.join(base_dir, classification['file'])
        
        if not os.path.exists(filepath):
            print(f"File not found: {filepath}")
            continue
        
        # Read items from file
        if filepath.endswith('.csv'):
            rows = read_csv_file(filepath)
        else:
            rows = read_xls_as_csv(filepath)
        
        if not rows:
            print(f"No items found in: {filepath}")
            continue
        
        print(f"Processing {classification['name']}: {len(rows)} items from {classification['file']}")
        
        sql += f"""
  -- ==========================================
  -- {classification['name']} ({len(rows)} items)
  -- ==========================================
  
  -- Create or get classification
  SELECT id INTO class_id FROM public.warehouse_classifications
  WHERE department_id = wh_dept_id AND name = '{classification['name']}' LIMIT 1;
  
  IF class_id IS NULL THEN
    INSERT INTO public.warehouse_classifications (department_id, name, description, color)
    VALUES (wh_dept_id, '{classification['name']}', '{classification['description']}', '{classification['color']}')
    RETURNING id INTO class_id;
  END IF;
  
  -- Create or get location
  SELECT id INTO loc_id FROM public.warehouse_locations
  WHERE classification_id = class_id AND name = '{classification['location']}' LIMIT 1;
  
  IF loc_id IS NULL THEN
    INSERT INTO public.warehouse_locations (department_id, classification_id, name)
    VALUES (wh_dept_id, class_id, '{classification['location']}')
    RETURNING id INTO loc_id;
  END IF;
  
  RAISE NOTICE 'Importing {classification['name']} to classification % location %', class_id, loc_id;
  
"""
        
        # Add items
        for idx, row in enumerate(rows):
            item_name = escape_sql(row[0])
            quantity = parse_quantity(row[1]) if len(row) > 1 else 0
            
            # Handle different CSV structures
            min_quantity = 0
            unit = 'pcs'
            
            if classification['file'].endswith('.csv'):
                # Warehouse.csv format: Item name, Quantity, Unit, _, Min.Quantity
                unit = escape_sql(row[2]) if len(row) > 2 and row[2].strip() else 'pcs'
                min_quantity = parse_quantity(row[4]) if len(row) > 4 else 0
            else:
                # XLS format may vary
                min_quantity = parse_quantity(row[4]) if len(row) > 4 else 0
            
            item_number = generate_item_number(classification['prefix'], idx, item_name)
            
            sql += f"""  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, class_id, loc_id, '{item_name}', '{item_number}', {quantity}, {min_quantity}, '{unit}')
  ON CONFLICT (department_id, item_number) DO NOTHING;
"""
            total_items += 1
        
        sql += f"""
  RAISE NOTICE 'Completed {classification['name']}';
"""
    
    sql += """
  RAISE NOTICE 'Import complete!';
END;
$$;
"""
    
    # Write output file
    with open(output_file, 'w', encoding='utf-8') as f:
        f.write(sql)
    
    print(f"\nGenerated SQL file: {output_file}")
    print(f"Total items: {total_items}")

if __name__ == '__main__':
    main()
