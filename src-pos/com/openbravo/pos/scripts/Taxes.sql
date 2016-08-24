INSERT INTO public.taxes(id, name, validfrom, category, custcategory, parentid, rate, ratecascade, rateorder)
  VALUES('00e2d1b6-f0ed-4069-9afb-90a7fef74e70', 'IVA 12%', '2011-08-01 00:00:00.0', '31ecd389-c8cd-493d-b72c-dff8ba78d1d0', '3602ca24-105a-45fd-b6f7-1330b1d2606c', NULL, 0.12, false, NULL);
INSERT INTO public.taxes(id, name, validfrom, category, custcategory, parentid, rate, ratecascade, rateorder)
  VALUES('000', 'Excento', '2001-01-01 00:00:00.0', '000', '3602ca24-105a-45fd-b6f7-1330b1d2606c', NULL, 0, false, NULL);
INSERT INTO public.taxes(id, name, validfrom, category, custcategory, parentid, rate, ratecascade, rateorder)
  VALUES('d5fdc182-2697-48e7-aa7c-2d61af36a77d', 'IVA 8%', '2011-08-01 00:00:00.0', '31ecd389-c8cd-493d-b72c-dff8ba78d1d0', 'b65fdedb-56d8-4d83-bb2d-3ae71ce52586', NULL, 0.08, false, NULL);
