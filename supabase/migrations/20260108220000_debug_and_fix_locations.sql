-- Debug and fix location_id for warehouse items

DO $$
DECLARE
  item_count INTEGER;
  sample_loc_id UUID;
  target_loc_id UUID := '357f2aaa-e2d9-4905-b54a-33575db6e3e7';
  wh_dept_id UUID;
BEGIN
  -- Get Warehouse department
  SELECT id INTO wh_dept_id FROM public.departments WHERE code IN ('WH', 'WAREHOUSE') LIMIT 1;
  RAISE NOTICE 'Warehouse department ID: %', wh_dept_id;

  -- Count items in warehouse
  SELECT COUNT(*) INTO item_count FROM public.inventory_items WHERE department_id = wh_dept_id;
  RAISE NOTICE 'Total items in warehouse: %', item_count;

  -- Get sample location_id from items
  SELECT location_id INTO sample_loc_id FROM public.inventory_items WHERE department_id = wh_dept_id LIMIT 1;
  RAISE NOTICE 'Sample item location_id: %', sample_loc_id;

  -- Count items with target location
  SELECT COUNT(*) INTO item_count FROM public.inventory_items WHERE location_id = target_loc_id;
  RAISE NOTICE 'Items with target location_id: %', item_count;

  -- Count items with NULL location_id
  SELECT COUNT(*) INTO item_count FROM public.inventory_items WHERE department_id = wh_dept_id AND location_id IS NULL;
  RAISE NOTICE 'Items with NULL location_id: %', item_count;

  -- List all distinct location_ids for warehouse items
  RAISE NOTICE 'Distinct location_ids in warehouse items:';
  FOR sample_loc_id IN 
    SELECT DISTINCT location_id FROM public.inventory_items WHERE department_id = wh_dept_id
  LOOP
    SELECT COUNT(*) INTO item_count FROM public.inventory_items WHERE location_id = sample_loc_id;
    RAISE NOTICE '  - %: % items', sample_loc_id, item_count;
  END LOOP;

  -- List all warehouse locations
  RAISE NOTICE 'All warehouse locations:';
  FOR sample_loc_id IN 
    SELECT id FROM public.warehouse_locations WHERE department_id = wh_dept_id
  LOOP
    RAISE NOTICE '  - Location ID: %', sample_loc_id;
  END LOOP;

  -- UPDATE ALL items in warehouse to use the target location
  UPDATE public.inventory_items
  SET location_id = target_loc_id
  WHERE department_id = wh_dept_id;
  
  GET DIAGNOSTICS item_count = ROW_COUNT;
  RAISE NOTICE 'Updated % items to use location_id %', item_count, target_loc_id;
END;
$$;
