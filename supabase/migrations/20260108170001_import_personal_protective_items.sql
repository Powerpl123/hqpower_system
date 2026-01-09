-- Import from PERSONAL PROTECTIVE ITEMS.xls
-- Generated on: 2026-01-08T14:51:20.640223

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
  WHERE department_id = wh_dept_id AND name ILIKE '%Personal Protective%' LIMIT 1;

  IF target_class_id IS NULL THEN
    RAISE EXCEPTION 'Classification matching Personal Protective not found';
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
  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Sheet metal cutter (Big)', 'PPE-20260108-0000-DAE61B', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'keyboard for desktop', 'PPE-20260108-0001-32609F', 4, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, '1.5Mm allen key', 'PPE-20260108-0002-C468DF', 7, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, '12V, 9Ah battery for UPS', 'PPE-20260108-0003-A2E20E', 3, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, '18V 5Ah battery for Makita tools', 'PPE-20260108-0004-A0720E', 32, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, '3 layer fike tray', 'PPE-20260108-0005-1B432A', 3, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, '3M organic vapor cartridge', 'PPE-20260108-0006-8D2524', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, '3M protective eye wear', 'PPE-20260108-0007-A87631', 134, 20, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, '3M respirator', 'PPE-20260108-0008-FAB16F', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, '3M safety eye glasses', 'PPE-20260108-0009-03E622', 10, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, '3V Button battery Panasonic 2032', 'PPE-20260108-0010-D26BD2', 1, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, '9 volt batteries', 'PPE-20260108-0011-5EC4B8', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, '9V batteries', 'PPE-20260108-0012-E15A8E', 0, 5, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'A-4 printing paper', 'PPE-20260108-0013-66332C', 17, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'A3 paper', 'PPE-20260108-0014-780833', 31, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'A4 size file', 'PPE-20260108-0015-F53578', 0, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'AA batteries', 'PPE-20260108-0016-8C9CCD', 43, 10, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'AAA batteries', 'PPE-20260108-0017-4B131D', 24, 10, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'AP-310-MNT-W3 Mount kit', 'PPE-20260108-0018-7DC839', 6, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Abek gas mask', 'PPE-20260108-0019-B07330', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Adjustable plier wrench', 'PPE-20260108-0020-2252F6', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Adjustable plier wrench', 'PPE-20260108-0021-D0BB8A', 6, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Adjustable plier wrench', 'PPE-20260108-0022-9B2905', 7, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Adjustable plier wrench', 'PPE-20260108-0023-A6F152', 7, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Adjustable plier wrench 8710180', 'PPE-20260108-0024-C05DBA', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Adjustable spanner size 450Mm', 'PPE-20260108-0025-7F92D1', 12, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Adjustable wrench 6"', 'PPE-20260108-0026-60EC9F', 49, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Adjustable wrench size 600Mm', 'PPE-20260108-0027-0476C1', 12, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Air dust gun', 'PPE-20260108-0028-389673', 8, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Air hammer', 'PPE-20260108-0029-0557B7', 3, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Air hose with gauge', 'PPE-20260108-0030-D118F1', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Air impact wrench 1"', 'PPE-20260108-0031-052EAE', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Air impact wrench 1/2"', 'PPE-20260108-0032-6F7D2C', 3, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Air impact wrench 3/4"', 'PPE-20260108-0033-297F63', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Air impact wrench 3/8"', 'PPE-20260108-0034-0D9B35', 3, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Air rachet wrench D3', 'PPE-20260108-0035-79E5E6', 5, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Air rachet wrench D4', 'PPE-20260108-0036-5B2A4A', 8, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Alkaline D batteries', 'PPE-20260108-0037-2E9DE6', 9, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Allen hex bit 18Mm', 'PPE-20260108-0038-79512E', 3, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Allen hex bit 18Mm', 'PPE-20260108-0039-A57FC8', 8, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Allen hex bit 19Mm', 'PPE-20260108-0040-C30C06', 10, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Allen hex bit 21Mm', 'PPE-20260108-0041-08D1BB', 8, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Allen hex bit 22Mm', 'PPE-20260108-0042-F27238', 8, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Allen hex bit 23Mm', 'PPE-20260108-0043-0F059E', 8, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Allen hex bit 24Mm', 'PPE-20260108-0044-3F7832', 8, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Allen key size 4.5', 'PPE-20260108-0045-62FB49', 7, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Allen key wrench size 17', 'PPE-20260108-0046-C69976', 6, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Allen key wrench size 19', 'PPE-20260108-0047-65D513', 7, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Allen wrench', 'PPE-20260108-0048-698F5A', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Allen wrench 4Mm', 'PPE-20260108-0049-A38BCD', 7, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Allen wrench 5Mm', 'PPE-20260108-0050-CFC4EA', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Allen wrench 5Mm', 'PPE-20260108-0051-323910', 6, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Allen wrench 6Mm', 'PPE-20260108-0052-04388A', 7, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Allen wrench 8Mm', 'PPE-20260108-0053-69FC0D', 3, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Allen wrench set 1.5-10Mm', 'PPE-20260108-0054-876886', 3, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Allen wrench set 1.5-5Mm', 'PPE-20260108-0055-A0047C', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Aluminium bracket', 'PPE-20260108-0056-146947', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Aluminium ladder', 'PPE-20260108-0057-36CFDE', 3, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Aluminium ladder 6 Meters', 'PPE-20260108-0058-3C8E5F', 3, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Angel meter 180°', 'PPE-20260108-0059-CF80FD', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Angle grinder 125Mm in use', 'PPE-20260108-0060-15B074', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Angle grinder 230Mm in use', 'PPE-20260108-0061-F41737', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Angle measurer', 'PPE-20260108-0062-8DD9D5', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Arc flash suit', 'PPE-20260108-0063-0253EC', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Aruba 1000BASE-T RJ45 CONNECTOR', 'PPE-20260108-0064-3F225A', 24, 5, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Aruba RJ45 switch', 'PPE-20260108-0065-169828', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Aruba access point', 'PPE-20260108-0066-B7B36E', 4, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Auto spray paint', 'PPE-20260108-0067-35AF73', 3, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Automatic voltage regulator 1500W', 'PPE-20260108-0068-E8999B', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Badminton net', 'PPE-20260108-0069-DA944F', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Bandage', 'PPE-20260108-0070-E36C65', 4, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Bandage', 'PPE-20260108-0071-1BBEE8', 72, 12, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Battery adapter Makita to Milwaukee', 'PPE-20260108-0072-246BE7', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Battery operated crimping machine', 'PPE-20260108-0073-39AE7F', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Battery operated soap dispenser', 'PPE-20260108-0074-428E58', 7, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Bearing puller', 'PPE-20260108-0075-465C00', 10, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Bearing puller 100-1', 'PPE-20260108-0076-5A856C', 3, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Bearing puller 100-2', 'PPE-20260108-0077-7CBBCB', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Bearing puller 100-2', 'PPE-20260108-0078-FA478B', 3, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Bearing puller 116-1', 'PPE-20260108-0079-ECD2CB', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Bearing puller 116-2', 'PPE-20260108-0080-34761E', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Bearing puller 136-3', 'PPE-20260108-0081-62D8DF', 3, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Bearing puller 136-7', 'PPE-20260108-0082-C9606B', 6, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Bearing puller 143-30', 'PPE-20260108-0083-2B0C0B', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Bearing puller 4551-A', 'PPE-20260108-0084-56A88A', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Bearing puller 4551-C', 'PPE-20260108-0085-F60C2E', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Bearing puller 4552-1', 'PPE-20260108-0086-8F5928', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Bearing puller 4552-2', 'PPE-20260108-0087-85FF66', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Belt 5,3 and 2 ton rated', 'PPE-20260108-0088-92FAAC', 3, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Belt rated for 1 ton', 'PPE-20260108-0089-0548D3', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Belt rated for 2 ton', 'PPE-20260108-0090-9D4CA9', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Belt rated for 5 ton', 'PPE-20260108-0091-744993', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Big hammer', 'PPE-20260108-0092-7A87C4', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Big loto box (new)', 'PPE-20260108-0093-5EA038', 11, 4, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Big loto key box (used)', 'PPE-20260108-0094-859C62', 13, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Black Safety glasses', 'PPE-20260108-0095-53A419', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Black safety eye glasses', 'PPE-20260108-0096-635399', 34, 5, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Broken bolt extractor', 'PPE-20260108-0097-328999', 3, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Buckets', 'PPE-20260108-0098-93BC23', 3, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Butterfly screw and plastic dowels 5-10Mm', 'PPE-20260108-0099-9A8C23', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Cable cutter', 'PPE-20260108-0100-2A2728', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Cable cutter', 'PPE-20260108-0101-812609', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Cable end connector', 'PPE-20260108-0102-860427', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Cable lockout', 'PPE-20260108-0103-0EEC4D', 3, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Cable peeler', 'PPE-20260108-0104-E3DEC1', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Cable reel/extension cable', 'PPE-20260108-0105-CFF192', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Cable stripping knife', 'PPE-20260108-0106-F1AC93', 4, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Calculator', 'PPE-20260108-0107-E43266', 7, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Card holder', 'PPE-20260108-0108-5C6095', 0, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Cassette for sticker printer machine 24Mm', 'PPE-20260108-0109-14D475', 16, 4, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Cassette for sticker printer machine 6Mm', 'PPE-20260108-0110-C56E3A', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Cassette for sticker printer machine 9Mm', 'PPE-20260108-0111-681C32', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Cassette for sticker printer machine 9Mm', 'PPE-20260108-0112-45D886', 13, 4, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Cassette tape for sticker printing machine 24Mm', 'PPE-20260108-0113-4FD6AA', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Center drill', 'PPE-20260108-0114-A9C855', 1, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Center punch', 'PPE-20260108-0115-38635E', 6, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Center punch', 'PPE-20260108-0116-9EBF4B', 11, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Chain block', 'PPE-20260108-0117-521926', 3, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Chain for chain block', 'PPE-20260108-0118-F19D7E', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Chalk line 30 Meters', 'PPE-20260108-0119-ECAD19', 4, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Chalk line ink', 'PPE-20260108-0120-1F67E7', 4, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Chemical gas mask', 'PPE-20260108-0121-FBE8C2', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Chemical hand gloves', 'PPE-20260108-0122-A6480E', 0, 5, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Chemical resistant aprons', 'PPE-20260108-0123-AAF11A', 17, 4, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Chemical resistant boots 38', 'PPE-20260108-0124-743FA2', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Chemical resistant boots 40', 'PPE-20260108-0125-BA2B72', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Chemical resistant boots 41', 'PPE-20260108-0126-3F79F8', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Chemical resistant boots 42', 'PPE-20260108-0127-E54A3C', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Chemical resistant boots 43', 'PPE-20260108-0128-61FCFB', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Chemical resistant boots 44', 'PPE-20260108-0129-76AD52', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Chemical resistant boots 45', 'PPE-20260108-0130-EE8257', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Chemical resistant hand gloves', 'PPE-20260108-0131-166F02', 0, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Chemical resistant hand gloves', 'PPE-20260108-0132-C01835', 3, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Chemical resistant hand gloves', 'PPE-20260108-0133-144E11', 8, 5, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Chemical resistant overall L', 'PPE-20260108-0134-6D39EB', 6, 5, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Chemical resistant overall M', 'PPE-20260108-0135-CA4FCD', 14, 5, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Chemical resistant overalls', 'PPE-20260108-0136-B7C5C0', 13, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Chisel', 'PPE-20260108-0137-4C6A8F', 3, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Chisel 21x150Mm', 'PPE-20260108-0138-27E8F9', 5, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Chisel 24x175Mm', 'PPE-20260108-0139-5678E4', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Chisel 3740-100', 'PPE-20260108-0140-10512E', 3, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Chisel 3740-300', 'PPE-20260108-0141-EA241B', 6, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Chisel 7Mm', 'PPE-20260108-0142-82A2E9', 8, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Chisel sharpening stone', 'PPE-20260108-0143-1D85FB', 6, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Circle cutter', 'PPE-20260108-0144-7B275D', 4, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Circlip plier', 'PPE-20260108-0145-CECE47', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Circlip plier bent tip 85-140Mm', 'PPE-20260108-0146-E46857', 10, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Circlip pliers bent tip 19-60Mm', 'PPE-20260108-0147-FDFFCF', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Circlip pliers bent tip 19-60Mm', 'PPE-20260108-0148-8A8215', 4, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Circlip pliers bent tip 3-10Mm', 'PPE-20260108-0149-8E65BD', 10, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Circlip pliers bent tip 40-100Mm', 'PPE-20260108-0150-2C78F5', 4, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Circlip pliers straight tip 12-25Mm', 'PPE-20260108-0151-B73198', 9, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Circlip pliers straight tip 19-60Mm', 'PPE-20260108-0152-1FE15A', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Circlip pliers straight tip 40-100Mm', 'PPE-20260108-0153-E91DB7', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Circlip pliers straight tip 8-13Mm', 'PPE-20260108-0154-11EA4B', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Circlip pliers straight tip 85-140Mm', 'PPE-20260108-0155-B25959', 8, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Circular saw 235Mm', 'PPE-20260108-0156-E970B3', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Clear eye glasses', 'PPE-20260108-0157-AF8F85', 0, 20, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Clear eye glasses (used)', 'PPE-20260108-0158-E150DF', 20, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Clear face shield', 'PPE-20260108-0159-56F266', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Clear safety eye glasses', 'PPE-20260108-0160-4110F7', 11, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Clear safety eye glasses', 'PPE-20260108-0161-EC683F', 141, 5, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Clear safety glasses', 'PPE-20260108-0162-DFDC10', 7, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Clear sheet protectors', 'PPE-20260108-0163-082F53', 195, 25, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Clear tape 12Mm', 'PPE-20260108-0164-1E5DF2', 11, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Clip - On ear muffs / defenders', 'PPE-20260108-0165-5A606A', 1, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Cloth hanging stand', 'PPE-20260108-0166-6B18D2', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Coffe FIlter', 'PPE-20260108-0167-88EE8A', 80, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Color chalk', 'PPE-20260108-0168-53CF60', 80, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Color index size A4', 'PPE-20260108-0169-49CFF1', 11, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Combination metal file', 'PPE-20260108-0170-D5C59C', 3, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Combination screw driver (in use)', 'PPE-20260108-0171-C7CA12', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Combination spanner 10-32', 'PPE-20260108-0172-9E6A0C', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Combination spanner size 21', 'PPE-20260108-0173-6D441A', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Combination spanner size 22', 'PPE-20260108-0174-A56550', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Combination spanner size 24', 'PPE-20260108-0175-DAF42A', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Combination spanner size 30', 'PPE-20260108-0176-5222FC', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Combination spanner size 32', 'PPE-20260108-0177-C0F206', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Combination spanner size 36', 'PPE-20260108-0178-FFDF1D', 3, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Combination spanner size 41', 'PPE-20260108-0179-652C08', 5, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Combination spanner size 46', 'PPE-20260108-0180-54CF37', 4, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Combination spanner size 50', 'PPE-20260108-0181-C29D84', 4, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Combination spanner size 55', 'PPE-20260108-0182-DDD0BF', 4, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Combination spanner size 60', 'PPE-20260108-0183-6F47D3', 4, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Combination spanner size 65', 'PPE-20260108-0184-13EF23', 4, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Combination spanner size 70', 'PPE-20260108-0185-56123A', 4, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Combination wrench 6-32Mm', 'PPE-20260108-0186-7AF4C5', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Compilation wrench 6 - 32', 'PPE-20260108-0187-52ED30', 10, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Complete toolbox', 'PPE-20260108-0188-B94455', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Concrete drill bit 5-12Mm', 'PPE-20260108-0189-437D64', 4, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Cordless circular saw', 'PPE-20260108-0190-3C3C47', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Cordless metal cutter', 'PPE-20260108-0191-E2008C', 3, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Correction fluid', 'PPE-20260108-0192-32D983', 7, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Crimp assortment set', 'PPE-20260108-0193-1DBC81', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Crimping pliers', 'PPE-20260108-0194-3B0988', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Crimping pliers 975220', 'PPE-20260108-0195-45A396', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Crimping pliers 975230', 'PPE-20260108-0196-D688F6', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Crimping pliers for internet cable 200Mm', 'PPE-20260108-0197-471344', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Crimping tool set', 'PPE-20260108-0198-315A75', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Crosby for scale', 'PPE-20260108-0199-38202D', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Crowbar with rubber grip', 'PPE-20260108-0200-D1A478', 8, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'DJI phantom drone', 'PPE-20260108-0201-A50EDF', 0, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'DStv receiver', 'PPE-20260108-0202-D2C1CE', 4, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Deep socket size 16 and 21', 'PPE-20260108-0203-006949', 6, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Depth gauge 0-200Mm', 'PPE-20260108-0204-26E960', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Diagonal/stive cutter', 'PPE-20260108-0205-359916', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Digital angle measurer', 'PPE-20260108-0206-F31649', 5, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Digital caliper', 'PPE-20260108-0207-C740DE', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Digital micro meter', 'PPE-20260108-0208-5B05C2', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Digital micro meter', 'PPE-20260108-0209-6FFB5F', 4, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Digital micro meter 0-35Mm', 'PPE-20260108-0210-9B5037', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Digital micro meter 25-50Mm', 'PPE-20260108-0211-12C389', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Digital micro meter 75-100Mm', 'PPE-20260108-0212-4B40B9', 4, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Dimmed sheet protectors', 'PPE-20260108-0213-5E065B', 60, 10, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Disc wallet', 'PPE-20260108-0214-D8F287', 6, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Disposable alcohol tester', 'PPE-20260108-0215-4E3A03', 755, 50, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Disposable dust mask -  comfort mask', 'PPE-20260108-0216-9D4942', 450, 100, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Disposable overall', 'PPE-20260108-0217-383129', 0, 5, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Diver oxygen tank with accessories', 'PPE-20260108-0218-DDBF0F', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Door stopper', 'PPE-20260108-0219-0689B7', 9, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Drill bit 8Mm and 4Mm', 'PPE-20260108-0220-A33F19', 3, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Duble open end wrench 10-32Mm', 'PPE-20260108-0221-38FEEF', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Duct tape', 'PPE-20260108-0222-39A375', 22, 4, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Duracell C2 batteries', 'PPE-20260108-0223-2C8512', 15, 6, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Dust mask', 'PPE-20260108-0224-F04663', 0, 50, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Dust mask N95', 'PPE-20260108-0225-3F45C5', 0, 150, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Ear muffs', 'PPE-20260108-0226-E28D7D', 36, 5, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Earplugs', 'PPE-20260108-0227-8BF6F7', 134, 15, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Earplugs', 'PPE-20260108-0228-54A241', 255, 50, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Earplugs', 'PPE-20260108-0229-71A5A4', 260, 25, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Earplugs', 'PPE-20260108-0230-74F479', 647, 50, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Earplugs (1 time use)', 'PPE-20260108-0231-9A40CA', 1918, 100, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Electric greasing gun', 'PPE-20260108-0232-EBC857', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Electric resistant hand gloves', 'PPE-20260108-0233-C0C712', 3, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Electric resistant hand gloves', 'PPE-20260108-0234-51966B', 9, 4, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Electrical resistant hand gloves', 'PPE-20260108-0235-1A218F', 8, 4, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Electrican''s knife', 'PPE-20260108-0236-AEF989', 5, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Envelope', 'PPE-20260108-0237-8CBF73', 65, 10, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Envelope size A4', 'PPE-20260108-0238-82B869', 138, 25, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Examination hand gloves', 'PPE-20260108-0239-88CF5A', 80, 25, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Extension cable', 'PPE-20260108-0240-5C43CD', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Extension cable 25 Meters', 'PPE-20260108-0241-2C7AA3', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Extractor', 'PPE-20260108-0242-DB5D8B', 5, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Eye bolt M10', 'PPE-20260108-0243-C3DB03', 4, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Eye bolt M12', 'PPE-20260108-0244-CAD123', 3, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Eye bolt M16', 'PPE-20260108-0245-1F5FA4', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Eye bolt M24', 'PPE-20260108-0246-08690E', 4, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Eye bolt M30', 'PPE-20260108-0247-0EC859', 4, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Eye bolt M6', 'PPE-20260108-0248-63731E', 4, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Eye bolt M8', 'PPE-20260108-0249-1BD27C', 4, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Face shield (used)', 'PPE-20260108-0250-E6452C', 20, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Feeler gauge', 'PPE-20260108-0251-2E24D8', 20, 5, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Feeler gauge', 'PPE-20260108-0252-559228', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Fiber cord', 'PPE-20260108-0253-21BB0E', 94, 10, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Fiber cord coupler', 'PPE-20260108-0254-850F1D', 44, 10, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'File', 'PPE-20260108-0255-04C7DF', 6, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'File folder', 'PPE-20260108-0256-554D79', 32, 5, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'File set small size', 'PPE-20260108-0257-878E5B', 3, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Filter kit P/DP', 'PPE-20260108-0258-622809', 4, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Fire blanket', 'PPE-20260108-0259-76E97E', 0, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Fire blankets', 'PPE-20260108-0260-85558E', 3, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Fire buckets', 'PPE-20260108-0261-1F1468', 3, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Fire extinguisher outlet hose', 'PPE-20260108-0262-45BDAA', 10, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Fire extinguisher outlet hose', 'PPE-20260108-0263-0D7FFB', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Fire fighting overall', 'PPE-20260108-0264-913ABB', 3, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Fire house cabinet', 'PPE-20260108-0265-17B2E6', 1, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Flare wrench', 'PPE-20260108-0266-745559', 3, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Flare wrench 12Mm', 'PPE-20260108-0267-467A2B', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Flare wrench 13Mm', 'PPE-20260108-0268-ADA5F8', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Flare wrench 14Mm', 'PPE-20260108-0269-173A6E', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Flare wrench 15Mm', 'PPE-20260108-0270-24E24A', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Flash light', 'PPE-20260108-0271-0FE837', 8, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Flat file size A4', 'PPE-20260108-0272-3E061A', 11, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Flat metal file', 'PPE-20260108-0273-4C78A0', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Flexible magnetic pick up tool', 'PPE-20260108-0274-91460D', 3, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Flexible protective eye wear', 'PPE-20260108-0275-61090B', 77, 20, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Gad mask 7000', 'PPE-20260108-0276-61FF85', 6, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Garbage bag', 'PPE-20260108-0277-3FDE3E', 5, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Garbage bags', 'PPE-20260108-0278-97F41C', 4, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Gas mask filter', 'PPE-20260108-0279-3202B7', 33, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Gasoline operated soldering iron', 'PPE-20260108-0280-5D5306', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Gloves alphatec 37', 'PPE-20260108-0281-877617', 14, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Glue stick', 'PPE-20260108-0282-E1C0FA', 8, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Glue stick', 'PPE-20260108-0283-DDA665', 10, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Grabber pliers', 'PPE-20260108-0284-A9AC58', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Grease gun nozzle', 'PPE-20260108-0285-16FFDB', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Greasing gun / Manual', 'PPE-20260108-0286-EF1456', 3, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Grip locking pliers', 'PPE-20260108-0287-00C2A5', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Gumboots', 'PPE-20260108-0288-590FEC', 66, 10, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Gumboots 39', 'PPE-20260108-0289-8E1E0D', 5, 5, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Gumboots 40', 'PPE-20260108-0290-11E479', 9, 5, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Gumboots 41', 'PPE-20260108-0291-294633', 60, 10, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Gumboots 42', 'PPE-20260108-0292-098C04', 72, 10, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Gumboots 43', 'PPE-20260108-0293-A5AFA3', 20, 5, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Gumboots 45', 'PPE-20260108-0294-1F8EFE', 4, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'HDMI cable', 'PPE-20260108-0295-5EC7C9', 0, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'HDMI cable', 'PPE-20260108-0296-D5AA34', 0, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'HDMI splitter (only adapter)', 'PPE-20260108-0297-B31013', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Half face mask (used)', 'PPE-20260108-0298-15268C', 9, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hammer 0.25 Kg', 'PPE-20260108-0299-06D758', 4, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hammer 0.3 Kg', 'PPE-20260108-0300-5AF24C', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hammer 1Kg', 'PPE-20260108-0301-93ABE5', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hand gloves', 'PPE-20260108-0302-9A0720', 45, 6, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hand gloves', 'PPE-20260108-0303-DDF323', 46, 6, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hand gloves', 'PPE-20260108-0304-322C57', 77, 10, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hand gloves', 'PPE-20260108-0305-0E17E1', 89, 10, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hand gloves', 'PPE-20260108-0306-747E99', 331, 50, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hand lamp', 'PPE-20260108-0307-C455A2', 9, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hand pressing machine', 'PPE-20260108-0308-A4675B', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hand sanitizer', 'PPE-20260108-0309-A4F1A4', 5, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hand shield', 'PPE-20260108-0310-B3D311', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Handsaw', 'PPE-20260108-0311-60818F', 17, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Head mounted flash light', 'PPE-20260108-0312-E7B689', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Head mounted flash ligt', 'PPE-20260108-0313-325139', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Head protection cloth', 'PPE-20260108-0314-F27DC6', 10, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hearing protector for helmet', 'PPE-20260108-0315-309A8B', 8, 4, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Heat resistant hand gloves', 'PPE-20260108-0316-14B9CD', 3, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Heat shrink 2.4/1.2 Mm - 6.4/3.2 Mm', 'PPE-20260108-0317-FD3799', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Heavy duty ring wrench 36-60', 'PPE-20260108-0318-B6F033', 3, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Helmet (used)', 'PPE-20260108-0319-587B12', 15, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Helmet mounted eye shield', 'PPE-20260108-0320-23CD90', 24, 5, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Helmet mounted hearing protector', 'PPE-20260108-0321-1C8575', 7, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Helmet strap', 'PPE-20260108-0322-83E33A', 69, 10, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hexagonal impact wrench 120-95Mm', 'PPE-20260108-0323-BDD844', 15, 15, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hexagonal impact wrench for allen bolts different sizes', 'PPE-20260108-0324-19A418', 30, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hexagonal socket spanner 10-21', 'PPE-20260108-0325-B6DA48', 7, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hexagonal socket spanner 22-50', 'PPE-20260108-0326-A18178', 10, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hexagonal socket spanner 45-80', 'PPE-20260108-0327-16A0D4', 3, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'High strength nail puller', 'PPE-20260108-0328-FBF8B9', 12, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Highlighter', 'PPE-20260108-0329-4D9874', 4, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hole punch', 'PPE-20260108-0330-39E84B', 4, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Honeywell falcon edge', 'PPE-20260108-0331-906639', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hummer 0.34 Kg', 'PPE-20260108-0332-4F2D71', 3, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hummer 0.5 Kg', 'PPE-20260108-0333-94D0CD', 4, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hydraulic jack', 'PPE-20260108-0334-94AD71', 3, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Impact socket 55Mm', 'PPE-20260108-0335-B1E4B0', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Impact socket 80Mm', 'PPE-20260108-0336-4078C3', 3, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Impact wrench 12.7Mm in use', 'PPE-20260108-0337-4AB10D', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Indoor slippers 41', 'PPE-20260108-0338-71E957', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Indoor slippers 43', 'PPE-20260108-0339-A52367', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Industrial scale 50000Kg', 'PPE-20260108-0340-1F932D', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Inspection mirror Ø30Mm', 'PPE-20260108-0341-9667F0', 3, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Insulated T handle hex key, rated for 1000V', 'PPE-20260108-0342-52DF68', 4, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Insulation tape', 'PPE-20260108-0343-DC9896', 7, 4, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Internet cable', 'PPE-20260108-0344-65D3C4', 8, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Internet cable', 'PPE-20260108-0345-9D428F', 14, 4, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Internet cable 10 Meters long', 'PPE-20260108-0346-3B2115', 18, 4, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Internet cable jack/connector', 'PPE-20260108-0347-46C5E2', 48, 10, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Jumper for security employees 2XL', 'PPE-20260108-0348-2C8F43', 4, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Jumper for security employees 3XL', 'PPE-20260108-0349-FDF8EE', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Jumper for security employees L', 'PPE-20260108-0350-32C3C3', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Jumper for security employees XL', 'PPE-20260108-0351-4B2F9F', 4, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Key chain', 'PPE-20260108-0352-DF792E', 81, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Kitchen knife', 'PPE-20260108-0353-436C46', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Kitchen shoes (used)', 'PPE-20260108-0354-54FF3D', 6, 4, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Kitchen shoes 38', 'PPE-20260108-0355-A212DB', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Kitchen shoes 41', 'PPE-20260108-0356-051A2C', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Kitchen shoes 42', 'PPE-20260108-0357-9EC816', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Knipex size 4-1/2"', 'PPE-20260108-0358-8059F2', 10, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Laminating punch film', 'PPE-20260108-0359-31B176', 406, 25, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Laser printer cartridge 126A', 'PPE-20260108-0360-53776D', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Laser printer cartridge 310A/350A', 'PPE-20260108-0361-478231', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Laser printer cartridge 311A/351A', 'PPE-20260108-0362-177ABD', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Laser printer cartridge 312A/352A', 'PPE-20260108-0363-0BCE81', 1, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Laser printer cartridge 313A/353A', 'PPE-20260108-0364-EE847F', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Laser printer cartridge 314A', 'PPE-20260108-0365-D34340', 1, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Laser printer cartridge CF352A/CE312A', 'PPE-20260108-0366-6663A7', 8, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Laser toner cartridge 126A/130A', 'PPE-20260108-0367-D2FF4C', 12, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Laser toner cartridge 310A/350A', 'PPE-20260108-0368-2B99F3', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Lenovo docking station', 'PPE-20260108-0369-DA104B', 4, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Lenovo laptop charger 20V 150V', 'PPE-20260108-0370-580180', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Lenovo laptop charger 20V 170W', 'PPE-20260108-0371-148466', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Letter punch A - Z', 'PPE-20260108-0372-714710', 4, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Life jackets', 'PPE-20260108-0373-856B9F', 10, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Life rings', 'PPE-20260108-0374-E277D1', 20, 5, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Life vest', 'PPE-20260108-0375-BAFC64', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Liquid soap', 'PPE-20260108-0376-474540', 5, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Locking circlip pliers 85-200Mm', 'PPE-20260108-0377-F01352', 5, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Long armed reflective shirt (used but in very good condition)', 'PPE-20260108-0378-0A7FFE', 4, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Long armed reflective shirt (used)', 'PPE-20260108-0379-B6F49A', 6, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Long armed reflective shirt 2XL', 'PPE-20260108-0380-338018', 4, 5, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Long armed reflective shirt 3XL', 'PPE-20260108-0381-0EABF9', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Long armed reflective shirt L', 'PPE-20260108-0382-5BCC12', 8, 5, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Long armed reflective shirt M', 'PPE-20260108-0383-1F13F0', 2, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Long armed reflective shirt M', 'PPE-20260108-0384-697D2F', 9, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Long armed reflective shirt M', 'PPE-20260108-0385-C36F59', 31, 6, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Long armed reflective shirt S', 'PPE-20260108-0386-449AC0', 11, 5, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Long armed reflective shirt S', 'PPE-20260108-0387-D5FDC6', 15, 5, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Long armed reflective shirt S', 'PPE-20260108-0388-257900', 24, 6, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Long armed reflective shirt XL', 'PPE-20260108-0389-F23B63', 10, 5, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Long armed reflective shirt XL', 'PPE-20260108-0390-D7292A', 13, 4, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Long armed reflective shirt size L', 'PPE-20260108-0391-44C102', 14, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Long armed reflective shirt size M', 'PPE-20260108-0392-A28E80', 6, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Long armed reflective shirt size S', 'PPE-20260108-0393-CB138C', 5, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Long armed reflective shirt size XL', 'PPE-20260108-0394-AC66A4', 7, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Long armed reflective shirt size XXXL', 'PPE-20260108-0395-CD0A1E', 3, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Long armed shirt (used)', 'PPE-20260108-0396-5D3CBA', 126, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Long nose plier bent tip 2622200', 'PPE-20260108-0397-4DCDD9', 5, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Long nose pliers 25-140', 'PPE-20260108-0398-7D55B8', 7, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Long nose pliers 25-160', 'PPE-20260108-0399-AD6975', 8, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Long nose pliers 2506160', 'PPE-20260108-0400-CC3DA7', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Long nose pliers 2611200', 'PPE-20260108-0401-96AEDD', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Loto hasps', 'PPE-20260108-0402-8908C6', 78, 15, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Ludo game', 'PPE-20260108-0403-E94F5D', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'MCB locking device', 'PPE-20260108-0404-9F916C', 75, 15, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Magnetic bade dial indicator', 'PPE-20260108-0405-B27703', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Magnetic base drilling machine', 'PPE-20260108-0406-C7E72D', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Magnetic holder', 'PPE-20260108-0407-6A7804', 7, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Makita 2 speed drill 13Mm', 'PPE-20260108-0408-F1C033', 5, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Makita air impact wrench 12.7Mm', 'PPE-20260108-0409-A5783A', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Makita angle grinder 125Mm', 'PPE-20260108-0410-C2C11F', 8, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Makita angle grinder 230Mm', 'PPE-20260108-0411-3B2C0E', 0, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Makita battery charger', 'PPE-20260108-0412-3F975F', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Makita battery charger 18V', 'PPE-20260108-0413-49581C', 9, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Makita breaker', 'PPE-20260108-0414-77982B', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Makita cordless angle grinder', 'PPE-20260108-0415-51B780', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Makita cordless angle grinder', 'PPE-20260108-0416-35F034', 3, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Makita cordless driver drill 13Mm', 'PPE-20260108-0417-F5B1DF', 4, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Makita cordless impact wrench 12.7Mm', 'PPE-20260108-0418-150FE7', 3, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Makita cordless jigsaw', 'PPE-20260108-0419-9320A5', 3, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Makita cordless multi tool', 'PPE-20260108-0420-306AB4', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Makita cordless rivet gun Ø6.4Mm', 'PPE-20260108-0421-F2874C', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Makita cordless rotary hemmer', 'PPE-20260108-0422-FEB770', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Makita drilling machine', 'PPE-20260108-0423-FF85D7', 6, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Makita drilling machine (in use)', 'PPE-20260108-0424-B4723A', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Makita grinding machine', 'PPE-20260108-0425-8B93D3', 0, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Makita heat gun', 'PPE-20260108-0426-C35CBE', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Makita high speed drill', 'PPE-20260108-0427-79CDE3', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Makita jigsaw', 'PPE-20260108-0428-5035BF', 4, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Makita metall cutter 355Mm', 'PPE-20260108-0429-4EB83E', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Makita nibbler', 'PPE-20260108-0430-645F16', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Makita nibbler', 'PPE-20260108-0431-C8F123', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Makita screw driver set', 'PPE-20260108-0432-58F088', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Manual oil pump', 'PPE-20260108-0433-2F7529', 3, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Mask filter', 'PPE-20260108-0434-53BC55', 118, 15, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Measuring jug 30 Liters', 'PPE-20260108-0435-34BF7D', 10, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Measuring tape 100 Meters', 'PPE-20260108-0436-423B51', 3, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Measuring tape 3 Meters', 'PPE-20260108-0437-47418D', 8, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Measuring tape 3M', 'PPE-20260108-0438-DE1469', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Measuring tape 50 Meters', 'PPE-20260108-0439-B3AB33', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Mechanical weighing machine 0-20Kg', 'PPE-20260108-0440-2BD815', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Metal file', 'PPE-20260108-0441-582404', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Metal hole saw 64-16', 'PPE-20260108-0442-2C33B7', 4, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Metallic hammer 0.45 Kg', 'PPE-20260108-0443-CA54EF', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Metallic hammer 3/4', 'PPE-20260108-0444-852181', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Metallic ruller', 'PPE-20260108-0445-EFBCEB', 10, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Micro meter 200 - 300Mm', 'PPE-20260108-0446-726267', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Micro meter stand', 'PPE-20260108-0447-E24CF9', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Micro meter stand/articulating arm', 'PPE-20260108-0448-C4AFA2', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Milwaukee battery and charger', 'PPE-20260108-0449-67A465', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Milwaukee battery charger for screw driver', 'PPE-20260108-0450-6B5D98', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Milwaukee impact wrench', 'PPE-20260108-0451-2C8883', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Moldex particulate filter 9430', 'PPE-20260108-0452-DAF116', 1, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Montage adhesive', 'PPE-20260108-0453-65676A', 0, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Moquito repellent', 'PPE-20260108-0454-98DC79', 6, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Mosquito repellent', 'PPE-20260108-0455-F477EA', 44, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Notebook - Size A7', 'PPE-20260108-0456-66B64E', 26, 5, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Notebook - size A4', 'PPE-20260108-0457-A3B349', 2, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Notebook size A4', 'PPE-20260108-0458-5BD2EF', 1, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Number punch 0 - 9', 'PPE-20260108-0459-3DE833', 4, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Oil can', 'PPE-20260108-0460-1F2A6C', 8, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Oil can 10 Liters', 'PPE-20260108-0461-A6A432', 5, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Oil filter', 'PPE-20260108-0462-BEE9CA', 0, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Oil pump', 'PPE-20260108-0463-D80C33', 3, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Open end slogging wrench size 36', 'PPE-20260108-0464-554A39', 5, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Open end slogging wrench size 41', 'PPE-20260108-0465-B381BA', 5, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Open end slogging wrench size 46', 'PPE-20260108-0466-CE9D76', 5, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Open end slogging wrench size 50', 'PPE-20260108-0467-0693FD', 5, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Open end slogging wrench size 55', 'PPE-20260108-0468-886A92', 5, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Open end slogging wrench size 60', 'PPE-20260108-0469-54785E', 5, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Open end slogging wrench size 65', 'PPE-20260108-0470-BD535F', 5, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Open end slogging wrench size 70', 'PPE-20260108-0471-A1FFCB', 5, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Open end slogging wrench size 75', 'PPE-20260108-0472-8F1A3A', 5, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Open end slogging wrench size 80', 'PPE-20260108-0473-E4C252', 5, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Open end slogging wrench size 85', 'PPE-20260108-0474-E3418B', 5, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Overall (used)', 'PPE-20260108-0475-E9B254', 11, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Overall (used)', 'PPE-20260108-0476-4C77C8', 12, 4, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Overall S', 'PPE-20260108-0477-721E40', 9, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Overall size L', 'PPE-20260108-0478-159D27', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Overall size M', 'PPE-20260108-0479-F2DB2B', 13, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Overall size XL', 'PPE-20260108-0480-3FE0D7', 9, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Overall size XXL', 'PPE-20260108-0481-E879C5', 14, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Overalls / coveralls', 'PPE-20260108-0482-4F1D3B', 38, 20, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Overalls 175', 'PPE-20260108-0483-5F3AC7', 0, 5, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Overalls 180', 'PPE-20260108-0484-B7660C', 0, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Oxygen cylinder', 'PPE-20260108-0485-31F631', 0, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Oxygen sensor', 'PPE-20260108-0486-3A8224', 3, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'POE - Power supply 54V 90W', 'PPE-20260108-0487-B5CAC4', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Paint scraper', 'PPE-20260108-0488-16FFCA', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Pants and jacket', 'PPE-20260108-0489-991594', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Pants for security guards (used)', 'PPE-20260108-0490-20870A', 11, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Paper tape', 'PPE-20260108-0491-BEE382', 1, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Pen blue color', 'PPE-20260108-0492-A722A9', 100, 10, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Pen red color', 'PPE-20260108-0493-6DCE51', 11, 10, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Pencil sharpener', 'PPE-20260108-0494-821184', 30, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Permanent marker', 'PPE-20260108-0495-0339A8', 29, 5, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Pincers', 'PPE-20260108-0496-375E0B', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Pipe bender', 'PPE-20260108-0497-D88232', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Pipe cutter', 'PPE-20260108-0498-122EC6', 4, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Pipe wrench', 'PPE-20260108-0499-82BABE', 5, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Pipe wrench size 143', 'PPE-20260108-0500-420339', 9, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Pipe wrench size 144', 'PPE-20260108-0501-A22EC1', 9, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Pipe wrench size 147', 'PPE-20260108-0502-5D8E7E', 9, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Plasters', 'PPE-20260108-0503-7A7D3E', 550, 100, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Plastic container for chemical uses 0.25 Liter', 'PPE-20260108-0504-6AFA39', 52, 10, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Plastic container for chemical uses 0.5 Liter', 'PPE-20260108-0505-ED6B42', 47, 6, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Plastic container for chemical uses 1 Liter', 'PPE-20260108-0506-1770F2', 9, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Plastic container for chemical uses 1 Liter', 'PPE-20260108-0507-12EC42', 35, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Plastic face shield', 'PPE-20260108-0508-F8C0AF', 6, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Plastic zip bags', 'PPE-20260108-0509-2476F7', 0, 5, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Pliers 0302160', 'PPE-20260108-0510-8BC3A6', 5, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Pump spray bottle', 'PPE-20260108-0511-552261', 13, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Rain coat (used)', 'PPE-20260108-0512-11F38A', 0, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Rain protective overall', 'PPE-20260108-0513-C8B936', 0, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Rain protective overall', 'PPE-20260108-0514-6B8299', 7, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Rain protective overall', 'PPE-20260108-0515-9A58E0', 8, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Rain protective overall', 'PPE-20260108-0516-12767E', 30, 5, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Rain protective overall', 'PPE-20260108-0517-492BF5', 32, 5, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Rain protective overall', 'PPE-20260108-0518-4EA903', 38, 5, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Rain protective pants', 'PPE-20260108-0519-B43DCF', 3, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Raincoat with pants', 'PPE-20260108-0520-7DE4B4', 7, 10, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Ranked jacket and pants for security employees', 'PPE-20260108-0521-66F93D', 3, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Reflective Shirt / work suit', 'PPE-20260108-0522-7C52C1', 89, 20, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Reflective T-shirt', 'PPE-20260108-0523-20A982', 25, 15, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Reflective T-shirt (used)', 'PPE-20260108-0524-42AAC9', 72, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Reflective armband', 'PPE-20260108-0525-AF285F', 39, 5, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Reflective jacket (used)', 'PPE-20260108-0526-ACE847', 13, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Reflective jacket Size S', 'PPE-20260108-0527-72497D', 13, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Reflective jacket size L', 'PPE-20260108-0528-82801C', 3, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Reflective jacket size M', 'PPE-20260108-0529-1D08D1', 15, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Reflective jackets', 'PPE-20260108-0530-3C352F', 14, 5, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Reflective pants', 'PPE-20260108-0531-DCBAE7', 17, 4, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Reflective pants', 'PPE-20260108-0532-55F0F0', 22, 20, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Reflective pants (used but in very good condition)', 'PPE-20260108-0533-483904', 5, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Reflective pants (used)', 'PPE-20260108-0534-802340', 76, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Reflective pants L', 'PPE-20260108-0535-57A2A3', 0, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Reflective pants S', 'PPE-20260108-0536-1CEA3D', 0, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Reflective pants XL', 'PPE-20260108-0537-31FF0E', 1, 5, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Reflective vest (used)', 'PPE-20260108-0538-2A137C', 54, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Reflective vest for community security officer', 'PPE-20260108-0539-5BA752', 2, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Reflective vest for security guards', 'PPE-20260108-0540-3FA8DA', 0, 15, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Reflective vest with HQ PEAT logo', 'PPE-20260108-0541-FF2384', 37, 25, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Reflective vest with HQ POWER logo', 'PPE-20260108-0542-ECD2BA', 11, 20, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Reflective vest with HQ power Logo', 'PPE-20260108-0543-EFD8C8', 30, 10, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Reflective vest with HQ services logo', 'PPE-20260108-0544-60E751', 14, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Reflective vest with no logo', 'PPE-20260108-0545-0989C7', 17, 5, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Register book - Size A4', 'PPE-20260108-0546-A68D8C', 20, 5, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Rian protective pants (black)', 'PPE-20260108-0547-721E67', 15, 5, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Ring spanner deep offset size 30-32', 'PPE-20260108-0548-1E6F94', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Ring spanner deep offset size 36-41', 'PPE-20260108-0549-90FBEC', 12, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Ring spanner deep offset size 41-46', 'PPE-20260108-0550-63D9BB', 12, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Ring spanner deep offset size 46-50', 'PPE-20260108-0551-83FA2A', 12, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Round file', 'PPE-20260108-0552-FC2B1F', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Round metal file 12"', 'PPE-20260108-0553-E9E97D', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Round metall file', 'PPE-20260108-0554-C042CA', 5, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Router chassi (used)', 'PPE-20260108-0555-61ABF3', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Rubber coupling', 'PPE-20260108-0556-993FE9', 5, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Rubber hammer', 'PPE-20260108-0557-9358AD', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'S1-C19', 'PPE-20260108-0558-E05B26', 0, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'SKF bearing puller', 'PPE-20260108-0559-B66DC2', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'SKF greasing pump', 'PPE-20260108-0560-A007CE', 4, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Safety Eye glasses', 'PPE-20260108-0561-65B659', 19, 5, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Safety harness', 'PPE-20260108-0562-4BE6C0', 178, 15, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Safety harnesses new 16', 'PPE-20260108-0563-FEEDCE', 16, 5, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Safety helmet', 'PPE-20260108-0564-65513C', 7, 4, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Safety helmet (used)', 'PPE-20260108-0565-AE1954', 18, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Safety nets', 'PPE-20260108-0566-5BB375', 9, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Safety shoes', 'PPE-20260108-0567-ED0797', 19, 20, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Safety shoes 38 used (Fortum)', 'PPE-20260108-0568-B241CF', 0, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Safety shoes 38-44 (used)', 'PPE-20260108-0569-520FB6', 0, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Safety shoes 40 used (Fortum)', 'PPE-20260108-0570-2FA532', 3, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Safety shoes 40 used (Fortum)', 'PPE-20260108-0571-B6C102', 4, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Safety shoes 41 used (Fortum)', 'PPE-20260108-0572-4D0286', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Safety shoes 41 used (Fortum)', 'PPE-20260108-0573-30E8E8', 3, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Safety shoes 42 used (Fortum)', 'PPE-20260108-0574-17EEA4', 3, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Safety shoes 43 used (Fortum)', 'PPE-20260108-0575-4ABDB8', 7, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Safety shoes 44  used (Fortum)', 'PPE-20260108-0576-E7F2B7', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Safety shoes 45 used (Fortum)', 'PPE-20260108-0577-AB2D5D', 3, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Safety shoes 46 used (Fortum)', 'PPE-20260108-0578-8BCC44', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Safety shoes for security guards', 'PPE-20260108-0579-0A5695', 6, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Safety shoes used', 'PPE-20260108-0580-A7D55E', 15, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Sandals 40', 'PPE-20260108-0581-E8FE24', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Sandals 41', 'PPE-20260108-0582-2CD699', 2, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Sandals 42', 'PPE-20260108-0583-DA8A63', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Sandals 43', 'PPE-20260108-0584-02E64B', 3, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Sandals 44', 'PPE-20260108-0585-B8467C', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Sandals 45', 'PPE-20260108-0586-C60F57', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Saw blade wrench', 'PPE-20260108-0587-59684A', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Screw driver', 'PPE-20260108-0588-D45703', 5, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Screw driver bits', 'PPE-20260108-0589-B23C33', 6, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Self Bonding electrical tape', 'PPE-20260108-0590-E08B62', 19, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Self-contained breathing apparatus', 'PPE-20260108-0591-F411C7', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Service kit for Drone', 'PPE-20260108-0592-1FC9BE', 0, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Set punch 104/120x2', 'PPE-20260108-0593-3F5149', 4, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Set punch 104/120x3', 'PPE-20260108-0594-40696E', 4, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Set punch 104/120x4', 'PPE-20260108-0595-0FD616', 4, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Set punch 104/120x5', 'PPE-20260108-0596-89598E', 4, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Set punch 104/120x6', 'PPE-20260108-0597-B30A18', 4, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Set punch 104/120x8', 'PPE-20260108-0598-0A207D', 4, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Shackle', 'PPE-20260108-0599-A7AE68', 4, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Shackle DIN 0.25', 'PPE-20260108-0600-C4F2F1', 4, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Shackle DIN 2.5', 'PPE-20260108-0601-BF4605', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Shackle DIN 5', 'PPE-20260108-0602-366663', 4, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Shackle DIN0.6', 'PPE-20260108-0603-9A1F65', 4, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Sheet metal cutter right angel', 'PPE-20260108-0604-A42901', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Sheet metal cutting', 'PPE-20260108-0605-BBA45E', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Shirt for security guards (used)', 'PPE-20260108-0606-F6EF75', 11, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Short armed reflective shirt L', 'PPE-20260108-0607-D95352', 1, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Short armed reflective shirt M', 'PPE-20260108-0608-5E60EE', 0, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Short armed reflective shirt XXL', 'PPE-20260108-0609-6691B1', 0, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Silicone gun', 'PPE-20260108-0610-CD38B2', 13, 4, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Slogging spanner size 25', 'PPE-20260108-0611-20C886', 5, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Slogging spanner size 30', 'PPE-20260108-0612-CA3C74', 5, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Slogging spanner size 32', 'PPE-20260108-0613-63B056', 5, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Slogging spanner size 36', 'PPE-20260108-0614-35C72A', 4, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Slogging spanner size 41', 'PPE-20260108-0615-F6ADC6', 5, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Slogging spanner size 46', 'PPE-20260108-0616-374E29', 5, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Slogging spanner size 50', 'PPE-20260108-0617-2C224E', 5, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Slogging spanner size 55', 'PPE-20260108-0618-EB5ADA', 5, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Slogging spanner size 60', 'PPE-20260108-0619-FD6D07', 5, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Slogging spanner size 65', 'PPE-20260108-0620-178493', 5, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Slogging spanner size 70', 'PPE-20260108-0621-22B1F6', 5, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Slogging spanner size 75', 'PPE-20260108-0622-5951E1', 5, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Small loto key box (used)', 'PPE-20260108-0623-CDDD6A', 11, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Small notebook', 'PPE-20260108-0624-8AFBA7', 16, 4, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Snake repellent (expired)', 'PPE-20260108-0625-9E8898', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Socket for allen hex bit', 'PPE-20260108-0626-8F6E63', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Solid marker', 'PPE-20260108-0627-0E5B53', 54, 5, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Sony laptop charger 19.5V', 'PPE-20260108-0628-8FE3B3', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Speculum Kleeenspec Single use', 'PPE-20260108-0629-903B11', 850, 50, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Speed glass welding helmet', 'PPE-20260108-0630-422890', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Spirit level tool', 'PPE-20260108-0631-8F148D', 4, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Spirit level tool 1 meter long', 'PPE-20260108-0632-391335', 4, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Square angle rule', 'PPE-20260108-0633-B78219', 6, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Stainless steel vernier caliper 0-150Mm', 'PPE-20260108-0634-F761BD', 7, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Stanley screw driver', 'PPE-20260108-0635-283359', 42, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Staple remover', 'PPE-20260108-0636-42338E', 6, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Stapler', 'PPE-20260108-0637-FD6515', 4, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Stapler', 'PPE-20260108-0638-7EBC10', 8, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Stapler', 'PPE-20260108-0639-34EF37', 6, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Stapler nails', 'PPE-20260108-0640-92AFBA', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Stapler nails', 'PPE-20260108-0641-DB4D61', 61, 5, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Steel boots 42', 'PPE-20260108-0642-80F2A6', 7, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Steel boots 43', 'PPE-20260108-0643-FA7A1B', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Steel boots 44', 'PPE-20260108-0644-C1A382', 14, 5, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Steel protected gum boots 40', 'PPE-20260108-0645-526049', 10, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Steel protected gum boots 42', 'PPE-20260108-0646-5C504C', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Steel protected gum boots 44', 'PPE-20260108-0647-9A78DA', 4, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Steel protected gum boots 45', 'PPE-20260108-0648-5A6917', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Steel wire brush', 'PPE-20260108-0649-027FDE', 9, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Step drill bit Ø4-32Mm', 'PPE-20260108-0650-C36262', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Sticker printer machine', 'PPE-20260108-0651-C7FB06', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Storage plastic bag 1 Liter', 'PPE-20260108-0652-21C12F', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Storage plastic bag 3 Liter', 'PPE-20260108-0653-184D30', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Stud extractor set', 'PPE-20260108-0654-23C63F', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Super glue', 'PPE-20260108-0655-817A16', 1, 5, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Tank connector', 'PPE-20260108-0656-677C08', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Tap die set', 'PPE-20260108-0657-3B75F5', 9, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Tap wrench 5/32 - 1/2', 'PPE-20260108-0658-4B1248', 9, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Thread file', 'PPE-20260108-0659-390AA1', 8, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Thread file', 'PPE-20260108-0660-DFF051', 9, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Threading tap M36x2.0', 'PPE-20260108-0661-05537F', 10, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Tig welding hand gloves', 'PPE-20260108-0662-C647C8', 43, 6, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Tig welding hand gloves', 'PPE-20260108-0663-8384DC', 59, 10, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Tool bag', 'PPE-20260108-0664-B7E4FB', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Toolbox (returned from HQ services employees)', 'PPE-20260108-0665-B15EC7', 5, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Torch', 'PPE-20260108-0666-782397', 0, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Torque screwdriver', 'PPE-20260108-0667-D5E3AB', 0, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Torque wrench', 'PPE-20260108-0668-44E7B3', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Torque wrench', 'PPE-20260108-0669-C19FEE', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Torque wrench 1/2"', 'PPE-20260108-0670-76777E', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Torque wrench 1/2"', 'PPE-20260108-0671-136E3E', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Torque wrench 1/2""', 'PPE-20260108-0672-FEDE83', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Torque wrench 3/4"', 'PPE-20260108-0673-CB30ED', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Torque wrench 3/8"', 'PPE-20260108-0674-B2C5B0', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Torque wrench 3/8"', 'PPE-20260108-0675-B10DA7', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Tourniquet', 'PPE-20260108-0676-539468', 6, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Transparent measuring cup 3 Liters', 'PPE-20260108-0677-E2E468', 10, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Triangle shaped metal file', 'PPE-20260108-0678-7F510F', 6, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Tube cutter', 'PPE-20260108-0679-F7AB94', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Tuque wrench', 'PPE-20260108-0680-ACDC9D', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Universal batter charger', 'PPE-20260108-0681-F55CA0', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Uvex safety eye wear', 'PPE-20260108-0682-D3AE31', 50, 5, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Venus gas filter', 'PPE-20260108-0683-1987DB', 15, 5, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Vernier caliper 0 - 150Mm', 'PPE-20260108-0684-038831', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Vernier caliper 0 - 300Mm', 'PPE-20260108-0685-426089', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Vernier caliper 0 - 300Mm', 'PPE-20260108-0686-E7D868', 5, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Video cables VGA and AV', 'PPE-20260108-0687-95F569', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Warning tape', 'PPE-20260108-0688-899E47', 0, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Wastebasket', 'PPE-20260108-0689-863973', 23, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Water pump for drinking water', 'PPE-20260108-0690-FDBE10', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Water resistant hand gloves', 'PPE-20260108-0691-5190ED', 8, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Welding aprons', 'PPE-20260108-0692-054CFF', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Welding aprons', 'PPE-20260108-0693-3B07B5', 4, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Welding aprons', 'PPE-20260108-0694-23D9A4', 10, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Welding elbow cover', 'PPE-20260108-0695-E29073', 5, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Welding foot cover', 'PPE-20260108-0696-F52CBB', 21, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Welding visor', 'PPE-20260108-0697-EDA761', 10, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Welding visor (used)', 'PPE-20260108-0698-62BDFB', 28, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'White board eraser', 'PPE-20260108-0699-ABB996', 10, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'White board marker', 'PPE-20260108-0700-6E4AF7', 98, 15, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'White helmet', 'PPE-20260108-0701-1B3FB3', 2, 5, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Whole punch', 'PPE-20260108-0702-707232', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Whole punch', 'PPE-20260108-0703-94DB74', 8, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Whole punch', 'PPE-20260108-0704-7E6BFF', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Whole punch 2Mm - 8Mm', 'PPE-20260108-0705-6C309C', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Wire brush', 'PPE-20260108-0706-E8F2A1', 1, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Wire cutter/wire stripper 52', 'PPE-20260108-0707-55BE40', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Wire cutter/wire stripper 630-B1-1', 'PPE-20260108-0708-19DDBA', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Wire stripper', 'PPE-20260108-0709-36A101', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Wireless indicator', 'PPE-20260108-0710-9285F9', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Wood drill bit 4-10Mm', 'PPE-20260108-0711-408255', 4, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Work tec 140', 'PPE-20260108-0712-00E2EA', 8, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Wrench 24Mm', 'PPE-20260108-0713-91FD42', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Wrench 60Mm', 'PPE-20260108-0714-1024F7', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Yellow helmet', 'PPE-20260108-0715-EF5F31', 4, 5, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Zink oxide adhesive plaster', 'PPE-20260108-0716-FBA9C7', 5, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Zip tie 130Mm', 'PPE-20260108-0717-D9F223', 0, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Zip tie 142Mm', 'PPE-20260108-0718-DCB903', 21, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Zip tie 203Mm', 'PPE-20260108-0719-ABB6CE', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Zip tie 203Mm', 'PPE-20260108-0720-433847', 150, 50, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Zip tie 368Mm', 'PPE-20260108-0721-12996D', 38, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Zip tie 718Mm', 'PPE-20260108-0722-7A65D6', 45, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Zip tie installation tool', 'PPE-20260108-0723-C261E0', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'kitchen shoes 44', 'PPE-20260108-0724-ECF3EC', 3, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'reflective pants 2XL', 'PPE-20260108-0725-C39C94', 1, 3, 'pcs')
  ON CONFLICT DO NOTHING;

END $$;
