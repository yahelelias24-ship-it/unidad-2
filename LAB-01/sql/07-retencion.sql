SELECT
    id,
    nombre,
    fecha_alta
FROM public.clientes
WHERE fecha_alta < CURRENT_DATE - INTERVAL '5 years'
ORDER BY fecha_alta;


SELECT
    COUNT(*) AS registros_antiguos
FROM public.clientes
WHERE fecha_alta < CURRENT_DATE - INTERVAL '5 years';


SELECT
    id,
    fecha_alta,
    CASE
        WHEN fecha_alta < CURRENT_DATE - INTERVAL '5 years'
            THEN 'Revisar retención'
        ELSE 'Dentro del periodo'
    END AS estado_retencion
FROM public.clientes
ORDER BY fecha_alta;