import pandas as pd
import uuid
from datetime import datetime
import os
import subprocess
import sys

def escape_sql(text):
    """Escape single quotes for SQL"""
    if pd.isna(text) or text is None:
        return ''
    return str(text).strip().replace("'", "''")

def generate_item_number(prefix, idx):
    """Generate unique item number"""
    return f"{prefix}-{datetime.now().strftime('%Y%m%d')}-{idx:04d}-{uuid.uuid4().hex[:6].upper()}"

def generate_sql_for_file(excel_path, classification_pattern, item_prefix):
    """Generate SQL for a single Excel file"""
    print(f"\n📊 Reading: {os.path.basename(excel_path)}")
    
    df = pd.read_excel(excel_path)
    print(f"   Found {len(df)} rows")
    
    # Find the item name column
    item_col = None
    qty_col = None
    min_qty_col = None
    
    for col in df.columns:
        col_lower = str(col).lower()
        if 'item' in col_lower and 'name' in col_lower:
            item_col = col
        elif 'quantity' in col_lower and 'min' not in col_lower:
            qty_col = col
        elif 'min' in col_lower:
            min_qty_col = col
    
    if item_col is None:
        # Try first column as item name
        item_col = df.columns[0]
    if qty_col is None and len(df.columns) > 1:
        qty_col = df.columns[1]
    if min_qty_col is None and len(df.columns) > 4:
        min_qty_col = df.columns[4]
    
    print(f"   Using columns: item={item_col}, qty={qty_col}, min={min_qty_col}")
    
    sql = f"""-- Import from {os.path.basename(excel_path)}
-- Generated on: {datetime.now().isoformat()}

DO $$
DECLARE
  wh_dept_id UUID;
  target_class_id UUID;
  target_loc_id UUID;
BEGIN
  -- Get Warehouse department
  SELECT id INTO wh_dept_id FROM public.departments WHERE code IN ('WH', 'WAREHOUSE') LIMIT 1;

  IF wh_dept_id IS NULL THEN
    RAISE EXCEPTION 'Warehouse department not found';
  END IF;

  -- Get target classification
  SELECT id INTO target_class_id FROM public.warehouse_classifications
  WHERE department_id = wh_dept_id AND name ILIKE '%{classification_pattern}%' LIMIT 1;

  IF target_class_id IS NULL THEN
    RAISE EXCEPTION 'Classification matching {classification_pattern} not found';
  END IF;

  -- Get or create location
  SELECT id INTO target_loc_id FROM public.warehouse_locations
  WHERE classification_id = target_class_id LIMIT 1;

  IF target_loc_id IS NULL THEN
    INSERT INTO public.warehouse_locations (department_id, classification_id, name)
    VALUES (wh_dept_id, target_class_id, 'Main Storage')
    RETURNING id INTO target_loc_id;
  END IF;

  -- Insert inventory items
"""
    
    items_added = 0
    for idx, row in df.iterrows():
        item_name = escape_sql(row[item_col]) if item_col and pd.notna(row[item_col]) else ''
        if not item_name or len(item_name) < 2:
            continue
        
        quantity = int(row[qty_col]) if qty_col and pd.notna(row[qty_col]) else 0
        min_qty = int(row[min_qty_col]) if min_qty_col and pd.notna(row[min_qty_col]) else 0
        
        item_number = generate_item_number(item_prefix, idx)
        
        sql += f"""  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, '{item_name}', '{item_number}', {quantity}, {min_qty}, 'pcs')
  ON CONFLICT DO NOTHING;

"""
        items_added += 1
    
    sql += """END $$;
"""
    
    print(f"   Generated SQL for {items_added} items")
    return sql, items_added

def save_sql_migration(sql_content, migration_name, timestamp):
    """Save SQL to migration file"""
    base_dir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    migration_file = os.path.join(base_dir, 'supabase', 'migrations', f'{timestamp}_{migration_name}.sql')
    
    with open(migration_file, 'w', encoding='utf-8') as f:
        f.write(sql_content)
    
    print(f"   📁 Saved migration: {os.path.basename(migration_file)}")
    return migration_file
    
    # Clean up temp file
    os.remove(temp_file)
    
    if result.returncode == 0:
        print(f"   ✅ Successfully pushed {migration_name}")
        return True
    else:
        print(f"   ❌ Error pushing {migration_name}")
        print(f"   STDERR: {result.stderr[:500] if result.stderr else 'No error'}")
        return False

def main():
    base_dir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    
    files_config = [
        {
            'file': 'Peat containers.xls',
            'classification': 'Peat Container',
            'prefix': 'PC'
        },
        {
            'file': 'PERSONAL PROTECTIVE ITEMS.xls',
            'classification': 'Personal Protective',
            'prefix': 'PPE'
        },
        {
            'file': 'Spare parts and other materials in peat containers.xls',
            'classification': 'Spare Part',
            'prefix': 'SP'
        },
        {
            'file': 'Warehouse.xls',
            'classification': 'Warehouse Main',
            'prefix': 'WH'
        }
    ]
    
    print("=" * 60)
    print("📦 Inventory Import Tool")
    print("=" * 60)
    
    timestamps = ['20260108170000', '20260108170001', '20260108170002', '20260108170003']
    migration_files = []
    
    for i, config in enumerate(files_config):
        excel_path = os.path.join(base_dir, config['file'])
        
        if not os.path.exists(excel_path):
            print(f"\n⚠️  File not found: {config['file']}")
            continue
        
        sql, count = generate_sql_for_file(
            excel_path,
            config['classification'],
            config['prefix']
        )
        
        migration_name = config['file'].replace('.xls', '').replace(' ', '_').lower()
        migration_file = save_sql_migration(sql, f"import_{migration_name}", timestamps[i])
        migration_files.append(migration_file)
        
        print(f"   ✅ Generated {count} items for {config['classification']}")
        print("-" * 60)
    
    print("\n✅ Migration files generated!")
    print("\nNow run: npx supabase db push")
    print("\nOr run each migration manually with:")
    for f in migration_files:
        print(f"  - {os.path.basename(f)}")

if __name__ == '__main__':
    main()
