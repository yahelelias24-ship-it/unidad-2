
CREATE EXTENSION IF NOT EXISTS pgcrypto;


CREATE SCHEMA pii;
CREATE SCHEMA analitica;


CREATE TABLE pii.mapa_cliente (
    token UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    cliente_id BIGINT UNIQUE NOT NULL
        REFERENCES public.clientes(id)
);


INSERT INTO pii.mapa_cliente (cliente_id)
SELECT id
FROM public.clientes;

CREATE TABLE analitica.clientes AS
SELECT
    m.token AS cliente_token,
    c.edad,
    c.ciudad,
    c.codigo_postal,
    c.fecha_alta
FROM pii.mapa_cliente AS m
JOIN public.clientes AS c
    ON c.id = m.cliente_id;