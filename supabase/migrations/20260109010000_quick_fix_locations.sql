-- Quick fix: Restore items to their correct locations based on classification

DO $$
DECLARE
  wh_dept_id UUID;
  class_rec RECORD;
  loc_id UUID;
  updated_count INTEGER;
BEGIN
  SELECT id INTO wh_dept_id FROM public.departments WHERE code IN ('WH', 'WAREHOUSE') LIMIT 1;

  -- For each classification, get or create a location and assign items
  FOR class_rec IN SELECT id, name FROM public.warehouse_classifications WHERE department_id = wh_dept_id
  LOOP
    -- Get existing location for this classification
    SELECT id INTO loc_id FROM public.warehouse_locations 
    WHERE classification_id = class_rec.id AND parent_id IS NULL LIMIT 1;
    
    -- If no location exists, create one
    IF loc_id IS NULL THEN
      INSERT INTO public.warehouse_locations (department_id, classification_id, name, description)
      VALUES (wh_dept_id, class_rec.id, 'Main Storage', 'Storage for ' || class_rec.name)
      RETURNING id INTO loc_id;
    END IF;
    
    -- Update items with this classification to use this location
    UPDATE public.inventory_items 
    SET location_id = loc_id 
    WHERE classification_id = class_rec.id AND (location_id IS NULL OR location_id != loc_id);
    
    GET DIAGNOSTICS updated_count = ROW_COUNT;
    RAISE NOTICE 'Classification %: assigned % items to location %', class_rec.name, updated_count, loc_id;
  END LOOP;
  
  RAISE NOTICE 'Done!';
END;
$$;
