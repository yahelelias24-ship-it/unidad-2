Evidencia 03 — Gestión de claves criptográficas

Objetivo

Identificar los riesgos de incluir claves criptográficas directamente en consultas SQL y comprender la importancia de administrarlas de forma segura.

Resultado obtenido

La consulta permite recuperar el dato cifrado cuando se proporciona la clave correcta. Sin embargo, una persona que pueda leer el script también puede conocer la clave de prueba.

Análisis

Si una clave real se almacena dentro de un script y el archivo se publica en GitLab, otras personas podrían obtenerla. Aunque posteriormente se elimine la clave del archivo, puede permanecer en el historial de commits.

La exposición de una clave puede permitir descifrar información protegida con ella. Si ocurre con una clave real, se debe considerar comprometida, sustituirla y evaluar qué datos pudieron quedar expuestos.

En un entorno real, las claves deben almacenarse en un sistema de gestión de secretos o de claves con acceso restringido, separado del repositorio de código. También se deben definir procedimientos para su generación, rotación, respaldo, revocación y eliminación.

Conclusión

La protección de la información cifrada depende de mantener las claves fuera de los scripts y de los repositorios. Una clave debe tratarse como un secreto sensible, con controles de acceso y procedimientos de gestión durante todo su ciclo de vida.

Medidas preventivas

No guardar claves reales en archivos SQL.

No subir contraseñas, tokens ni claves a GitLab.

Utilizar únicamente valores ficticios en las evidencias.

Restringir el acceso a las claves.

Rotar o sustituir cualquier clave real que haya quedado expuesta.