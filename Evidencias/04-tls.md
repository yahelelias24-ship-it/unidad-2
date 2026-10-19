# Evidencia 04: Verificación de TLS

## Objetivo

Verificar si la conexión actual con PostgreSQL utiliza TLS y analizar la protección de las comunicaciones entre el cliente y el servidor.

## Comando o procedimiento

Se ejecutaron consultas para revisar los parámetros `ssl`, `ssl_min_protocol_version`, `port` y `listen_addresses`. También se consultó la vista `pg_stat_ssl` para comprobar si la sesión actual utiliza una conexión cifrada.

## Resultado obtenido

La consulta a `pg_stat_ssl` devolvió `ssl = false`, lo que indica que la sesión actual no utiliza TLS. Por lo tanto, no se obtuvo una versión TLS ni un algoritmo de cifrado para esa sesión.

## Análisis

Aunque PostgreSQL puede admitir conexiones TLS, el resultado indica que la conexión utilizada en esta prueba no está cifrada mediante TLS. Es necesario revisar la configuración del servidor y del cliente para determinar cómo establecer una conexión protegida.

## Conclusión

La consulta permitió identificar que la sesión actual no utiliza TLS. Este resultado demuestra la importancia de verificar la conexión real y no solamente comprobar si el servidor tiene habilitada la opción SSL.