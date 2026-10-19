
SELECT
    CASE
        WHEN edad < 30 THEN 'Menos de 30'
        WHEN edad BETWEEN 30 AND 39 THEN '30-39'
        WHEN edad BETWEEN 40 AND 49 THEN '40-49'
        ELSE '50 o más'
    END AS rango_edad,
    LEFT(codigo_postal, 2) AS prefijo_postal,
    COUNT(*) AS cantidad_clientes
FROM public.clientes
GROUP BY
    CASE
        WHEN edad < 30 THEN 'Menos de 30'
        WHEN edad BETWEEN 30 AND 39 THEN '30-39'
        WHEN edad BETWEEN 40 AND 49 THEN '40-49'
        ELSE '50 o más'
    END,
    LEFT(codigo_postal, 2)
ORDER BY rango_edad, prefijo_postal;


SELECT
    '30-49' AS rango_edad,
    '8****' AS zona_postal,
    COUNT(*) AS cantidad_clientes
FROM public.clientes
WHERE edad BETWEEN 30 AND 49
  AND codigo_postal LIKE '8%'
HAVING COUNT(*) >= 5;
