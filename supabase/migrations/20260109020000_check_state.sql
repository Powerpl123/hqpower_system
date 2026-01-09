-- Check current state of inventory

DO $$
DECLARE
  wh_dept_id UUID;
  class_rec RECORD;
  item_count INTEGER;
BEGIN
  SELECT id INTO wh_dept_id FROM public.departments WHERE code IN ('WH', 'WAREHOUSE') LIMIT 1;
  RAISE NOTICE 'Warehouse dept: %', wh_dept_id;

  -- Count total items
  SELECT COUNT(*) INTO item_count FROM public.inventory_items WHERE department_id = wh_dept_id;
  RAISE NOTICE 'Total items in warehouse: %', item_count;

  -- Count items per classification
  FOR class_rec IN 
    SELECT c.name, c.id, COUNT(i.id) as cnt
    FROM public.warehouse_classifications c
    LEFT JOIN public.inventory_items i ON i.classification_id = c.id
    WHERE c.department_id = wh_dept_id
    GROUP BY c.id, c.name
  LOOP
    RAISE NOTICE '  %: % items', class_rec.name, class_rec.cnt;
  END LOOP;

  -- Check items with null classification
  SELECT COUNT(*) INTO item_count FROM public.inventory_items WHERE department_id = wh_dept_id AND classification_id IS NULL;
  RAISE NOTICE 'Items with NULL classification: %', item_count;
END;
$$;
