import pandas as pd
import uuid
from datetime import datetime

# Configuration for each file
files_config = [
    {
        'filename': 'Peat containers.xls',
        'classification_pattern': '%Peat Container%',
        'migration_name': '20260108160000_import_peat_containers.sql'
    },
    {
        'filename': 'PERSONAL PROTECTIVE ITEMS.xls',
        'classification_pattern': '%Personal Protective%',
        'migration_name': '20260108160001_import_ppe.sql'
    },
    {
        'filename': 'Spare parts and other materials in peat containers.xls',
        'classification_pattern': '%Spare Part%',
        'migration_name': '20260108160002_import_spare_parts.sql'
    },
    {
        'filename': 'Warehouse.xls',
        'classification_pattern': '%Warehouse Main%',
        'migration_name': '20260108160003_import_warehouse_main.sql'
    }
]

def generate_item_number(prefix, index):
    """Generate a unique item number"""
    date_str = datetime.now().strftime('%Y%m%d')
    random_part = str(uuid.uuid4())[:6].upper()
    return f"{prefix}-{date_str}-{index:04d}-{random_part}"

def generate_sql_for_file(config):
    """Generate SQL migration for a single file"""
    filename = config['filename']
    classification_pattern = config['classification_pattern']
    migration_name = config['migration_name']
    
    # Determine prefix from classification
    prefix_map = {
        '%Peat Container%': 'PC',
        '%Personal Protective%': 'PPE',
        '%Spare Part%': 'SP',
        '%Warehouse Main%': 'WH'
    }
    prefix = prefix_map.get(classification_pattern, 'ITM')
    
    # Read Excel
    df = pd.read_excel(filename)
    
    sql_lines = []
    sql_lines.append(f'-- Import from {filename}')
    sql_lines.append(f'-- Generated on: {datetime.now().isoformat()}')
    sql_lines.append(f'-- Total items: {len(df)}')
    sql_lines.append('')
    sql_lines.append('DO $$')
    sql_lines.append('DECLARE')
    sql_lines.append('  wh_dept_id UUID;')
    sql_lines.append('  target_class_id UUID;')
    sql_lines.append('  target_loc_id UUID;')
    sql_lines.append('BEGIN')
    sql_lines.append("  -- Get Warehouse department")
    sql_lines.append("  SELECT id INTO wh_dept_id FROM public.departments WHERE code IN ('WH', 'WAREHOUSE') LIMIT 1;")
    sql_lines.append('')
    sql_lines.append('  IF wh_dept_id IS NULL THEN')
    sql_lines.append("    RAISE EXCEPTION 'Warehouse department not found';")
    sql_lines.append('  END IF;')
    sql_lines.append('')
    sql_lines.append('  -- Get target classification')
    sql_lines.append('  SELECT id INTO target_class_id FROM public.warehouse_classifications')
    sql_lines.append(f"  WHERE department_id = wh_dept_id AND name ILIKE '{classification_pattern}' LIMIT 1;")
    sql_lines.append('')
    sql_lines.append('  IF target_class_id IS NULL THEN')
    sql_lines.append(f"    RAISE EXCEPTION 'Classification matching {classification_pattern} not found';")
    sql_lines.append('  END IF;')
    sql_lines.append('')
    sql_lines.append('  -- Get or create location')
    sql_lines.append('  SELECT id INTO target_loc_id FROM public.warehouse_locations')
    sql_lines.append('  WHERE classification_id = target_class_id AND parent_id IS NULL LIMIT 1;')
    sql_lines.append('')
    sql_lines.append('  IF target_loc_id IS NULL THEN')
    sql_lines.append('    INSERT INTO public.warehouse_locations (department_id, classification_id, name)')
    sql_lines.append("    VALUES (wh_dept_id, target_class_id, 'Main Storage')")
    sql_lines.append('    RETURNING id INTO target_loc_id;')
    sql_lines.append('  END IF;')
    sql_lines.append('')
    sql_lines.append('  -- Insert inventory items')
    
    item_count = 0
    for idx, row in df.iterrows():
        item_name = str(row['Item name']).strip() if pd.notna(row['Item name']) else ''
        if not item_name or item_name == 'nan':
            continue
        
        # Escape single quotes for SQL
        item_name_escaped = item_name.replace("'", "''")
        quantity = int(row['Quantity']) if pd.notna(row['Quantity']) and str(row['Quantity']) != 'nan' else 0
        min_qty = int(row['Min.Quantity']) if pd.notna(row['Min.Quantity']) and str(row['Min.Quantity']) != 'nan' else 0
        unit = str(row['Unit of Measure']).strip() if pd.notna(row['Unit of Measure']) and str(row['Unit of Measure']) != 'nan' else 'pcs'
        if unit == 'nan' or not unit:
            unit = 'pcs'
        unit_escaped = unit.replace("'", "''")
        
        item_number = generate_item_number(prefix, item_count)
        
        sql_lines.append(f"  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)")
        sql_lines.append(f"  VALUES (wh_dept_id, target_class_id, target_loc_id, '{item_name_escaped}', '{item_number}', {quantity}, {min_qty}, '{unit_escaped}')")
        sql_lines.append(f"  ON CONFLICT DO NOTHING;")
        sql_lines.append('')
        
        item_count += 1
    
    sql_lines.append('END $$;')
    
    # Write to file
    output_path = f'supabase/migrations/{migration_name}'
    with open(output_path, 'w', encoding='utf-8') as f:
        f.write('\n'.join(sql_lines))
    
    print(f'✓ Generated {migration_name} with {item_count} items')
    return item_count

# Generate SQL for all files
total_items = 0
for config in files_config:
    try:
        count = generate_sql_for_file(config)
        total_items += count
    except Exception as e:
        print(f'✗ Error processing {config["filename"]}: {e}')

print(f'\n=== Total: {total_items} items across {len(files_config)} files ===')
