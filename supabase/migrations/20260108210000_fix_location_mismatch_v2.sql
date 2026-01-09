-- Fix location_id mismatch for warehouse items - FORCE RUN
-- The items have location_id be2cabc5-5f66-4345-b240-a16a356297ab
-- But the visible "Main Storage" folder has ID 357f2aaa-e2d9-4905-b54a-33575db6e3e7

DO $$
DECLARE
  updated_count INTEGER;
BEGIN
  -- Update all items to use the correct location_id
  UPDATE public.inventory_items
  SET location_id = '357f2aaa-e2d9-4905-b54a-33575db6e3e7'
  WHERE location_id = 'be2cabc5-5f66-4345-b240-a16a356297ab';
  
  GET DIAGNOSTICS updated_count = ROW_COUNT;
  RAISE NOTICE 'Updated % items with new location_id', updated_count;

  -- Also delete the orphaned location if it exists
  DELETE FROM public.warehouse_locations
  WHERE id = 'be2cabc5-5f66-4345-b240-a16a356297ab';
  
  RAISE NOTICE 'Cleanup complete';
END;
$$;
