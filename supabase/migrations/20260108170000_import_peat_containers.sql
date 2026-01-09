-- Import from Peat containers.xls
-- Generated on: 2026-01-08T14:51:20.473517

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
  WHERE department_id = wh_dept_id AND name ILIKE '%Peat Container%' LIMIT 1;

  IF target_class_id IS NULL THEN
    RAISE EXCEPTION 'Classification matching Peat Container not found';
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
  VALUES (wh_dept_id, target_class_id, target_loc_id, '1 core cable', 'PC-20260108-0000-163392', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, '24V - 70W bulbs', 'PC-20260108-0001-2186CE', 8, 4, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, '24V horn for JCB. Pn 335/B4671', 'PC-20260108-0002-D6B88F', 1, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, '3 point hitch for Valtra tractors. Pn ACW151746A', 'PC-20260108-0003-4147C9', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, '4I-7538: M16X1.5 Thread 46mm Long Bolt', 'PC-20260108-0004-2F0E72', 0, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, '4T-HM220110', 'PC-20260108-0005-66ACEA', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, '5I-6125: M16X1.5 Thread Track Nut', 'PC-20260108-0006-648943', 0, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, '60 BAR pressure switch for JCB. Pn 333/K8558', 'PC-20260108-0007-4825C0', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, '6209-2RSC3', 'PC-20260108-0008-068C53', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, '6306-2RS (used)', 'PC-20260108-0009-3B782A', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, '8" hose clamp', 'PC-20260108-0010-B38551', 28, 10, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'AC air filter for Valtra tractors. Pn ACW2380980', 'PC-20260108-0011-F631ED', 53, 15, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'AC condenser for Valtra tractors. Pn ACV0091770', 'PC-20260108-0012-FBAAF0', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'AC fan blower for Valtra tractors (repaired)', 'PC-20260108-0013-846AAB', 20, 4, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'AC fan blower for Valtra tractors. Pn 5F5022600', 'PC-20260108-0014-D79EFD', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'ACP0505460 for Valtra tractors', 'PC-20260108-0015-F94CE8', 0, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'ACV0144730 Sensor for Valtra tractors', 'PC-20260108-0016-EFAFA1', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'ACV0146570 sensor for Valtra tractors. PnACV0146570', 'PC-20260108-0017-5F9CA0', 4, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'ACV024655A sensor for Valtra tractors. Pn ACV024655A', 'PC-20260108-0018-8D5AE2', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'ACV05401A', 'PC-20260108-0019-EAAE0F', 3, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'ACV0757480 spring for Valtra tractors. Pn ACV0757480', 'PC-20260108-0020-909D14', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'ACV0763710 kit for Valtra tractors', 'PC-20260108-0021-A39EF8', 3, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'ACW0830170 sensor for Valtra tractors. Pn ACW0830170', 'PC-20260108-0022-EF9907', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'ACX250313B washer for Valtra tractors', 'PC-20260108-0023-1905E2', 4, 5, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'AIR BREATH FOR JCB. Pn 334/G1512', 'PC-20260108-0024-10D59E', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Accelerometer for JCB. Pn 320/09649', 'PC-20260108-0025-7A1A22', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'AdBlue', 'PC-20260108-0026-8D1B29', 0, 25, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'AdBlue filter for Valtra tractors. Pn V837079423', 'PC-20260108-0027-A1FE97', 3, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Air - oil separator. Pn 1613610522', 'PC-20260108-0028-C653B7', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Air - oil separator. Pn 1626832100', 'PC-20260108-0029-AC4F67', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Air filter (didn''t have papers or box)', 'PC-20260108-0030-2FB865', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Air filter No name', 'PC-20260108-0031-DAD7E8', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Air filter element. Pn RS3543', 'PC-20260108-0032-22D7A1', 3, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Air filter for CAT wheel loader. Pn C25710/3', 'PC-20260108-0033-3603F8', 1, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Air filter for Valtra tractors. Pn ACV0066710', 'PC-20260108-0034-F96CFD', 20, 6, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Air filter for Valtra tractors. Pn ACX2412640', 'PC-20260108-0035-97028C', 4, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Air filter for Valtra tractors. Pn V36250010', 'PC-20260108-0036-68CD3C', 6, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Air filter for Valtra tractors. Pn V836862573', 'PC-20260108-0037-CC7B82', 3, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Air filter unit for Valtra. Pnacv0066710', 'PC-20260108-0038-C6CF9A', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Air filter. Pn 87682991', 'PC-20260108-0039-6B74A2', 1, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Air filter. Pn 87682994', 'PC-20260108-0040-532AE8', 1, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Air filter. Pn AF1811', 'PC-20260108-0041-859AA8', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Air filters.', 'PC-20260108-0042-648D00', 4, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Air intake for Valtra tractors', 'PC-20260108-0043-E22CD6', 8, 4, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Air pressure switch for Red Ruiying pumps', 'PC-20260108-0044-0EA662', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Air tube for Valtra front tire', 'PC-20260108-0045-478E77', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Air tube for Valtra rear tire', 'PC-20260108-0046-7D1385', 3, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Air tube for wagon tires', 'PC-20260108-0047-A81DC8', 3, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Allen bolt M12x35Mm', 'PC-20260108-0048-151AB6', 6, 4, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Allen bolt M12x50Mm', 'PC-20260108-0049-C101DE', 12, 4, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Argon pressure regulator. Pn OTTOT200/T275', 'PC-20260108-0050-400B23', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Argon welding machine', 'PC-20260108-0051-783F89', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'BREATHER FOR CAT. Pn 258-2820', 'PC-20260108-0052-8DBE61', 4, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'BREATHER GP. Pn 227-0590', 'PC-20260108-0053-4652DE', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'BREATHer AS for CAT. Pn 267-6744', 'PC-20260108-0054-AA3BB1', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'BW ball bearing 5308ZZ', 'PC-20260108-0055-5063CE', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Baldwin oil filter. Pn B161-S', 'PC-20260108-0056-CD9148', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Ball bearing 61811 2RS. Pn 1087015/085', 'PC-20260108-0057-9BF6D0', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Ball bearing for Valtra tractors. Pn VLA1288', 'PC-20260108-0058-0D38A9', 7, 4, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Ball bearing for Valtra tractors. Pn VLA9267', 'PC-20260108-0059-8344A1', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Ball bearing. Pn 61820 2RS', 'PC-20260108-0060-2635D5', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Ball bearing. Pn 6207 ABEC5', 'PC-20260108-0061-FC8B0B', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Ball bearing. Pn TM6203 ABEC3', 'PC-20260108-0062-5CDEDD', 5, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Ball bearing. Pn TM6308 ABEC5', 'PC-20260108-0063-8D5AE4', 4, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Ball joint for Valtra tractors. Pn 7402445013', 'PC-20260108-0064-D65417', 5, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Ball joint housing PM. Pn 287971', 'PC-20260108-0065-9C826B', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Banjo bolt for Valtra tractors. Pn V640435010', 'PC-20260108-0066-924311', 10, 5, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Base holder MP. Pn 380904', 'PC-20260108-0067-773EB1', 30, 15, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Battery for Valtra tractor (none working)', 'PC-20260108-0068-0FF3AA', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Bearing 6004RS', 'PC-20260108-0069-3E2D90', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Bearing 6302RS', 'PC-20260108-0070-135BA5', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Bearing 6820RS', 'PC-20260108-0071-3572BE', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Bearing 7308 E 102', 'PC-20260108-0072-245E99', 4, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Bearing 7308B', 'PC-20260108-0073-2E0E16', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Bearing Lock nut M50 (used)', 'PC-20260108-0074-9C3D59', 4, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Bearing UCF209', 'PC-20260108-0075-3D213C', 0, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Bearing UCF213J', 'PC-20260108-0076-FE6C5C', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Bearing housing for Italian pump. Pn FY509M', 'PC-20260108-0077-CE627F', 0, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Bearing unit F210', 'PC-20260108-0078-FBD29A', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Bearing unit F213', 'PC-20260108-0079-45A8FC', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Bearing unit F213', 'PC-20260108-0080-C762F3', 5, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Bearing unit UC2013. Pn UCP213R45', 'PC-20260108-0081-48B0F4', 4, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Bearing unit UC210', 'PC-20260108-0082-922C92', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Bearing unit UKF-213. Pn 30513', 'PC-20260108-0083-5D00BA', 0, 4, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Bearing unit for Italian pump', 'PC-20260108-0084-DB603E', 5, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Bearing unit. Pn 30435 - P210', 'PC-20260108-0085-AD0622', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Bearing with bearing housing P217', 'PC-20260108-0086-0CFFA8', 0, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Belt for CAT. Pn 3288757', 'PC-20260108-0087-84F69D', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Belt tensioner pulley for Valtra tractors. Pn V836859699', 'PC-20260108-0088-19F2F1', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Belt;8PK995 for JCB. Pn. 320/08671', 'PC-20260108-0089-519035', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Blades for peat turner', 'PC-20260108-0090-E43C73', 9, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Bolt  for Valtra tractors. Pn VHC8457', 'PC-20260108-0091-B91877', 4, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Bolt M5x25Mm for JCB. Pn 1317/3107D', 'PC-20260108-0092-C7984B', 5, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Bolt for Valtra tractors. Pn ACV0066940', 'PC-20260108-0093-88E153', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Bolt for Valtra tractors. Pn ACX260033B', 'PC-20260108-0094-67EA5E', 5, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Bolt for Valtra tractors. Pn VHA9616', 'PC-20260108-0095-71ABEF', 32, 15, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Boost pressure sensor for Valtra tractors. Pn V837084326', 'PC-20260108-0096-ED4C63', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Brake  fluid', 'PC-20260108-0097-048BC1', 0, 5, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Brake booster for Valtra tractors. Pn V36790610', 'PC-20260108-0098-36C65E', 0, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Brake cylinder for Valtra tractors. Pn V37368700', 'PC-20260108-0099-2E2FBF', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Brake disc for Valtra tractors. Pn ACV010133A', 'PC-20260108-0100-28D456', 4, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Brake fluid', 'PC-20260108-0101-98D185', 0, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Brake pads', 'PC-20260108-0102-B21BEF', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Brake pads. PnGDB909', 'PC-20260108-0103-07707F', 8, 4, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Breather filter NO10-GX08-SPC. PN 3081211021', 'PC-20260108-0104-5DAA39', 3, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Breather plug R 1/2". Pn 1087015/080', 'PC-20260108-0105-4B0A69', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Breather plug. R1/2".', 'PC-20260108-0106-EC0980', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Bucket cylinder seal. S1041200-22050000194', 'PC-20260108-0107-316DD4', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Bulb H9 12V, 65W for Valtra tractors. Pn X825107044000', 'PC-20260108-0108-0B1E3F', 1, 4, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Bush D45 for  Italian pump bottom support. Pn 014-DY138', 'PC-20260108-0109-FD896F', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Bushing 45/30 L20. Pn 4012293', 'PC-20260108-0110-5593D4', 4, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Bushing 50/40 L19. Pn 4012299', 'PC-20260108-0111-B7A37B', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Bushing 50/40 L30. Pn 4012292', 'PC-20260108-0112-97066C', 5, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Bushing 60/45 L30. Pn 4012291', 'PC-20260108-0113-9B4A8B', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Bushing 60/75 L36.5. Pn 4012297', 'PC-20260108-0114-F8D60B', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Bushing for Valtra tractors. Pn 468269/1', 'PC-20260108-0115-81B181', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Bushing for Valtra tractors. Pn V39418000', 'PC-20260108-0116-DAE3A2', 11, 5, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Bushing ø40.3x44x39.45. Pn 385300020610', 'PC-20260108-0117-2155E1', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Bushing. Pn 4011296', 'PC-20260108-0118-CA5950', 24, 6, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Bushing/trim panel for Valtra tractors. Pn ACV0229770', 'PC-20260108-0119-A5BDA0', 14, 8, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Button support ETR50 for Italian pump. Pn G27/0006', 'PC-20260108-0120-BF0097', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'CAT engine oil filter. Pn462-1171', 'PC-20260108-0121-A3BCCA', 0, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'CAT excavator track chain', 'PC-20260108-0122-E5C079', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'CONICAL CUTTER HOLDER MJC/OJK HARDENED. Pn 486730', 'PC-20260108-0123-AD4592', 20, 10, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'CUTTER M16 WRTG BSH42. Pn 84000', 'PC-20260108-0124-76C682', 96, 25, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Cab air filter for Valtra tractors. Pn V35741210', 'PC-20260108-0125-EEAFE6', 25, 10, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Cabin filter. Pn 47986277', 'PC-20260108-0126-8A6750', 3, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Cable for Valtra tractors. Pm ACV0056550', 'PC-20260108-0127-64B536', 0, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Cable for Valtra tractors. Pn ACV0060100', 'PC-20260108-0128-5DD14C', 8, 4, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Cable for Valtra tractors. Pn ACV0258590', 'PC-20260108-0129-8D165E', 3, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Cables from broken Valtra tractor', 'PC-20260108-0130-16C6FD', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Chain', 'PC-20260108-0131-C4EAE5', 3, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Chain for connecting second wheel on Valtra', 'PC-20260108-0132-6D3474', 296, 50, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Chain hook for Valtra tractors', 'PC-20260108-0133-ADD802', 24, 28, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Chain tensioner for Valtra tractors', 'PC-20260108-0134-51BEDC', 16, 10, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Chain tensioner for Valtra tractors', 'PC-20260108-0135-8199CA', 120, 50, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Chain tensioner for Valtra tractors', 'PC-20260108-0136-A6B927', 124, 50, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Chain tensioner with nut for Valtra tractors', 'PC-20260108-0137-2C71B2', 44, 20, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Clutch booster for Blue truck. Pn 1608SF100-001', 'PC-20260108-0138-5F3E41', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Clutch disc for Valtra tractors. Pn ACV0195720', 'PC-20260108-0139-98387C', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Clutch disc kit for Valtra tractors. Pn ACV0088110', 'PC-20260108-0140-13FFF4', 8, 4, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Clutch master cylinder', 'PC-20260108-0141-8EC341', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Clutch release bearing. Pn 996713K2', 'PC-20260108-0142-95C950', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Clutch shaft for Valtra tractors. Pn ACV0013220', 'PC-20260108-0143-FF4ED1', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Complete axle shaft', 'PC-20260108-0144-59440F', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Composite insulator', 'PC-20260108-0145-3D2C0B', 18, 8, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Compressor (none working)', 'PC-20260108-0146-051447', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Compressor (none working)', 'PC-20260108-0147-EC8D15', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Compressor for Valtra tractors. Pn ACV0059750', 'PC-20260108-0148-F4C5A5', 3, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Compressor for Valtra tractors. Pn V36963900', 'PC-20260108-0149-C7188B', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Condenser for Valtra tractors. Pn 8C8270000', 'PC-20260108-0150-4A2434', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Conical cutter holder. Pn 486730', 'PC-20260108-0151-F1D958', 19, 5, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Connection ACV0127650 for Valtra tractors', 'PC-20260108-0152-F8369B', 8, 4, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Connection bolt sealing. Pn F718301020710', 'PC-20260108-0153-853066', 6, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Control cable for Valtra tractors. Pn ACW2772020', 'PC-20260108-0154-606FB5', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Control knob for Valtra tractors. Pn ACV0276710', 'PC-20260108-0155-22329C', 8, 4, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Copper rings for Valtra tractors', 'PC-20260108-0156-830C1D', 5, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Counter ring for Valtra tractors. Pn V32279340', 'PC-20260108-0157-531482', 8, 4, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Cover ACV0057950 for Valtra tractors', 'PC-20260108-0158-0886AB', 14, 8, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Cover for Valtra tractors. Pn ACV026624A', 'PC-20260108-0159-6850AC', 3, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Cover for Valtra tractors. Pn V36525710', 'PC-20260108-0160-D79425', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Cover plug for Valtra tractors. Pn ACV0111220', 'PC-20260108-0161-204673', 0, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Crankshaft seal. Pn V836840883', 'PC-20260108-0162-05BFCD', 3, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Crankshaft sealing for Valtra tractors. Pn V837091172', 'PC-20260108-0163-7FDAB0', 5, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Crankshaft sensor for Valtra tractors. Pn V837070189', 'PC-20260108-0164-C7A251', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Cross bearing for the Italian pump.', 'PC-20260108-0165-D172A6', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Cross kit 34.92x93.5. pn 4120L0012', 'PC-20260108-0166-8C2D20', 5, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Cutter maxi cut right. Pn 319290', 'PC-20260108-0167-31BA85', 16, 5, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Cylinder head cover/gasket', 'PC-20260108-0168-C5374B', 7, 4, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Cylindrical roller bearing for Valtra tractors. Pn VLA9195', 'PC-20260108-0169-FAB54A', 8, 4, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'D1-02', 'PC-20260108-0170-93B9BD', 3, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'DJI phantom drone', 'PC-20260108-0171-77FEA9', 0, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Diesel filter for Valtra tractors. Pn V836867595', 'PC-20260108-0172-17FC58', 8, 4, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Diesel improver', 'PC-20260108-0173-4A5B01', 4, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Door lock for Valtra tractors. Pn ACV0295290', 'PC-20260108-0174-3401B8', 3, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Double nipple 60611', 'PC-20260108-0175-6D023D', 12, 4, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Drive belt for Valtra tractors. Pn 4375174M1', 'PC-20260108-0176-D3178C', 0, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Drive belt for Valtra tractors. Pn ACV0175620', 'PC-20260108-0177-417163', 3, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Drive belt for Valtra tractors. Pn V685081710', 'PC-20260108-0178-F80E8B', 5, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Drive shaft for super loader 5839248', 'PC-20260108-0179-55AC9A', 1, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Drive shaft. Pn 399UNI001', 'PC-20260108-0180-6436AE', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Drive shaft. Pn 399UNI001/G', 'PC-20260108-0181-2F2E54', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'ELEMENT - PRIM. Pn245-6375', 'PC-20260108-0182-55CACF', 1, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'ELEMENT - SEC.Pn428-7985', 'PC-20260108-0183-7814F6', 7, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'ELEMENT -SEC. Pn5290132', 'PC-20260108-0184-DFC947', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'ELEMENT AS-X. Pn 337-5270', 'PC-20260108-0185-C3A882', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'ELEMENT ASSY FOR JCB. Pn 320/A7001', 'PC-20260108-0186-510D72', 0, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'ELEMENT PRI. Pn428-7984', 'PC-20260108-0187-FBA605', 5, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'ELEMENT. Pn179-9806', 'PC-20260108-0188-F30CCC', 6, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'EPDM POLY - V BELT FOR CAT. Pn 8PK-2100', 'PC-20260108-0189-AF06C2', 0, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Electrical wheel nut extractor (used)', 'PC-20260108-0190-861635', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Engine coolant PARCOOL - EG', 'PC-20260108-0191-C63B20', 5, 10, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Engine cooling fan blades for Valtra. Pn ACV0765410', 'PC-20260108-0192-92C8D6', 9, 4, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Engine of the broken Valtra tractor', 'PC-20260108-0193-CF5792', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Engine oil - 15W40', 'PC-20260108-0194-46A08E', 145, 100, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Evaporator for Valtra tractors. Pn 72343888', 'PC-20260108-0195-A416D8', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Evaporator for Valtra tractors. Pn 72343888', 'PC-20260108-0196-DB8806', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Evaporator. Pn ACV0236300', 'PC-20260108-0197-F82AFD', 1, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Evaporator. PnACV0084760', 'PC-20260108-0198-1DF48A', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Expansion tank for Valtra tractors. Pn V35707010', 'PC-20260108-0199-60E1C0', 1, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Expansion valve for Valtra tractors. Pn ACV0236330', 'PC-20260108-0200-6EBA06', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'FAG adapter sleeve. Pn H2310', 'PC-20260108-0201-DAD477', 0, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'FAG bearing 2131-E1', 'PC-20260108-0202-9BCE8B', 12, 5, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'FAG bearing 22211EAE4C3', 'PC-20260108-0203-42E586', 0, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'FAG bearing 30209', 'PC-20260108-0204-6E852C', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'FAG bearing 32019-X A', 'PC-20260108-0205-E162E3', 5, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'FAG bearing 32209', 'PC-20260108-0206-537996', 3, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'FAG bearing 6209-2Z C3', 'PC-20260108-0207-2386B3', 14, 7, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'FAG bearing 6308-2Z/C3', 'PC-20260108-0208-A094C4', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'FAG bearing 6312-2Z C3', 'PC-20260108-0209-D67A72', 8, 4, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'FAG bearing L 30211', 'PC-20260108-0210-F463D7', 4, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'FAG roller bearing 33211 JR', 'PC-20260108-0211-348FCE', 5, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'FAG roller bearing. Pn 30309-D', 'PC-20260108-0212-14383B', 6, 6, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'FILTER - CAB A. Pn348-3432', 'PC-20260108-0213-E85B39', 8, 4, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'FILTER -AIR. pn200-2288', 'PC-20260108-0214-BED128', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'FILTER A FOR CAT. Pn 51-8670', 'PC-20260108-0215-A59199', 0, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'FILTER A for CAT. Pn528-7222', 'PC-20260108-0216-304C3C', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'FILTER AS 01 FOR CAT. Pn 558-0428', 'PC-20260108-0217-16B457', 9, 4, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'FILTER AS FOR CAT. Pn 293-1183', 'PC-20260108-0218-B7CEEA', 4, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'FILTER AS FOR CAT. Pn 481-3598', 'PC-20260108-0219-4C1C2A', 4, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'FILTER AS FOR CAT. Pn 546-0006', 'PC-20260108-0220-9FDCFE', 6, 4, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'FILTER AS for CAT. Pn438-5386', 'PC-20260108-0221-21DB20', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'FILTER AS-SE FOR CAT. Pn 4395037', 'PC-20260108-0222-BEC26B', 4, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'FILTER ASSEMBLY. PN333/D2696', 'PC-20260108-0223-A01AA6', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'FILTER FOR CAT. Pn 387-6169', 'PC-20260108-0224-FF6D7A', 6, 4, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'FILTER FOR CAT. Pn 465-6506', 'PC-20260108-0225-D686C6', 8, 4, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Fersa roller bearing L30206', 'PC-20260108-0226-F3D8A3', 2, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Filter AS for CAT. Pn 438-5386', 'PC-20260108-0227-F96F19', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Filter R3/4 S2200. Pn 373116000', 'PC-20260108-0228-2CC9A3', 4, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Filter R3/4" S2200', 'PC-20260108-0229-883100', 4, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Filter element 40/20 for JCB. Pn 335/D8924', 'PC-20260108-0230-15D454', 0, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Filter element for JCB. Pn 334/K2584', 'PC-20260108-0231-714331', 2, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Filter element for Valtra tractors. Pn X899980255101', 'PC-20260108-0232-E41A52', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Filter element kit for Valtra tractors. Pn 837079726', 'PC-20260108-0233-481B10', 4, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Filter element. Pn 334/F9728', 'PC-20260108-0234-15972F', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Filter pack MJK2011. Pn 661021', 'PC-20260108-0235-1D1A4F', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Filter. Pn 1262081', 'PC-20260108-0236-8EA1C5', 3, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Filter. Pn-PT9557', 'PC-20260108-0237-24D07B', 3, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Filter. PnRS3542', 'PC-20260108-0238-3C2BD0', 3, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Fire extinguisher tank for Valtra tractors', 'PC-20260108-0239-A3D6BD', 4, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Flange ACV076751A for Valtra tractors', 'PC-20260108-0240-93A4EB', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Flanged shaft', 'PC-20260108-0241-A995F0', 5, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Flanged shaft PM. Pn 390117', 'PC-20260108-0242-643D27', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Flexible hose/pipe', 'PC-20260108-0243-463ABF', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Flexible tube for Jerry can', 'PC-20260108-0244-77DBF4', 3, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Flywheel for Valtra tractors. Pn V835328783', 'PC-20260108-0245-3E658B', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Fork V30337000 for Valtra tractors', 'PC-20260108-0246-D72570', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Fork for Valtra tractors. Pn V39582100', 'PC-20260108-0247-82B36C', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Forward and reverse shuttle for Valtra tractors. Pn ACV005823A', 'PC-20260108-0248-BC149C', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Friction disc for Valtra tractors. Pn V34127100', 'PC-20260108-0249-EBA69D', 22, 10, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Front tire rims for Valtra tractors', 'PC-20260108-0250-223460', 27, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Front weight for Valtra tractors', 'PC-20260108-0251-BF35E6', 7, 4, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Front window for Valtra tractors', 'PC-20260108-0252-713B20', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Fuel cooler for Valtra tractors. Pn 4356594M2', 'PC-20260108-0253-EB3803', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Fuel filter for CAT. Pn 360-8958', 'PC-20260108-0254-1040B2', 1, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Fuel filter for CAT. Pn 360-8960', 'PC-20260108-0255-86EFB7', 0, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Fuel filter for Cummins. Pn 3931063', 'PC-20260108-0256-E95D17', 3, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Fuel filter for JCB. Pn 334/G5406', 'PC-20260108-0257-45123B', 0, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Fuel filter. Pn 84584081', 'PC-20260108-0258-FBDD24', 2, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Fuel filter. Pn EFF262', 'PC-20260108-0259-BB23F9', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Fuel filter/Water separator for Valtra tractors. Pn V836862051', 'PC-20260108-0260-8BEF84', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Fuel pre filter assembly. Pn V837086172', 'PC-20260108-0261-339F1A', 4, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Fuel pressure sensor for Valtra tractors. Pn ACV024655A', 'PC-20260108-0262-EDBD69', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Fuel pressure sensor for Valtra tractors. Pn V837079833', 'PC-20260108-0263-4198A7', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Fuel pressure valve for Valtra tractors. Pn V837079433', 'PC-20260108-0264-2260B6', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Fuel pump for Valtra tractors. Pn X899980255101', 'PC-20260108-0265-09464B', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Fuel water separator. Pn 3930942', 'PC-20260108-0266-4DB789', 7, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Fuel/water separator for CAT. Pn 311-3901', 'PC-20260108-0267-7841B6', 4, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Gasket for CAT. Pn 385-1422', 'PC-20260108-0268-BA46E5', 5, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Gasket set 3907028M91 for Valtra tractors', 'PC-20260108-0269-30A4FE', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Gear box', 'PC-20260108-0270-63BB4F', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Gear joystick for Valtra tractors. Pn ACV0156350', 'PC-20260108-0271-380C00', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Gear lubricant EP80W-90', 'PC-20260108-0272-B9F967', 5, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Gear oil 75W90-GL5', 'PC-20260108-0273-9429FB', 10, 6, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Gear oil 85W140', 'PC-20260108-0274-EC428B', 360, 150, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Gear shaft ring for Valtra tractors. Pn V70115700', 'PC-20260108-0275-4B7B09', 16, 4, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Gear/axle oil - 80W90', 'PC-20260108-0276-749E79', 400, 200, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Generator controller for Chinese machines', 'PC-20260108-0277-E0BD4C', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Grease nipple for Valtra tractors. Pn VGG0088', 'PC-20260108-0278-78AE0B', 14, 7, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Grease nipple for Valtra tractors. Pn VGG0094', 'PC-20260108-0279-9C4516', 3, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Grease nipple for Valtra tractors. Pn VGG0094', 'PC-20260108-0280-240664', 10, 6, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Grease pump (none working)', 'PC-20260108-0281-BCA83E', 4, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Grip for Valtra tractors. Pn V63383400', 'PC-20260108-0282-6691CA', 3, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Guide plate for Valtra tractors. Pn ACP0295380', 'PC-20260108-0283-4D4560', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'HUB V36532000 for Valtra tractors', 'PC-20260108-0284-9884D5', 6, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Handle for Valtra tractors. Pn ACP0295440', 'PC-20260108-0285-2FFDD8', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hatch for Valtra tractors. Pn ACV0300800', 'PC-20260108-0286-99270E', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Heating unit control for Valtra tractors. Pn ACV0786870', 'PC-20260108-0287-3021EF', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hex head bolt for Valtra tractors. Pn VHA9411', 'PC-20260108-0288-4D3620', 11, 6, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hex socket screw for Valtra tractors. Pn HC8535', 'PC-20260108-0289-6F520D', 3, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hex socket screw for Valtra tractors. Pn V581704810', 'PC-20260108-0290-885E3C', 6, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hex socket screw for Valtra tractors. Pn V581705070', 'PC-20260108-0291-9E855A', 47, 20, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hex socket screw for Valtra tractors. Pn V581705200', 'PC-20260108-0292-EACF23', 23, 10, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hex socket screw for Valtra tractors. Pn V581706750', 'PC-20260108-0293-EF8BA9', 15, 8, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hex socket screw for Valtra tractors. Pn VHA9591', 'PC-20260108-0294-8097A4', 17, 10, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hex socket screw for Valtra tractors. Pn VHC9320', 'PC-20260108-0295-A0573E', 5, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hex socket screw for Valtra tractors. Pn VHC9336', 'PC-20260108-0296-AE3F9E', 3, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hex socket screw for Valtra tractors. Pn VHC9762', 'PC-20260108-0297-1FFDCD', 10, 5, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hex socket screw for Valtra tractors. Pn VHC9990', 'PC-20260108-0298-75D7B0', 6, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hexagonal head bolt for Valtra tractors. Pn ACW9580200', 'PC-20260108-0299-59BCA5', 6, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'High pressure pump for Valtra tractors. Pn V837074805', 'PC-20260108-0300-85B65A', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hinge for Valtra tractors. Pn ACV0069350', 'PC-20260108-0301-10DAF0', 7, 5, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Holder. Pn V30337100', 'PC-20260108-0302-263120', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hose V33201200 for Valtra tractors', 'PC-20260108-0303-798BDA', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hose clamp for Valtra tractors. Pn V602087528', 'PC-20260108-0304-ADFF0A', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hose for Chinese pumps (used)', 'PC-20260108-0305-D75C66', 20, 10, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hose for Italian pump (used)', 'PC-20260108-0306-73299A', 9, 4, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hose for portable water pump (used)', 'PC-20260108-0307-137665', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'House ACV0217560 for Valtra tractors', 'PC-20260108-0308-0B88D0', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hub, center part for Valtra tractors. Pn V36247200', 'PC-20260108-0309-9C7D06', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hydraulic /transmission oil - 10W30', 'PC-20260108-0310-2DDB61', 95, 50, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hydraulic control for Valtra tractors. Pn ACV0207120', 'PC-20260108-0311-5B8417', 5, 4, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hydraulic control for Valtra tractors. Pn ACV0209090', 'PC-20260108-0312-9459A8', 7, 4, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hydraulic control for Valtra tractors. Pn ACX2528450', 'PC-20260108-0313-4B2233', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hydraulic cylinder & push rod. Pn 614773', 'PC-20260108-0314-E2860E', 0, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hydraulic cylinder seal 5000065', 'PC-20260108-0315-A11875', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hydraulic cylinder seal 5000080', 'PC-20260108-0316-6E9C6A', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hydraulic cylinder seal 5000095', 'PC-20260108-0317-6B36EF', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hydraulic cylinder seal 5000110', 'PC-20260108-0318-857900', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hydraulic cylinder seal 5000125', 'PC-20260108-0319-B299E2', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hydraulic cylinder seal. 40770', 'PC-20260108-0320-4BEA1A', 6, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hydraulic filter', 'PC-20260108-0321-C30ECC', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hydraulic filter', 'PC-20260108-0322-4028DB', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hydraulic filter for Valtra tractors. Pn ACV0769370', 'PC-20260108-0323-C2E456', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hydraulic filter for Valtra tractors. Pn ACV0798550', 'PC-20260108-0324-AC3FE4', 3, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hydraulic filter for Valtra tractors. Pn ACW5110990', 'PC-20260108-0325-C90DD4', 5, 4, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hydraulic filter for Valtra tractors. Pn V20639610', 'PC-20260108-0326-87A4AA', 3, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hydraulic filter. Pn 167857A1', 'PC-20260108-0327-F685A3', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hydraulic filter. Pn 2180031', 'PC-20260108-0328-AC8F30', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hydraulic filter. Pn 47587350', 'PC-20260108-0329-6950BA', 3, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hydraulic filter. Pn KAJ4601', 'PC-20260108-0330-BD33AB', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hydraulic filter. Pn KAJ4601', 'PC-20260108-0331-2EA5AC', 2, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hydraulic filter. Pn SH60376', 'PC-20260108-0332-C37F0D', 3, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hydraulic filter. Pn SH85900', 'PC-20260108-0333-E4CA2C', 3, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hydraulic hose and adapters for CAT. Pn 42S001816', 'PC-20260108-0334-EEDD10', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hydraulic hose for Valtra tractors. Pn ACV022310A', 'PC-20260108-0335-F9E51D', 4, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hydraulic oil filter for CAT. Pn 465-6506', 'PC-20260108-0336-61A4C9', 2, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hydraulic oil filter for CAT. Pn126-1818', 'PC-20260108-0337-FE19DC', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hydraulic oil filter. Pn 163279A1', 'PC-20260108-0338-26B159', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hydraulic oil filter. PnKAJ10630', 'PC-20260108-0339-35DF69', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hydraulic pipe fast coupling for CAT. Pn 300632', 'PC-20260108-0340-ED9BD0', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hydraulic pipe for CAT.', 'PC-20260108-0341-ED7CC8', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hydraulic piston seal 100/60', 'PC-20260108-0342-15C5F1', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hydraulic piston seal 10060400', 'PC-20260108-0343-541AF1', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hydraulic piston seal 100801200', 'PC-20260108-0344-0D2F35', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hydraulic piston seal 50-34', 'PC-20260108-0345-457FA4', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hydraulic piston seal 63/30', 'PC-20260108-0346-CD385C', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hydraulic piston seal 63/40', 'PC-20260108-0347-EF2F08', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hydraulic piston seal 80/50', 'PC-20260108-0348-3A25D2', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hydraulic piston seal. Pn 502625', 'PC-20260108-0349-919D69', 0, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hydraulic piston seal. Pn 6330300', 'PC-20260108-0350-7CE91F', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hydraulic piston seal. Pn TPM196133', 'PC-20260108-0351-22E64B', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hydraulic piston seal. Pn TPM236173 60-44-18.4', 'PC-20260108-0352-7B31C7', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hydraulic piston seal. S1041200-22050000196', 'PC-20260108-0353-C5B094', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hydraulic piston wiper. Pn 40830', 'PC-20260108-0354-55EBF5', 4, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hydraulic pump for Valtra tractors', 'PC-20260108-0355-F390E1', 4, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hydraulic system knob for Valtra tractors. Pn ACV0233720', 'PC-20260108-0356-2302B6', 8, 5, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'ISB ball bearing 6311', 'PC-20260108-0357-4305DB', 8, 4, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'ISB roller bearing 22215KCAW33', 'PC-20260108-0358-FF54D8', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Ignition switch for Valtra tractors. Pn ACV022816B', 'PC-20260108-0359-9C0479', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Impeller ET50 5 blades for Italian pump. Pn010-0077', 'PC-20260108-0360-46D5EE', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Impeller for Italian pump', 'PC-20260108-0361-CF4493', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Injector for Valtra tractors. Pn V837074860', 'PC-20260108-0362-74C87D', 6, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Inner air filter for Valtra tractors. Pn v836862573', 'PC-20260108-0363-304899', 3, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Insert rim for Valtra front tire', 'PC-20260108-0364-D24771', 22, 10, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Italian pump keyed shaft 1"-3-4 Z6R450. Pn 001/0249', 'PC-20260108-0365-AD46EC', 0, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Joint shaft for Valtra tractors. Pn ACV0012660', 'PC-20260108-0366-378D9A', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Kingpin', 'PC-20260108-0367-D9C931', 4, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Kit ACV0763710 for Valtra tractors', 'PC-20260108-0368-9CF090', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Kit pipe, valve for Valtra tractors. Pn 0952-61-49-00', 'PC-20260108-0369-7F6894', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Kit transfer for Valtra tractors. Pn ACP0135530', 'PC-20260108-0370-48D053', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Knob for Valtra tractors. Pn ACV0233590', 'PC-20260108-0371-59C28A', 11, 6, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Knob for Valtra tractors. Pn ACV0233700', 'PC-20260108-0372-D93BC3', 4, 4, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Knob for Valtra tractors. Pn ACV0233720', 'PC-20260108-0373-3EBD97', 4, 4, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Koyo ball bearing UK210', 'PC-20260108-0374-72790D', 0, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'L- shaped metallic angle pads', 'PC-20260108-0375-08DAAA', 60, 15, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'L30208', 'PC-20260108-0376-A2625A', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Latch ACV015887A for Valtra tractors', 'PC-20260108-0377-8C543D', 5, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Left hand rod for Valtra tractors. Pn ACP0131780', 'PC-20260108-0378-7E4B5E', 3, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Left hand stud bolt for Valtra tractors. Pn VHJ0300', 'PC-20260108-0379-A4D7D6', 32, 15, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Limit sensor for Valtra tractors. Pn V33558700', 'PC-20260108-0380-5A7D00', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Link guide ball', 'PC-20260108-0381-8D4F95', 28, 10, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Lock nut for Valtra tractors. Pn VJB8908', 'PC-20260108-0382-3628E8', 3, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Lock pin', 'PC-20260108-0383-8E80A1', 8, 4, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Lock ring A 45 DIN 471. Pn 20241', 'PC-20260108-0384-071568', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Lock ring for Valtra tractors. Pn KG1060', 'PC-20260108-0385-4352B7', 4, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Locking kit for Valtra tractors. Pn V33390000', 'PC-20260108-0386-3F1D83', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Locking plate for Valtra tractors. Pn V33772000', 'PC-20260108-0387-E3CDA7', 31, 15, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Lower link guide cone and ball assembly', 'PC-20260108-0388-53D7ED', 19, 8, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Lubricant filter. Pn B1161-S', 'PC-20260108-0389-F11ABB', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'MCB bearing 6209RS', 'PC-20260108-0390-E52DCC', 16, 5, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'MCB bearing 6305-2RSC3', 'PC-20260108-0391-CE4B04', 0, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'MCB bearing. Pn 6205 2RSC3', 'PC-20260108-0392-501466', 14, 5, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'MCB bearing. Pn 63022RSC3', 'PC-20260108-0393-FAC8FD', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'MCB roller bearing. Pn 30309-D', 'PC-20260108-0394-B26343', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Magnetic plug for Valtra tractors. Pn 385300020130', 'PC-20260108-0395-08A005', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Mechanical seal', 'PC-20260108-0396-78BF13', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Mechanical seal', 'PC-20260108-0397-5C5D6B', 4, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Mechanical seal for Ruiying', 'PC-20260108-0398-8E79F4', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Mechanical seal for Ruiying pumps', 'PC-20260108-0399-B51F4B', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Mechanical seal for Ruiying pumps', 'PC-20260108-0400-D58E77', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Mechanical seal for Ruiying.', 'PC-20260108-0401-7875C0', 6, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Metallic SHIM for CAT. Pn 086-0416', 'PC-20260108-0402-17F40F', 4, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Mid flange', 'PC-20260108-0403-40D556', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Mineral engine oil PAROIL-E', 'PC-20260108-0404-101C5F', 11, 5, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Mineral lubricant PAROIL-M', 'PC-20260108-0405-D05808', 15, 10, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Mounting for Valtra tractors. Pn GS9722', 'PC-20260108-0406-1250B1', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Mudguard for Valtra tractors. Pn ACV0170780', 'PC-20260108-0407-08F88A', 3, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Multi track belt for Valtra tractors. Pn V39517700', 'PC-20260108-0408-480169', 5, 4, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'NTN bearing 4T-HM220149', 'PC-20260108-0409-BCFF54', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'NTN bearing 4T-HM220149/HM22#01', 'PC-20260108-0410-0C6188', 3, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'NTN roller bearing 4T-48290/48220', 'PC-20260108-0411-28AE73', 4, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Nipple 505-12-06 L', 'PC-20260108-0412-6CA52F', 4, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Nipple DL12/R3/8', 'PC-20260108-0413-C24981', 4, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Nox sensor for Valtra tractors. Pn ACP0049800', 'PC-20260108-0414-F70D23', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Nut VJB8207 for Valtra tractors', 'PC-20260108-0415-976D3F', 0, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Nut bolt M20x120Mm', 'PC-20260108-0416-43D6E8', 78, 20, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Nut for Valtra tractors. Pn 6282298M91', 'PC-20260108-0417-BB8C59', 9, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Nut for Valtra tractors. Pn VJB8207', 'PC-20260108-0418-E82731', 9, 10, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Nut for Valtra tractors. Pn VJB8904', 'PC-20260108-0419-32DFEF', 6, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'O-ring 119.5x3. Pn 40530', 'PC-20260108-0420-BC9581', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'O-ring 1442385X1 for Valtra tractors', 'PC-20260108-0421-4252B4', 5, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'O-ring 32.2x3. pn40430', 'PC-20260108-0422-44BC28', 5, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'O-ring 59.5x3. Pn 40470', 'PC-20260108-0423-1A842E', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'O-ring 78.95x3.53. Pn 40480', 'PC-20260108-0424-26D86D', 5, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'O-ring 78.97x3.53. Pn 40480', 'PC-20260108-0425-7847D1', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'O-ring ACX2619610 for Valtra tractors', 'PC-20260108-0426-58B161', 6, 5, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'O-ring KH4174 for Valtra tractors', 'PC-20260108-0427-8F84D5', 0, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'O-ring KH4916 for Valtra tractors', 'PC-20260108-0428-6F6CB2', 6, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'O-ring KH4917 for Valtra tractors', 'PC-20260108-0429-9C0B9B', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'O-ring VKH4057 for Valtra tractors', 'PC-20260108-0430-1A3C04', 13, 7, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'O-ring VKH4131 for Valtra tractors', 'PC-20260108-0431-8DFCA9', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'O-ring VKH4174 fir Valtra tractors', 'PC-20260108-0432-72DC5C', 7, 7, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'O-ring VKH4343 for Valtra tractors', 'PC-20260108-0433-2E5F6D', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'O-ring VKH4711 for Valtra tractors', 'PC-20260108-0434-A66033', 14, 8, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'O-ring VKH4781 for Valtra tractors', 'PC-20260108-0435-815635', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'O-ring VKH4820 for Valtra tractors', 'PC-20260108-0436-937C94', 12, 7, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'O-ring X549040200000 for Valtra tractors', 'PC-20260108-0437-DF2231', 5, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'O-ring and bolts for Italian pump bottom support. Pn 179-0022', 'PC-20260108-0438-12EE91', 1, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Oil - RIMULA 15W-40', 'PC-20260108-0439-7F4D06', 418, 50, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Oil - SPiRAX S4TxM', 'PC-20260108-0440-BA3ECF', 418, 50, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Oil cooler for Valtra tractors. Pn ACV0112060', 'PC-20260108-0441-49243F', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Oil cooler for Valtra tractors. Pn V836859699', 'PC-20260108-0442-BD7D12', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Oil filter for JCB. Pn 320/B4420', 'PC-20260108-0443-064D2C', 1, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Oil filter. Pn 47431911', 'PC-20260108-0444-8A0482', 3, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Oil filter. Pn LF3345', 'PC-20260108-0445-D30EC8', 0, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Oil filter. Pn V83709718', 'PC-20260108-0446-54B8CB', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Oil pressure sensor for Valtra tractors. Pn 4312617M2', 'PC-20260108-0447-FD4358', 10, 5, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Oil pressure sensor for Valtra tractors. Pn V837070201', 'PC-20260108-0448-978647', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Oil pump for Valtra tractors. Pn V836855300', 'PC-20260108-0449-5ABA13', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Oil seal 105x130x12Mm', 'PC-20260108-0450-CD7632', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Oil seal 160x190x15Mm', 'PC-20260108-0451-BD1203', 5, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Oil seal 20x35x7Mm', 'PC-20260108-0452-DBA899', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Oil seal 25x35x7Mm', 'PC-20260108-0453-133421', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Oil seal 34x48x7Mm', 'PC-20260108-0454-3A0B76', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Oil seal 35x50x10Mm', 'PC-20260108-0455-5E0905', 6, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Oil seal 35x50x8Mm', 'PC-20260108-0456-57B52A', 5, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Oil seal 42x62x8Mm', 'PC-20260108-0457-D86AF5', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Oil seal 45x85x10Mm. Pn100805', 'PC-20260108-0458-DF5EB7', 3, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Oil seal 50x70x10Mm. Pn 103052', 'PC-20260108-0459-538F5B', 3, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Oil seal 52x72x10Mm', 'PC-20260108-0460-A3F0C8', 3, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Oil seal 55x100x10Mm', 'PC-20260108-0461-4DF72A', 0, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Oil seal 55x75x10Mm', 'PC-20260108-0462-68FBE9', 13, 5, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Oil seal 575x475x50', 'PC-20260108-0463-00AE9B', 3, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Oil seal 5x5.75x0.5 inches', 'PC-20260108-0464-596E2B', 5, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Oil seal 60x80x10Mm', 'PC-20260108-0465-6548DF', 10, 4, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Oil seal 65x100x10. Pn 100818', 'PC-20260108-0466-E1F0A6', 1, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Oil seal 65x80x8Mm', 'PC-20260108-0467-73A649', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Oil seal 65x85x10Mm', 'PC-20260108-0468-6A34A0', 2, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Oil seal 78x100x10Mm', 'PC-20260108-0469-A7E6D7', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Oil seal 80x100x10Mm', 'PC-20260108-0470-9874A1', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Oil seal 95x120x12Mm', 'PC-20260108-0471-CD3807', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Oil seal ACKSZ 3656 for Cummins', 'PC-20260108-0472-79BF7C', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Oil stick for Valtra tractors. Pn V34168110', 'PC-20260108-0473-A98713', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Oil sump gasket for Valtra tractors. Pn V836322183', 'PC-20260108-0474-4EAC54', 2, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Oil sump gasket for Valtra tractors. V836322183', 'PC-20260108-0475-34B870', 2, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Oxygen cylinder', 'PC-20260108-0476-5F8AC0', 0, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'PFI bearing. PW40740040CS', 'PC-20260108-0477-0A7812', 34, 10, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'PFI bearing. Pn 30BD40DF2', 'PC-20260108-0478-366581', 14, 6, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'PIST.ARM.PACK. 30X45X9. Pn 40720', 'PC-20260108-0479-88D046', 3, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'PIST.ARM.PACK. 40X50X10.5', 'PC-20260108-0480-754CD8', 5, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'PIST.ARM.PACK. 40X50X10.5. Pn 40725', 'PC-20260108-0481-20FF82', 5, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'PIST.ARM.PACK. 60X75X12.5. Pn 40735', 'PC-20260108-0482-CB1797', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'PIST.ARM.PACK. Pn 40730', 'PC-20260108-0483-3256FA', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'PIST.PACK. 120X95X22. Pn 40785', 'PC-20260108-0484-06D14C', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'PIST.PACK. 60X44X18', 'PC-20260108-0485-3448B5', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'PRESSURE LIMITER AS. POC. Pn 487699', 'PC-20260108-0486-CBADF6', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'PTO clutch for Valtra tractors. Pn ACV001792A', 'PC-20260108-0487-6526E9', 3, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'PTO sensor for Valtra tractors. Pn ACV0246540', 'PC-20260108-0488-4899C5', 3, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'PTO shaft O-ring VKH4936 for Valtra tractors', 'PC-20260108-0489-544034', 4, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'PTO shaft for Valtra tractors. Pn ACV0197580', 'PC-20260108-0490-EC617E', 13, 5, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'PTO shaft for Valtra tractors. Pn ACV0222060', 'PC-20260108-0491-372812', 9, 5, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'PVC elbow. OD180Mm, ID160Mm', 'PC-20260108-0492-A27A94', 21, 5, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'PVC pipe 6Mx160Mm', 'PC-20260108-0493-C4E675', 11, 5, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'PVC pipe 6Mx200Mm', 'PC-20260108-0494-818A95', 82, 20, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'PVC pipe O160Mm X6M long', 'PC-20260108-0495-F98F1D', 40, 20, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'PVC pipe O160Mm X6M long', 'PC-20260108-0496-36E7F8', 53, 20, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'PVC pipe O200Mm X6M long', 'PC-20260108-0497-2E422A', 128, 50, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'PVC pipe O400Mm', 'PC-20260108-0498-06BC19', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'PW447208331CS', 'PC-20260108-0499-D56BD0', 0, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Packing for Valtra tractors. Pn V836316726', 'PC-20260108-0500-1B37D9', 12, 6, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Peat covering plastic', 'PC-20260108-0501-7F4258', 15, 5, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Peat intake roller for super loader', 'PC-20260108-0502-FA5739', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Peat wagon axle', 'PC-20260108-0503-724B31', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Perkins fuel filter. Pn 26561118', 'PC-20260108-0504-27B06C', 5, 4, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Perkins oil filter. Pn 2654403', 'PC-20260108-0505-0093CF', 0, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Pin for Valtra tractors. Pn VJE9072', 'PC-20260108-0506-B86BCC', 7, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Pipe ACW2345550 for Valtra tractors', 'PC-20260108-0507-C5C0E8', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Pipe V37797800 for Valtra tractors', 'PC-20260108-0508-A3DF43', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Pipe VYK9961 for Valtra tractors', 'PC-20260108-0509-D6FEB0', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Pipe clamp for Valtra tractors. Pn v34913700', 'PC-20260108-0510-FBAE23', 12, 6, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Pipe for Valtra tractors. Pn ACV020033A', 'PC-20260108-0511-FD308C', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Piston pack. 40765. 60x44x18', 'PC-20260108-0512-2532FC', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Planet gear for Valtra tractors. Pn V836879295', 'PC-20260108-0513-2A7AA9', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Planetary gear for Valtra tractors. Pn AXC254541B', 'PC-20260108-0514-9E6D7C', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Plastic sheet (long ones)', 'PC-20260108-0515-CF6ACA', 88, 20, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Plate ACV019608A for Valtra tractors', 'PC-20260108-0516-D12300', 3, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Plate ACV076751A for Valtra tractors', 'PC-20260108-0517-6B07AD', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Plate V34127200 for Valtra tractors', 'PC-20260108-0518-DB3A54', 15, 8, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Plenary drive support for Valtra tractors. Pn F718301020400', 'PC-20260108-0519-EDCB22', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Plug VGR0253 for Valtra tractors', 'PC-20260108-0520-94314E', 4, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Plug socket for Valtra tractors. Pn V32207200', 'PC-20260108-0521-BF55E3', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Polyuretan sealant', 'PC-20260108-0522-10360A', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Portable water pump (used and none working)', 'PC-20260108-0523-77801E', 6, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Position sensor for JCB. Pn 320/09524', 'PC-20260108-0524-AC3E2F', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Pre-filter. Pn V837091129', 'PC-20260108-0525-342CB2', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Prefilter for Valtra tractors. Pn 5656050', 'PC-20260108-0526-A1C5AB', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Prepaid check service for Valtra. Pn 3909796M91', 'PC-20260108-0527-928EA5', 16, 5, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Pressure switch for JCB. Pn 332/J0669', 'PC-20260108-0528-89AACD', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Pressure switch for Valtra tractors. Pn VLA9210', 'PC-20260108-0529-1EED4A', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Pressure valve for Valtra tractors. Pn V837079834', 'PC-20260108-0530-AD8FBE', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Priority valve for Valtra tractors. Pn ACV0104110', 'PC-20260108-0531-6B2B51', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Proport, valve for Valtra tractors. Pn V36060600', 'PC-20260108-0532-F66B8A', 5, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Pulley for Valtra tractors. Pn V837074402', 'PC-20260108-0533-241E22', 8, 4, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Quick coupling for Valtra tractors. Pn AXC254541B', 'PC-20260108-0534-DDE685', 7, 4, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Quick coupling. Pn V63246300', 'PC-20260108-0535-4F9D93', 0, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'RETURN FIL. Pn400/L8619', 'PC-20260108-0536-66ED02', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Radiator cap for Valtra tractors. Pn V33690710', 'PC-20260108-0537-2B5C5E', 4, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Radiator for Valtra tractors. Pn V63029010', 'PC-20260108-0538-D5EBD9', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Radiator hose for CAT. Pn 387-6081', 'PC-20260108-0539-DED3F6', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Rear light for Valtra tractors. Pn ACV0018060', 'PC-20260108-0540-781AE0', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Rear seal, ware sleeve kit. Pn 3926126', 'PC-20260108-0541-B56303', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Rectangular metallic plate', 'PC-20260108-0542-CF3373', 17, 5, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Reduction rear for Valtra tractors. Pn V37417300', 'PC-20260108-0543-B4F494', 3, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Reflector for Valtra tractors. Pn ACV0799380', 'PC-20260108-0544-367750', 11, 5, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Regulating valve for Valtra tractors. Pn V837079484', 'PC-20260108-0545-AAB745', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Resistor for AC fan. ACV0236590', 'PC-20260108-0546-A04158', 6, 4, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Retainer ring for Valtra tractors. Pn ACX3359480', 'PC-20260108-0547-F5E17A', 3, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Retainer ring for Valtra tractors. Pn VKG3140', 'PC-20260108-0548-0B3254', 3, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Retaining ring. Pn VKG1060', 'PC-20260108-0549-76A8A8', 4, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Ridger swips', 'PC-20260108-0550-754796', 24, 10, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Rim/tire connector for Valtra tractors (used/none working)', 'PC-20260108-0551-773B72', 6, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Rims for Valtra tractors', 'PC-20260108-0552-7794E4', 4, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Rims for peat wagons (used)', 'PC-20260108-0553-8186EC', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Ring gear for Valtra tractors. Pn V33616200', 'PC-20260108-0554-82DAB6', 3, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Rocker switch for Valtra tractors. Pn ACV0233760', 'PC-20260108-0555-A2D10D', 2, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Rocker switch for Valtra tractors. Pn ACV0233770', 'PC-20260108-0556-29F28F', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Rocker switch for Valtra tractors. Pn V39136700', 'PC-20260108-0557-6567C9', 2, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Roller bearing 22309 MBW33C3', 'PC-20260108-0558-E24929', 0, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Roller bearing 33211 JR', 'PC-20260108-0559-27C4CF', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Roller bearing for Valtra final drive 32020', 'PC-20260108-0560-2C9B9C', 1, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Roller bearing for Valtra tractors for. Pn VLA9316', 'PC-20260108-0561-7DE09F', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Roller bearing. Pn VLA5938', 'PC-20260108-0562-4C2EA3', 0, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Rollway roller bearing 21309 GMEXW33', 'PC-20260108-0563-C9678A', 4, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Rollway roller bearing 22213 GMEXW33', 'PC-20260108-0564-C36019', 4, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Rubber block/shock absorber', 'PC-20260108-0565-7FFA8B', 32, 10, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Rubber sleeve for Valtra tractors. Pn V837091172', 'PC-20260108-0566-444914', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'SAFETY ELEMENT ASSY. Pn 87682991', 'PC-20260108-0567-EB426A', 2, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'SCR INLET TEM. Pn 320/A9184', 'PC-20260108-0568-D8D553', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'SCREEN AS for CAT. Pn 209-6002', 'PC-20260108-0569-EA18E2', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'SEAL FOR CAT. Pn 161-37ø5', 'PC-20260108-0570-9C5F91', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'SET SCREW M6 FOR JCB. Pn 1318/0205D', 'PC-20260108-0571-0E0D8D', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'SHIM for Valtra tractors for. Pn VLA9210', 'PC-20260108-0572-ACB270', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'SKF bearing 6209-2Z/C3', 'PC-20260108-0573-68DC5D', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'SKF bearing 6306-2RS1. Pn V610063665', 'PC-20260108-0574-26F582', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'SKF bearing 6308-2Z/C3', 'PC-20260108-0575-DA5829', 0, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'SKF bearing 63112Z/C3', 'PC-20260108-0576-FA0E01', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'SKF bearing. Pn 3308ANR', 'PC-20260108-0577-FE25C6', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'SKF roller bearing 30209', 'PC-20260108-0578-DDD092', 1, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'SOD peat cutter', 'PC-20260108-0579-16F10C', 31, 15, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'STANDARD F. Pn400/C0716', 'PC-20260108-0580-88DDE1', 3, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'SUPPORT FOR HOLDER OJK. Pn 606238', 'PC-20260108-0581-98EF0F', 60, 20, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Sandbags', 'PC-20260108-0582-5CE193', 1135, 5000, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Screw VHP1000 for Valtra tractors', 'PC-20260108-0583-60B2E5', 5, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Screw for Valtra tractors. Pn VHL1009', 'PC-20260108-0584-D19A0A', 6, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Screw for Valtra tractors. Pn VHL1019', 'PC-20260108-0585-956ED8', 4, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Screw for Valtra tractors. Pn VHP1028', 'PC-20260108-0586-2F88A8', 4, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Seal 0314392. for Cat Wheel loader.', 'PC-20260108-0587-91AF77', 0, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Seal 2H3935. For Cat Wheel loader', 'PC-20260108-0588-824425', 0, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Seal 8F9516. For Cat Wheel loader', 'PC-20260108-0589-BF54AE', 0, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Seal AGCO000477072 for Valtra tractors', 'PC-20260108-0590-EDAE34', 9, 4, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Seal for CAT. Pn 161-3695', 'PC-20260108-0591-08E941', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Seal for hydraulic cylinder. Pn 6330190415', 'PC-20260108-0592-92BC3F', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Seal kit V31887200 for Valtra tractors', 'PC-20260108-0593-0567CE', 5, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Seal kit for Valtra tractors. Pn AL5033709', 'PC-20260108-0594-D4463F', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Seal kit for Valtra tractors. Pn V36335200', 'PC-20260108-0595-7A069C', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Seal set for Valtra tractors. Pn V39444800', 'PC-20260108-0596-026E3C', 8, 4, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Sealing tape -side window - for Valtra tractors. Pn ACV005118A', 'PC-20260108-0597-A169A5', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Sealing tape for Valtra tractors. Pn ACV028604A', 'PC-20260108-0598-049DB1', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Sealing tape for Valtra tractors. Pn ACV0288814A', 'PC-20260108-0599-C36281', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Sealing washer for Valtra tractors. Pn F718301020710', 'PC-20260108-0600-566BD8', 6, 4, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Self taping screw for Valtra tractors. Pn VHP1002', 'PC-20260108-0601-3C6AE7', 36, 15, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Sender, pressure switch for Valtra tractors. PN V39418000', 'PC-20260108-0602-CCEB01', 3, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Service kit for Drone', 'PC-20260108-0603-BC50B7', 0, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Shaft 45/ 13/4" Z6-534. Pn 389630', 'PC-20260108-0604-F63209', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Shaft ACV0000890 for Valtra tractors', 'PC-20260108-0605-6604A1', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Shaft cover', 'PC-20260108-0606-D1C649', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Shaft for Chinese pump (used)', 'PC-20260108-0607-BDA260', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Shaft seal for Valtra tractors. Pn F835300020840', 'PC-20260108-0608-24C63E', 3, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Shaft seal for Valtra tractors. Pn VKH3060', 'PC-20260108-0609-DAAAB9', 0, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Shaft seal. Pn VKH3780', 'PC-20260108-0610-DE2D73', 7, 4, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Shaft sealing for Valtra tractors. Pn KH3780', 'PC-20260108-0611-1FCE61', 8, 4, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Shim kit ACV0244920 for Valtra tractors', 'PC-20260108-0612-258597', 4, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Shock absorbers', 'PC-20260108-0613-BC42F3', 0, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Sleeve for Valtra tractors. Pn V894670', 'PC-20260108-0614-CB9CF7', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Solenoid valve for Valtra tractors. Pn V36030010', 'PC-20260108-0615-4062EB', 3, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Sound insulation for Valtra tractors. Pn ACV0270360', 'PC-20260108-0616-454CB9', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Spacer for Valtra tractors. Pn 3786432M2', 'PC-20260108-0617-3C9B7F', 1, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Speed sensor for Valtra tractors. Pn V37080900', 'PC-20260108-0618-DC9469', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Spider for Valtra tractors. Pn 7400645004', 'PC-20260108-0619-04E5B7', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Splined flange 135/Z19. Pn 387935', 'PC-20260108-0620-BC08CE', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Spring V32805410 for Valtra tractors', 'PC-20260108-0621-108079', 16, 5, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Spring for Valtra tractors. Pn V30235000', 'PC-20260108-0622-EF1ADD', 70, 20, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Stabilizer bar ring', 'PC-20260108-0623-1F1101', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Starter motor C-brush. Pn V836879296', 'PC-20260108-0624-B52619', 1, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Starter motor for Valtra tractors. Pn 836873457', 'PC-20260108-0625-99A09D', 0, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Starter motor for Valtra tractors. Pn V836873457', 'PC-20260108-0626-8AAD26', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Starter motor solenoid for Valtra tractors. Pn V836879293', 'PC-20260108-0627-D79602', 0, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Steel cable', 'PC-20260108-0628-7D2F02', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Steel tire for Valtra tractors', 'PC-20260108-0629-29F288', 36, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Strainer. Pn 9P-7121', 'PC-20260108-0630-34CFC7', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Strainer. Pn V34650800', 'PC-20260108-0631-8B41CD', 20, 6, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Stud bolt ACV005076A for Valtra tractors', 'PC-20260108-0632-62F7E3', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Stud bolt for Valtra tractors. Pn ACV005079A', 'PC-20260108-0633-15CBA0', 6, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Stud nut bolt M20x350Mm', 'PC-20260108-0634-2785F1', 92, 30, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Suction hose for water pump', 'PC-20260108-0635-DA7DDE', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Super loader belt adjusting tool. Pn609446', 'PC-20260108-0636-F2ADD6', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Super loader bottom roller cover', 'PC-20260108-0637-BCFBE8', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Super loader roller. Pn 71705', 'PC-20260108-0638-43F143', 2, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Support for Valtra tractors. Pn ACV0264170', 'PC-20260108-0639-39DCDE', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Suspension sensor for Valtra tractors. Pn ACV0133710', 'PC-20260108-0640-E08FB3', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Swing thread', 'PC-20260108-0641-40C491', 959, 100, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'T-rod', 'PC-20260108-0642-38B1D1', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'TMAP sensor for JCB. Pn320/B9534', 'PC-20260108-0643-9A93EC', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'TR bearing unit T210. Pn UCT210', 'PC-20260108-0644-E10FE1', 10, 4, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Tank filter. Pn 167847A1', 'PC-20260108-0645-55493B', 3, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Taper roller bearing for Valtra tractors. Pn X619070000003', 'PC-20260108-0646-DAB720', 5, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Taper roller bearing for Valtra tractors. Pn X619070000003', 'PC-20260108-0647-963588', 6, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Temperatur sensor for Valtra tractors. Pn F737812145070', 'PC-20260108-0648-A9D641', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Temperatur sensor for Valtra tractors. Pn V37264010', 'PC-20260108-0649-FBF6D2', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Temperatur sensor for Valtra tractors. Pn V836667732', 'PC-20260108-0650-FDB9B0', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Temperatur sensor for Valtra tractors. Pn V837074294', 'PC-20260108-0651-3F4E9C', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Temperature sensor. Pn 320/06233', 'PC-20260108-0652-F346F1', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Thermal fuse for Valtra AC fan', 'PC-20260108-0653-191927', 86, 20, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Thermostat for Valtra tractors. Pn V836015156', 'PC-20260108-0654-7D982A', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Thermostat for Valtra tractors. Pn V836331590', 'PC-20260108-0655-3C7F5F', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Timken roller bearing 22213EJW33', 'PC-20260108-0656-1A1083', 6, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Tire for super loader (used / none working)', 'PC-20260108-0657-03B4FA', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Tire repair seal', 'PC-20260108-0658-46F242', 145, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Ton bags', 'PC-20260108-0659-31FD6B', 22930, 500, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Tool V894790 for Valtra tractors', 'PC-20260108-0660-D77702', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Tool box', 'PC-20260108-0661-BC4D62', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Torque gauge for Valtra. Pn X899980150000', 'PC-20260108-0662-5137B6', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Torque wrench. Pn T23N2-S', 'PC-20260108-0663-C517B8', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Track plates/shoes for CAT excavator', 'PC-20260108-0664-A56751', 207, 100, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Transmission joint for Italian pump', 'PC-20260108-0665-017DD6', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Transmission oil SAE50', 'PC-20260108-0666-AA788E', 600, 200, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Transmission shaft for Italian pump D45R4125C45. Pn056-0087', 'PC-20260108-0667-3252B7', 0, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Transmission shaft for Valtra tractors. Pn ACV003620B', 'PC-20260108-0668-9E4583', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Transmission shaft for Valtra tractors. Pn ACV003620B', 'PC-20260108-0669-1020C5', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Transmission shaft. Pn 1701040', 'PC-20260108-0670-059B93', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Trap water/water separator. Pn151071A1', 'PC-20260108-0671-BCD60F', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Trim panel shroud for Valtra tractors. Pn v837079833', 'PC-20260108-0672-9101B1', 12, 5, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Tube S235+N 12x1.5. Pn 92355', 'PC-20260108-0673-FAF6B3', 4, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Tube for Valtra tractors. Pn ACV0138260', 'PC-20260108-0674-2FDF18', 6, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Tube for Valtra tractors. Pn ACV0781510', 'PC-20260108-0675-644365', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Turn Signal & Position, Bulbs. Pn ACV0264790', 'PC-20260108-0676-3DD5AB', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Turning angle sensor for Valtra tractors. Pn V70115700', 'PC-20260108-0677-F3CF6D', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'UCF213', 'PC-20260108-0678-F4543D', 3, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'USB connector for JCB. Pn 334/E7008-01', 'PC-20260108-0679-350BAD', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Uncoupling lever bracket for Valtra tractors. Pn ACV023272A', 'PC-20260108-0680-C0258A', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Union for Valtra tractors. Pn V836859700', 'PC-20260108-0681-99729F', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Upholstery for Valtra tractors. Pn ACV0207520', 'PC-20260108-0682-2C5D4F', 3, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Used and none working parts for tractors, and other equipment', 'PC-20260108-0683-CBD592', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'V-belt 9.5X1000La / FM-39. 5', 'PC-20260108-0684-60F71A', 0, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'V-belt for Valtra tractors. Pn V33764400', 'PC-20260108-0685-508DED', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'V33772100 plate for Valtra tractors. Pn V33772100', 'PC-20260108-0686-F056F0', 7, 4, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'V837079428 connector for Valtra tractors', 'PC-20260108-0687-41CD6F', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'V892230 tool for Valtra tractors. Pn V892230', 'PC-20260108-0688-267D0A', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'V894700 tool for Valtra tractors. Pn V894700', 'PC-20260108-0689-A46363', 0, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'V894770 tool for Valtra tractors. Pn V894770', 'PC-20260108-0690-865ED7', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'V894850 tool for Valtra tractors. Pn V894850', 'PC-20260108-0691-A0C56C', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'VJB0952 bolt for Valtra tractors', 'PC-20260108-0692-17963B', 35, 15, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'VJD9107 washer for Valtra tractors. Pn ACV0757480', 'PC-20260108-0693-7E8EE5', 3, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'VJE6191 pin for Valtra tractors', 'PC-20260108-0694-D870DD', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'VYK9961 hose for Valtra tractors', 'PC-20260108-0695-9BCBC7', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Valtra rim/tire connector', 'PC-20260108-0696-74022C', 16, 6, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Valtra service kit (600H). Pn ACV0245700', 'PC-20260108-0697-D9FB09', 0, 4, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Valve for Valtra tractors. Pn V32552900', 'PC-20260108-0698-88A757', 25, 15, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Valve plate for Valtra tractors. Pn ACV005023B', 'PC-20260108-0699-5AAB52', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Washer M12 nord-lock', 'PC-20260108-0700-810B85', 12, 8, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Washer VJD0505 for Valtra tractors', 'PC-20260108-0701-C83CC6', 10, 5, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Washer nut and O-ring for Italian pump', 'PC-20260108-0702-C15BA8', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Water pump hose for Chinese yellow pump Ø300Mm', 'PC-20260108-0703-AC90EB', 5, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Water pump repair kit for Valtra tractors. Pn V837079838', 'PC-20260108-0704-83C471', 1, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Wheel bolt for Valtra tractors. Pn F718301020360', 'PC-20260108-0705-FB8A92', 3, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Wheel bolt for Valtra tractors. Pn F718301020360', 'PC-20260108-0706-565770', 4, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Wiper 30x40x7/10. Pn 40825', 'PC-20260108-0707-9740C3', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Wiper 45x55.7/10. Pn 40835', 'PC-20260108-0708-3B0356', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Wiper 60x75x7/10. Pn 40840', 'PC-20260108-0709-2C8AB2', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Wire ACV0769350 for Valtra tractors.', 'PC-20260108-0710-38BBF5', 1, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Work light for Valtra tractors. Pn ACV0123030', 'PC-20260108-0711-A877E7', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'hydraulic piston seal. 19094327', 'PC-20260108-0712-764558', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'insert rim for Valtra back tire (used)', 'PC-20260108-0713-8E13F3', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'miller drum for milling machine', 'PC-20260108-0714-121F12', 17, 6, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'pipe/hose connector for Italian pump (used)', 'PC-20260108-0715-3EED6B', 7, 4, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'starter motor bendix for Valtra tractors. Pn V836879296', 'PC-20260108-0716-50FECA', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

END $$;
