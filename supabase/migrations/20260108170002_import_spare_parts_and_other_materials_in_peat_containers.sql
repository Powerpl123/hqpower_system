-- Import from Spare parts and other materials in peat containers.xls
-- Generated on: 2026-01-08T14:51:20.793748

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
  WHERE department_id = wh_dept_id AND name ILIKE '%Spare Part%' LIMIT 1;

  IF target_class_id IS NULL THEN
    RAISE EXCEPTION 'Classification matching Spare Part not found';
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
  VALUES (wh_dept_id, target_class_id, target_loc_id, '12V 5W bulb', 'SP-20260108-0000-1C87BA', 3, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, '12V, 35A battery', 'SP-20260108-0001-F0C6B2', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, '2 core wire', 'SP-20260108-0002-F11952', 150, 20, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, '3 phase circuit breaker', 'SP-20260108-0003-DEA886', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, '3 phase multi function panel meter', 'SP-20260108-0004-BDE0B8', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, '7PK1516', 'SP-20260108-0005-7D9BC4', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'ASM-gearcase seal front drive', 'SP-20260108-0006-1BBEDA', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'ASM-pivot cap,sealed, M10', 'SP-20260108-0007-728998', 20, 5, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Accumulator D15 L87 flat', 'SP-20260108-0008-104EEA', 7, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Adjuster for knife miller', 'SP-20260108-0009-39C082', 6, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Air conditioner air filter. PnAC-1708', 'SP-20260108-0010-673939', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Air filter for CAT', 'SP-20260108-0011-C49A8B', 0, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Air filter for JCB. Pn 19902HE', 'SP-20260108-0012-6936B1', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Air filter for Perkins generator. Pn26510342', 'SP-20260108-0013-555871', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Air filter for Perkins generator. Pn26510362', 'SP-20260108-0014-178895', 3, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Air filter for Polaris', 'SP-20260108-0015-EB5289', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Air filter for Polaris. Pn 7080981', 'SP-20260108-0016-3F7A88', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Air filter for Polaris. Pn7081308', 'SP-20260108-0017-1AF7C4', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Air filter for Polaris. Pn7081706', 'SP-20260108-0018-3B2A18', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Air filter for blue truck', 'SP-20260108-0019-F08C85', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Allen bolt M12x40Mm', 'SP-20260108-0020-EF0E8D', 5, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Allen bolt M12x50Mm', 'SP-20260108-0021-9951EC', 11, 5, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Argon welding machine', 'SP-20260108-0022-44F5AC', 0, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'BA15S, 12V 21W', 'SP-20260108-0023-5C3CCD', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Ball bearing 6206 / 2Z C3', 'SP-20260108-0024-E71589', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Ball joint 10Mm for Polaris. Po7082507', 'SP-20260108-0025-D40FC6', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Ball joint for Polaris. Pn7082507', 'SP-20260108-0026-288F9B', 4, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Ball joint for Polaris. Po7061158', 'SP-20260108-0027-9A6571', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Ball joint. Pn387934', 'SP-20260108-0028-A9D50A', 6, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Battery terminal connectors', 'SP-20260108-0029-69CFDC', 2, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Battery water', 'SP-20260108-0030-97D191', 0, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Bearing DAC44720033', 'SP-20260108-0031-E8E185', 4, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Bearing Locker ID34Mm', 'SP-20260108-0032-3637B2', 4, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Bearing Locker for Polaris. Po7710533', 'SP-20260108-0033-B87974', 3, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Bearing Locker with O-ring', 'SP-20260108-0034-3FC91A', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Bearing ball for Polaris. Pn3514699', 'SP-20260108-0035-42AD34', 8, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Bearing holder', 'SP-20260108-0036-6C86F5', 5, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Bearing housing AS. RT60. Pn314088', 'SP-20260108-0037-965DE0', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Bearing housing, ID40Mm', 'SP-20260108-0038-3DAF3F', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Belt 6401.MO144', 'SP-20260108-0039-386C15', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Belt AX46', 'SP-20260108-0040-FC2E06', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Belt AX46 13x1175LI', 'SP-20260108-0041-6BC06D', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Belt B40.4. 8972414700', 'SP-20260108-0042-7B2960', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Belt BX36LI', 'SP-20260108-0043-363DC6', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Belt PHG SPA1150', 'SP-20260108-0044-A774C1', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Belt tensioner. Pn 3040069', 'SP-20260108-0045-339BA7', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Blet AX51 13x1300LI', 'SP-20260108-0046-FFA7FB', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Bolt M16x40Mm for Polaris. Po3040233', 'SP-20260108-0047-3CB984', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Bolt for wagon double wheel', 'SP-20260108-0048-A114F5', 7, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Bolts for wagon wheels', 'SP-20260108-0049-FD7909', 13, 5, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Boot - rear DOJ. Pn1332343', 'SP-20260108-0050-AE364B', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Boot kit for Polaris. Pn2201015', 'SP-20260108-0051-E16968', 4, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Boot kit for Polaris. Pn2206590', 'SP-20260108-0052-975BC9', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Boot kit for Polaris. Pn3235934', 'SP-20260108-0053-3A14BD', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Boot-seal rod for Polaris. Po5412929', 'SP-20260108-0054-EB1DE9', 4, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Boots kit for Polaris. Different sizes.', 'SP-20260108-0055-D39D62', 8, 4, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Bosch carbon brush', 'SP-20260108-0056-DEAF42', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Box kit. Pn2202015', 'SP-20260108-0057-21CE59', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Bracket ball joint. Po5211121', 'SP-20260108-0058-8830E9', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Brades for peat production miller', 'SP-20260108-0059-0621C3', 388, 20, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Brake disc for Polaris', 'SP-20260108-0060-6A4F3F', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Brake pad for Polaris. Pn2202413', 'SP-20260108-0061-6F91E9', 0, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Brake pads. Pn= KD2531', 'SP-20260108-0062-4C4AC3', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Brake shoes for Polaris. Pn 2205949', 'SP-20260108-0063-4551A2', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Breather hose', 'SP-20260108-0064-633517', 4, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Buckles M20', 'SP-20260108-0065-9E8ED1', 5, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Bulb 12V 100W (9005)', 'SP-20260108-0066-C9F0A5', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Bulb 24V 10W', 'SP-20260108-0067-2E0185', 7, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Bulb 24V 21/5W', 'SP-20260108-0068-E2E607', 3, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Bulb 24V 21W', 'SP-20260108-0069-EE25BC', 6, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Bushing -stab- link for Polaris. Po5432598', 'SP-20260108-0070-B5DCCE', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Bushing A-Arm-short for Polaris. Po5439270', 'SP-20260108-0071-6F957A', 9, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Bushing STD 3040240', 'SP-20260108-0072-BCF252', 3, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Bushing SUSP M10 for Polaris. Po5452233', 'SP-20260108-0073-075004', 22, 8, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Bushing for croshed pin', 'SP-20260108-0074-FADE12', 38, 10, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'CV boot. PnFB2049', 'SP-20260108-0075-E7234B', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Cable duct 45x45 Mm & 20x25Mm', 'SP-20260108-0076-58BC3F', 6, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Cable extension socket', 'SP-20260108-0077-658770', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Cable gland kit', 'SP-20260108-0078-188E8B', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Cilynder head gasket for Polaris. Pn3040099', 'SP-20260108-0079-70E420', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Circuit breaker 160A', 'SP-20260108-0080-AE4003', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Circuit breaker 20A', 'SP-20260108-0081-C10CFF', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Circuit breaker 32A', 'SP-20260108-0082-CF0481', 3, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Circuit breaker 350A', 'SP-20260108-0083-DD037E', 6, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Clamp boot small. Pn7080978', 'SP-20260108-0084-4CE368', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Clamp for boot DOJ', 'SP-20260108-0085-69CE69', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Clutch FT444506/F11800. Pn', 'SP-20260108-0086-3C8A38', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Clutch for Petrol Polaris', 'SP-20260108-0087-8D6E01', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Clutch wire. Pn58200H1', 'SP-20260108-0088-F556A6', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Compressor nozzle', 'SP-20260108-0089-3037B2', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Connecting rod bearing. Pn000342', 'SP-20260108-0090-D25964', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Connector 1-3/4" S.LUK. Pn50333', 'SP-20260108-0091-64B1AF', 4, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Connector 2-row 1" JL', 'SP-20260108-0092-9EC89E', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Connector M20', 'SP-20260108-0093-7FBDD6', 10, 4, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Copper washer 18x24x1Mm for Polaris', 'SP-20260108-0094-ACB5B4', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Copper washer for Polaris', 'SP-20260108-0095-324FD7', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Cover clutch assy. Pn31210-0K410', 'SP-20260108-0096-F22A78', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Crimper', 'SP-20260108-0097-EE4D81', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Croshed pin', 'SP-20260108-0098-CA5BDE', 38, 10, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Cross kit. Pn 20871', 'SP-20260108-0099-96123D', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Cross kit. Pn 4102L0012', 'SP-20260108-0100-78CC25', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Cross kit. Pn 4120L005', 'SP-20260108-0101-50B7A3', 2, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Current transformer', 'SP-20260108-0102-019312', 4, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Cylinder head cover gasket for Polaris. Pn3040304', 'SP-20260108-0103-F52DBE', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'DJI phantom drone', 'SP-20260108-0104-DC728A', 0, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Degreaser (expired at 25-10-2023)', 'SP-20260108-0105-4A3590', 3, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Diesel filter for Blue track', 'SP-20260108-0106-783118', 0, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Diesel throttle cable. Pn7082337', 'SP-20260108-0107-B5971C', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Distribution board', 'SP-20260108-0108-5DBBEC', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Drive belt A40 13x1015L', 'SP-20260108-0109-52DA04', 0, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Drive belt B-36 17x925', 'SP-20260108-0110-A22E36', 5, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Drive belt. Pn3211175', 'SP-20260108-0111-62071A', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'EXH V seat for Polaris. Po3040155', 'SP-20260108-0112-11B494', 3, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Electrical panel box', 'SP-20260108-0113-00E6BE', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Electrical panel box', 'SP-20260108-0114-5E3F18', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Electrical panel box', 'SP-20260108-0115-4EF5E8', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Element - SEC', 'SP-20260108-0116-9B83F1', 0, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Element SUB-assy, air CLE. Pn17801-0L040', 'SP-20260108-0117-88463D', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Element SUB-assy, cabin CLE', 'SP-20260108-0118-747DE2', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Element SUB-assy. Pn17801-28010', 'SP-20260108-0119-64A96A', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Element SUB-assy. Pn17801-30040', 'SP-20260108-0120-235358', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Element SUB-assy. Pn17801-61030', 'SP-20260108-0121-3A73F9', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Female and male couplers - hydraulic', 'SP-20260108-0122-9D888E', 9, 5, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Filter', 'SP-20260108-0123-21E661', 0, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Filter - CAB A', 'SP-20260108-0124-32AA67', 0, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Filter R3/8 S2150. Pn373007000', 'SP-20260108-0125-1174C6', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Filter for JCB', 'SP-20260108-0126-A5D03D', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Filter. KAJ11040', 'SP-20260108-0127-B43B4F', 0, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Fire fighting hose', 'SP-20260108-0128-CB969D', 3, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Flange', 'SP-20260108-0129-8CA303', 9, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Flange 245-317', 'SP-20260108-0130-2541E7', 6, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Flange 387847', 'SP-20260108-0131-CE70DD', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Flexibel hose', 'SP-20260108-0132-02753E', 30, 10, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Friction disc. Pn247006351R08', 'SP-20260108-0133-F318F3', 8, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Front left half shaft assembly for Polaris', 'SP-20260108-0134-FCF4AE', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Front wheel nut, M24', 'SP-20260108-0135-77CA62', 12, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Fuel and water separator for Perkins generator. Pn4415122', 'SP-20260108-0136-74C0B4', 0, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Fuel filter for Perkins generator. Pn26560301', 'SP-20260108-0137-2A7DEC', 0, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Fuel filter for Polaris. Pn3040038', 'SP-20260108-0138-0D9E21', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Fuel filter for Toyota Hilux. Pn23390-0L070', 'SP-20260108-0139-96671A', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Fuel filter. Pn23303-64010', 'SP-20260108-0140-21026B', 0, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Fuel injection assy', 'SP-20260108-0141-E5EB49', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Fuel injector valve', 'SP-20260108-0142-997944', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Fuel water separator for CAT', 'SP-20260108-0143-785DDD', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Gasket for Polaris. Pn3040083', 'SP-20260108-0144-909095', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Gasket input manifold. Pn3040076', 'SP-20260108-0145-8B553C', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Gear pump VOP 109. Pn64030', 'SP-20260108-0146-1CA333', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Grease nipple connector/adapter', 'SP-20260108-0147-C0F389', 1, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Greasing pump pipe', 'SP-20260108-0148-74947B', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Green indicator/indication light', 'SP-20260108-0149-57C0EB', 1, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Green push button', 'SP-20260108-0150-3FB953', 4, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'H1 24V 100W', 'SP-20260108-0151-23EE0C', 10, 5, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'H11 12V 100W', 'SP-20260108-0152-68DF86', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'H4 24V 75/70W', 'SP-20260108-0153-15C7E4', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'H7 12V 55W', 'SP-20260108-0154-662980', 2, 4, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'H9 12V 65W', 'SP-20260108-0155-47F007', 7, 5, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'HUB-Wheel,Mach,BLK. Pn5142964-067', 'SP-20260108-0156-C4F8A1', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Half threaded bolt M10x275Mm', 'SP-20260108-0157-78F2DA', 5, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Half threaded bolt M10x70Mm', 'SP-20260108-0158-EE0C08', 8, 4, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Half threaded bolt M10x94Mm for Polaris', 'SP-20260108-0159-D8FA11', 14, 5, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Half threaded bolt M10x95Mm', 'SP-20260108-0160-6CAFD5', 3, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Half threaded bolt M12x50Mm', 'SP-20260108-0161-F85200', 10, 5, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Half threaded bolt M16x80Mm', 'SP-20260108-0162-058127', 14, 5, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Half threaded bolt M8x60', 'SP-20260108-0163-599C92', 9, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Half threaded bolt for Polaris M10x60Mm. Pn7519306', 'SP-20260108-0164-36EF87', 6, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Heavy duty cleaner', 'SP-20260108-0165-0D1534', 11, 4, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hook screw', 'SP-20260108-0166-EFA30B', 32, 5, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hose clamp', 'SP-20260108-0167-9C9FC7', 3, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hose connector 3/8"', 'SP-20260108-0168-91FA20', 3, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hose fitting for portable water pump', 'SP-20260108-0169-7D0A35', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hose fitting for water pump', 'SP-20260108-0170-42F962', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hydraulic check valve', 'SP-20260108-0171-BAA6F4', 1, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hydraulic cylinder for wagon', 'SP-20260108-0172-7820D9', 8, 4, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hydraulic filter', 'SP-20260108-0173-400087', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hydraulic hose MEE9004. L120Cm', 'SP-20260108-0174-0099E7', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hydraulic pipe', 'SP-20260108-0175-CC3B1D', 4, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hydraulic pipe', 'SP-20260108-0176-900A2F', 4, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hydraulic pipe (USED)', 'SP-20260108-0177-908F6A', 4, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hydraulic pipe 1/2"', 'SP-20260108-0178-5D8EE3', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hydraulic pipe 1/2" 275 BAR', 'SP-20260108-0179-338E59', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hydraulic pipe 1/2", 275 BAR', 'SP-20260108-0180-5AAC82', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hydraulic pipe 1/2", 275 BAR', 'SP-20260108-0181-89301D', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hydraulic pipe 1/2", 275BAR', 'SP-20260108-0182-8C174C', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hydraulic pipe 1/2", 350 BAR (used)', 'SP-20260108-0183-6097E1', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hydraulic pipe 3/8", 18840 PSI', 'SP-20260108-0184-86459D', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hydraulic pipe 3/8", 276 BAR', 'SP-20260108-0185-400F0B', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hydraulic pipe 3/8", 350 BAR', 'SP-20260108-0186-A9D712', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hydraulic pipe 3/8", 350 BAR', 'SP-20260108-0187-AFF195', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hydraulic pipe 3/8", 445 BAR', 'SP-20260108-0188-569790', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hydraulic pipe 3/8", 7685PSI', 'SP-20260108-0189-01EC0F', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hydraulic pipe connector adapter for tractors', 'SP-20260108-0190-B49A1B', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hydraulic pipe coupling', 'SP-20260108-0191-38DD6C', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Hydraulic pump', 'SP-20260108-0192-7565E1', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Ignition switch for Polaris', 'SP-20260108-0193-076F2B', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Ignition switch. Pn4012166', 'SP-20260108-0194-FF3268', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Intake/exhaust valve seal', 'SP-20260108-0195-FE6D95', 12, 4, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'IntakeV for Polaris', 'SP-20260108-0196-F2660C', 6, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'JCB hydraulic filter', 'SP-20260108-0197-13F234', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'JCB hydraulic filter. Pn= LPN0012031196', 'SP-20260108-0198-468826', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'JCB hydraulic filter. Pn= N0012144638', 'SP-20260108-0199-970FA8', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'JCB micro REL 24V. Pn347/20478', 'SP-20260108-0200-2D73A6', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'JCB oil filter. Pn320/04133', 'SP-20260108-0201-56A0FE', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'JCB oil filter. Pn334/G5406', 'SP-20260108-0202-B51315', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'JCB sensor TMA. Pn320/09687', 'SP-20260108-0203-7C47B0', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'JCB service kit. Pn320/07414', 'SP-20260108-0204-6F1BBB', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Knife holder for miller', 'SP-20260108-0205-608FA6', 12, 4, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Knife/wing for production miller', 'SP-20260108-0206-43037A', 60, 15, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'L- connectors M20', 'SP-20260108-0207-D237F0', 5, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'LC1-D contactor', 'SP-20260108-0208-3A1F99', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Lamp socket', 'SP-20260108-0209-33D1EA', 12, 5, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Link ball', 'SP-20260108-0210-C51013', 40, 10, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Locking plate. Pn96016', 'SP-20260108-0211-3076B0', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Lower link guide cone and ball assembly. Pn 02400110AI', 'SP-20260108-0212-BB8D83', 69, 20, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Mechanical seal 65x80x8Mm', 'SP-20260108-0213-595EF4', 11, 4, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Mechanical seal 70x88x8Mm', 'SP-20260108-0214-E7BED3', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Metallic round plate', 'SP-20260108-0215-262DDA', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Metallic support', 'SP-20260108-0216-C7C8AA', 10, 4, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Metallic support', 'SP-20260108-0217-62E428', 4, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Mixed bolts M16 used', 'SP-20260108-0218-E70F24', 51, 15, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Mount isolator drive line. Pn1332955', 'SP-20260108-0219-A8FE15', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Mounting rail', 'SP-20260108-0220-AB1503', 5, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'NF 903 spider, 90', 'SP-20260108-0221-501AC9', 6, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Name should be checked 484300', 'SP-20260108-0222-AC9026', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Nut M10', 'SP-20260108-0223-8EE0DD', 37, 10, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Nut M10, Pn7547333', 'SP-20260108-0224-50D1AB', 5, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Nut M10. Pn7542439', 'SP-20260108-0225-455E76', 37, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Nut M12x1.25 NYLOC', 'SP-20260108-0226-A1972C', 45, 10, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Nut M16', 'SP-20260108-0227-9E1490', 86, 15, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Nut M20', 'SP-20260108-0228-3E6C85', 19, 5, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Nut and spring washer M20', 'SP-20260108-0229-96EFEA', 10, 4, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Nut bolt M14x98Mm', 'SP-20260108-0230-55E9D5', 12, 4, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Nut bolt M24x150Mm', 'SP-20260108-0231-1D7FE6', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'O-ring for Polaris', 'SP-20260108-0232-961DF3', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'O-ring from peat', 'SP-20260108-0233-91491A', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'O-ring. Pn 7151105', 'SP-20260108-0234-A36748', 12, 6, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'O-ring. Pn40550', 'SP-20260108-0235-2CD4A6', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'O-ring. Po3040002', 'SP-20260108-0236-1E270B', 4, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Offset link', 'SP-20260108-0237-A6A4FB', 4, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Oil filter SC-115. Pn90915-03006', 'SP-20260108-0238-1EBA13', 0, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Oil filter for Polaris. Pn 502067', 'SP-20260108-0239-9EE08B', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Oil filter for Polaris. Pn2520799', 'SP-20260108-0240-6836B7', 4, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Oil filter for Toyota Hilux. Pn 90915-3002-8T', 'SP-20260108-0241-EEB09B', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Oil filter for Toyota Hilux. Pn90915-YZZD2', 'SP-20260108-0242-22EEA8', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Orange indicator light', 'SP-20260108-0243-6ABE07', 4, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Oxygen cylinder', 'SP-20260108-0244-9C8F50', 0, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Paper bags', 'SP-20260108-0245-4DC2F8', 68, 10, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Parking brake pedal for Polaris', 'SP-20260108-0246-3A2AD1', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Pin 28x115Mm', 'SP-20260108-0247-F05086', 1, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Pin 30x125Mm', 'SP-20260108-0248-E03BBF', 3, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Pin 32x125Mm', 'SP-20260108-0249-30AB5E', 7, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Pin 32x145Mm', 'SP-20260108-0250-EC4D63', 5, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Pin 36x155Mm', 'SP-20260108-0251-333F59', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Pin locker', 'SP-20260108-0252-4F386F', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Pin locker', 'SP-20260108-0253-494289', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Pin locker', 'SP-20260108-0254-2C3FFA', 4, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Pin locker (pin)', 'SP-20260108-0255-C08929', 4, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Pipe POC-3900 L-130. Pn 437221', 'SP-20260108-0256-79050D', 9, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Pipe holders', 'SP-20260108-0257-AC3615', 12, 5, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Piston connecting rod 0309 for Polaris', 'SP-20260108-0258-98A974', 4, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Piston ring', 'SP-20260108-0259-0C1A66', 0, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Piston ring. Pn3425423', 'SP-20260108-0260-393022', 4, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Piston set for Petrol Polaris', 'SP-20260108-0261-B48359', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Piston set for Polaris. Pn3040303', 'SP-20260108-0262-42582E', 3, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Plastic welding rod', 'SP-20260108-0263-C68449', 7, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Polyuretan resin (expired in 2016', 'SP-20260108-0264-C6E499', 0, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Power transmission belt. Pn9.5x900', 'SP-20260108-0265-D8B687', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Pressure limiter valve', 'SP-20260108-0266-CBB890', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Projector led lights/lamp 100W', 'SP-20260108-0267-7FE6B8', 5, 5, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Projector light 1000W one with halogen bulb and one without', 'SP-20260108-0268-F15AE9', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Rear mirror 048748', 'SP-20260108-0269-26D8A7', 0, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Red indicator light', 'SP-20260108-0270-EE57E4', 4, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Red push button', 'SP-20260108-0271-BB136F', 4, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Reducer from 18Mm to 5Mm', 'SP-20260108-0272-8229B7', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Repair kit. Pn96957035', 'SP-20260108-0273-857A26', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Rod end 10Mm for Polaris. Po7061138', 'SP-20260108-0274-DE0F8C', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Roller chain', 'SP-20260108-0275-41F9B7', 4, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Roller chain connecting link', 'SP-20260108-0276-C25E45', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Roller chain. Pn5023415', 'SP-20260108-0277-7C0D32', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Roterande dragögla', 'SP-20260108-0278-81A49A', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'SLTP 6. X30', 'SP-20260108-0279-101AB2', 404, 20, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'STUD wheel M12-15. Po7519763', 'SP-20260108-0280-C68A2E', 8, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Screw leveler Bearing Assembly', 'SP-20260108-0281-47E887', 0, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Seal - Air box cover for Polaris. Po5812964', 'SP-20260108-0282-C78992', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Service kit for Drone', 'SP-20260108-0283-668195', 0, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Shaft A-Arm short for Polaris', 'SP-20260108-0284-D4B78D', 10, 4, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Shaft for wagon', 'SP-20260108-0285-1290C5', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Shaft pivot - short, M10. Pn5139966', 'SP-20260108-0286-5365E0', 4, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Shaft pivot 230Mm M10', 'SP-20260108-0287-DB05F0', 4, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Shaft seal kit. Pn96455086', 'SP-20260108-0288-B0D19F', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Shaft seal kit. Pn96956228', 'SP-20260108-0289-3F2287', 3, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Share bolt M16. Pn488247', 'SP-20260108-0290-8A41A2', 24, 8, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Shock cable for Polaris', 'SP-20260108-0291-0B0CC6', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Shock-box,dump-RGR-441Mm. Pn7045663', 'SP-20260108-0292-CE4E60', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Shoe kit brake RR for Toyota Hilux', 'SP-20260108-0293-D04745', 5, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Side typ wagon cylinder nyp', 'SP-20260108-0294-BB8ECC', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Small rivit', 'SP-20260108-0295-3666D3', 454, 50, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Small roller bearing', 'SP-20260108-0296-C0D2D5', 4, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Spark plug for Toyota Hilux', 'SP-20260108-0297-F78A5B', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Spinotto 20x55. Pn. ED0084844810', 'SP-20260108-0298-97A5E1', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Sprocket', 'SP-20260108-0299-71D11B', 4, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Steering boot kit. PnYB03-1001', 'SP-20260108-0300-238BF5', 1, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Steering shaft boot. Pn C-1543', 'SP-20260108-0301-FBF9A1', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Stop and start button', 'SP-20260108-0302-986C3D', 8, 4, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Stopper M20', 'SP-20260108-0303-B0ADEB', 3, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Strainer. Pn334/E0520', 'SP-20260108-0304-B49E55', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Stretcher frame WB210-3', 'SP-20260108-0305-DFECD8', 6, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Stud bolt M20x1000Mm', 'SP-20260108-0306-692FE9', 9, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Switches for household lamp', 'SP-20260108-0307-232DAD', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Tee connectors M20', 'SP-20260108-0308-C8332A', 9, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Thermal relay 37-50A', 'SP-20260108-0309-D382A5', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Thermal relay 37-50A', 'SP-20260108-0310-558643', 4, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Timer relay GRT8-ST', 'SP-20260108-0311-17575B', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Timing belt for Polaris. Pn3040043', 'SP-20260108-0312-D36EA7', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Toyota oil filter. Pn9091-30002-8T', 'SP-20260108-0313-9942B8', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Tyre valve connector', 'SP-20260108-0314-0BFBC9', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'V-belt for Polaris. Pn3040043', 'SP-20260108-0315-467843', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'V-belt. Pn3040044', 'SP-20260108-0316-D05674', 3, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Valtra tractor front window', 'SP-20260108-0317-28A273', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Valve stem seal', 'SP-20260108-0318-C57920', 12, 4, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Washer M10 for Polaris. Po7555761', 'SP-20260108-0319-157517', 8, 2, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Washer M16', 'SP-20260108-0320-D4E7A6', 193, 20, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Washer M16', 'SP-20260108-0321-FD8695', 245, 20, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Washer M20', 'SP-20260108-0322-FD8779', 14, 5, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Washer. Pn20x28', 'SP-20260108-0323-E6291A', 12, 4, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Washers and gasket kit for Polaris.', 'SP-20260108-0324-4D4BB5', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Water fuel separator. Pn2521087', 'SP-20260108-0325-E0A838', 7, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Water level meter', 'SP-20260108-0326-E6E0FD', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Wel throttle pedal for Polaris. Pn1021271-458', 'SP-20260108-0327-2066E3', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Welding electrode 6010x3.15', 'SP-20260108-0328-EB5F71', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Welding electrode E9015, 2.5Mm', 'SP-20260108-0329-B8C117', 1, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Welding glasses', 'SP-20260108-0330-AAB1EA', 6, 4, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Welding glasses', 'SP-20260108-0331-0F4DC1', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Wheel bearing for Polaris. Po3514635', 'SP-20260108-0332-8E4471', 8, 4, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Wheel bearing. DAC40740040', 'SP-20260108-0333-511051', 8, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Wheel bearing. Po1010/19', 'SP-20260108-0334-518B94', 2, 0, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Wheel nut for wagon M28', 'SP-20260108-0335-6E6874', 6, 3, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'Zip ties', 'SP-20260108-0336-B3E354', 25, 5, 'pcs')
  ON CONFLICT DO NOTHING;

  INSERT INTO public.inventory_items (department_id, classification_id, location_id, item_name, item_number, quantity, min_quantity, unit)
  VALUES (wh_dept_id, target_class_id, target_loc_id, 'spherical bearing', 'SP-20260108-0337-D05B4F', 2, 1, 'pcs')
  ON CONFLICT DO NOTHING;

END $$;
