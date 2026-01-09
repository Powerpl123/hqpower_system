#!/usr/bin/env python3
"""Generate SQL import for Warehouse.csv items"""

import csv
import hashlib
from datetime import datetime
import os

def escape_sql(text):
    """Escape single quotes for SQL"""
    if text is None:
        return ''
    return text.replace("'", "''").strip()

def generate_item_number(index, name):
    """Generate unique item number"""
    hash_suffix = hashlib.md5(f'{name}{index}'.encode()).hexdigest()[:6].upper()
    return f'WH-{datetime.now().strftime("%Y%m%d")}-{index:04d}-{hash_suffix}'

def parse_quantity(value):
    """Parse quantity value, handling decimals"""
    try:
        return int(float(value.replace(',', '')))
    except (ValueError, AttributeError):
        return 0

def main():
    input_file = os.path.join(os.path.dirname(__file__), '..', 'Warehouse.csv')
    output_file = os.path.join(os.path.dirname(__file__), '..', 'supabase', 'migrations', '20260108180000_reimport_warehouse.sql')
    
    items = []
    
    # Read CSV file
    with open(input_file, 'r', encoding='latin-1') as f:
        reader = csv.reader(f)
        header = next(reader)  # Skip header
        
        for idx, row in enumerate(reader):
            if not row or not row[0].strip():
                continue
            
            item_name = escape_sql(row[0])
            quantity = parse_quantity(row[1]) if len(row) > 1 else 0
            unit = escape_sql(row[2]) if len(row) > 2 and row[2].strip() else 'pcs'
            min_quantity = parse_quantity(row[4]) if len(row) > 4 else 0
            
            item_number = generate_item_number(idx, item_name)
            
            items.append({
                'item_name': item_name,
                'item_number': item_number,
                'quantity': quantity,
                'min_quantity': min_quantity,
                'unit': unit or 'pcs'
            })
    
    # Generate SQL
    sql = f"""-- Reimport Warehouse.csv items
-- Generated on: {datetime.now().isoformat()}
-- Total items: {len(items)}

-- First, delete existing Warehouse Main items to avoid duplicates
DELETE FROM public.inventory_items 
WHERE department_id = (SELECT id FROM public.departments WHERE code IN ('WH', 'WAREHOUSE') LIMIT 1)
AND classification_id IN (
  SELECT id FROM public.warehouse_classifications 
  WHERE name ILIKE '%Warehouse Main%' OR name ILIKE '%Main Storage%'
);

DO $$
DECLARE
  wh_dept_id UUID;
  target_class_id UUID;
  target_loc_id UUID;
BEGIN
  -- Get Warehouse department
  SELECT id INTO wh_dept_id FROM public.departments WHERE code IN ('WH', 'WAREHOUSE') LIMIT 1;

  IF wh_dept_id IS NULL THEN
    RAISE EXCEPTION 'Warehouse department not found. Make sure a department with code WH or WAREHOUSE exists.';
  END IF;

  -- Create or get "Warehouse Main" classification
  SELECT id INTO target_class_id FROM public.warehouse_classifications
  WHERE department_id = wh_dept_id AND name = 'Warehouse Main' LIMIT 1;

  IF target_class_id IS NULL THEN
    INSERT INTO public.warehouse_classifications (department_id, name, description, color)
    VALUES (wh_dept_id, 'Warehouse Main', 'Main warehouse storage', '#F59E0B')
    RETURNING id INTO target_class_id;
    RAISE NOTICE 'Created Warehouse Main classification';
  END IF;

  -- Create or get "Main Storage" location
  SELECT id INTO target_loc_id FROM public.warehouse_locations
  WHERE classification_id = target_class_id AND name = 'Main Storage' LIMIT 1;

  IF target_loc_id IS NULL THEN
    INSERT INTO public.warehouse_locations (department_id, classification_id, name, description)
    VALUES (wh_dept_id, target_class_id, 'Main Storage', 'Main warehouse storage location')
    RETURNING id INTO target_loc_id;
    RAISE NOTICE 'Created Main Storage location';
  END IF;

  RAISE NOTICE 'Warehouse dept: %, Classification: %, Location: %', wh_dept_id, target_class_id, target_loc_id;

  -- Insert inventory items
"""
    
    # Add each item
    for item in items:
        sql += f"""
  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, '{item['item_name']}', '{item['item_number']}', {item['quantity']}, {item['min_quantity']}, '{item['unit']}')
  ON CONFLICT (department_id, item_number) DO UPDATE SET
    item_name = EXCLUDED.item_name,
    quantity = EXCLUDED.quantity,
    min_quantity = EXCLUDED.min_quantity,
    unit = EXCLUDED.unit,
    classification_id = EXCLUDED.classification_id,
    location_id = EXCLUDED.location_id;
"""
    
    sql += """
  RAISE NOTICE 'Import complete! Inserted/updated items.';
END;
$$;
"""
    
    # Write output file
    with open(output_file, 'w', encoding='utf-8') as f:
        f.write(sql)
    
    print(f"Generated SQL file: {output_file}")
    print(f"Total items: {len(items)}")

if __name__ == '__main__':
    main()
