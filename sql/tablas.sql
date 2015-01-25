
--Atributos
SELECT * FROM public.attribute;
SELECT * FROM public.attributevalue;
SELECT * FROM public.attributeset;
SELECT * FROM public.attributeuse;

--Impuestos
SELECT * FROM public.taxcategories;
SELECT * FROM public.taxcustcategories;
SELECT * FROM public.taxes;  

--Inventario
SELECT * FROM public.stockcurrent;
--DELETE FROM public.stockdiary;
SELECT * FROM public.stockdiary;

--No valida la cantidad de los productos

SELECT 
	L.ID, 
	P.ID, 
	P.REFERENCE, 
	P.NAME,
	L.STOCKSECURITY, 
	L.STOCKMAXIMUM, 
	COALESCE(S.SUMUNITS, 0) 
FROM public.PRODUCTS P 
LEFT OUTER JOIN (
			SELECT 
				ID, 
				PRODUCT, 
				LOCATION, 
				STOCKSECURITY, 
				STOCKMAXIMUM 
			FROM public.STOCKLEVEL 
			WHERE LOCATION = '0'
		) L ON P.ID = L.PRODUCT 
LEFT OUTER JOIN (
			SELECT 
				PRODUCT, 
				SUM(UNITS) AS SUMUNITS 
			FROM public.STOCKCURRENT 
			WHERE LOCATION = '0' 
			GROUP BY PRODUCT
		) S ON P.ID = S.PRODUCT 
ORDER BY P.NAME


