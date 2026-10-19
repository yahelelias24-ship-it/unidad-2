CREATE ROLE analista NOLOGIN;

GRANT USAGE
ON SCHEMA analitica
TO analista;

GRANT SELECT
ON analitica.clientes
TO analista;

REVOKE ALL ON TABLE public.clientes FROM analista;


REVOKE ALL ON TABLE pii.mapa_cliente FROM analista;

set role analista;
SELECT *
FROM analitica.clientes;

SELECT *
FROM pii.mapa_cliente;

SELECT *
FROM public.clientes;
