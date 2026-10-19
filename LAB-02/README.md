LAB-02 — Cifrado, credenciales y comunicaciones seguras

1. Introducción

El objetivo de esta práctica es implementar y analizar mecanismos básicos de protección criptográfica en PostgreSQL. Se estudia la protección de contraseñas, el cifrado de información sensible, la gestión de claves criptográficas y la seguridad de las comunicaciones entre clientes y servidor.

Una base de datos no está completamente protegida solamente por tener usuarios y permisos correctamente configurados. También es necesario proteger las credenciales, evitar la exposición de información sensible y utilizar mecanismos adecuados para proteger los datos durante su transmisión.

2. Protección de credenciales

Se comparó el almacenamiento de contraseñas en texto claro con el uso de funciones criptográficas de pgcrypto.

En el primer caso, una persona con permisos de lectura podría consultar directamente la contraseña almacenada. Para evitarlo, se utilizó crypt() junto con gen_salt('bf'), generando una representación hash de la contraseña.

Un hash para contraseñas no es equivalente al cifrado. El hash está diseñado para verificar una contraseña sin necesidad de recuperar el valor original, mientras que el cifrado permite recuperar el dato cuando se dispone de la clave correspondiente.

3. Protección de datos sensibles

Se utilizó la extensión pgcrypto para cifrar un RFC ficticio mediante pgp_sym_encrypt() y recuperarlo mediante pgp_sym_decrypt().

La práctica demuestra que el cifrado simétrico permite proteger información que necesita recuperarse posteriormente. Sin embargo, la clave debe administrarse de forma segura y no debe guardarse junto con los scripts que la utilizan.

4. Protección de las comunicaciones mediante TLS

Se revisó la configuración de seguridad de PostgreSQL mediante parámetros como ssl, ssl_min_protocol_version, port y listen_addresses. También se consultó la vista pg_stat_ssl para comprobar si la conexión actual utiliza TLS.

En la configuración revisada inicialmente, PostgreSQL 14 reportó ssl = off y la sesión actual reportó ssl = false. Por lo tanto, en ese momento no se encontraba activa una conexión TLS.

La configuración y verificación de TLS queda pendiente hasta generar o instalar un certificado válido para el entorno de laboratorio, habilitar SSL en el servidor y comprobar nuevamente la conexión.

5. Gestión de claves

Las claves criptográficas deben generarse, almacenarse, utilizarse y eliminarse de manera controlada. No deben incluirse claves reales en archivos SQL, repositorios Git, capturas de pantalla ni documentación pública.

Para esta práctica se utilizan datos y claves ficticias exclusivamente con fines educativos.

6. Resultados

Se identificó el riesgo de almacenar contraseñas en texto claro.

Se practicó la generación y verificación de hashes de contraseñas.

Se aplicó cifrado simétrico a un dato ficticio.

Se revisó la configuración de TLS de PostgreSQL.

Se identificó la necesidad de administrar correctamente las claves criptográficas.

Se elaboraron evidencias documentales y una política básica de gestión de claves.

7. Problemas encontrados

La instalación disponible en el equipo corresponde a PostgreSQL 14, mientras que la práctica especifica PostgreSQL 16 como motor principal. Esta diferencia debe tenerse en cuenta al interpretar los resultados.

Además, la configuración inicial reportó ssl = off y no se encontraron los archivos server.crt ni server.key en el directorio de datos. Por este motivo, se requiere preparar los certificados y habilitar TLS antes de documentar una verificación exitosa.

8. Conclusiones

La práctica permite comprender que la seguridad de una base de datos requiere varias medidas complementarias. Las contraseñas deben protegerse mediante mecanismos diseñados para ese propósito; los datos sensibles que necesitan recuperarse pueden cifrarse; y las comunicaciones deben protegerse mediante TLS correctamente configurado.

También se identificó que la gestión de claves es tan importante como el mecanismo criptográfico utilizado. En un entorno productivo sería necesario emplear una solución segura de gestión de secretos, proteger los respaldos, limitar los privilegios y verificar la identidad del servidor mediante certificados confiables.

9. Preguntas de reflexión

1. ¿Por qué una contraseña no debe almacenarse como texto claro?

Porque cualquier persona que obtenga acceso de lectura a la tabla podría conocer inmediatamente la contraseña. Esto podría permitir accesos no autorizados a la aplicación o a otros servicios donde se reutilice la misma credencial.

2. ¿Por qué un hash no es equivalente a un cifrado?

Porque el hash está diseñado para verificar información sin recuperar el valor original, mientras que el cifrado permite recuperar los datos mediante una clave adecuada.

3. ¿Por qué el cifrado de una columna no sustituye al control de acceso?

Porque el cifrado protege el contenido del dato, pero no administra por sí mismo qué usuarios pueden consultar, modificar o eliminar registros. Se necesitan permisos y roles para controlar el acceso.

4. ¿Por qué TLS no sustituye a los mecanismos de autorización de PostgreSQL?

Porque TLS protege la comunicación entre cliente y servidor, mientras que los roles y privilegios de PostgreSQL determinan qué operaciones puede realizar cada usuario.

5. ¿Qué ocurriría si una organización pierde una clave utilizada para cifrar información?

Podría perder la capacidad de recuperar los datos cifrados, dependiendo del sistema y de si existen copias de seguridad seguras de la clave.

6. ¿Qué ocurriría si una clave criptográfica se publica accidentalmente en GitLab?

Las personas que obtengan acceso a la clave podrían descifrar información protegida con ella. Sería necesario considerar la clave comprometida, revocarla o sustituirla y evaluar el alcance de la exposición.

7. ¿Por qué un repositorio privado no debe considerarse un almacén de secretos?

Porque los permisos pueden cambiar, las cuentas pueden verse comprometidas y los secretos pueden permanecer en el historial de Git incluso después de eliminarlos de un archivo.

8. ¿Qué diferencia existe entre proteger información almacenada y proteger información durante su transmisión?

La protección en reposo protege los datos guardados en tablas, archivos o respaldos. La protección en tránsito protege los datos mientras viajan entre sistemas, por ejemplo, mediante TLS.

9. ¿Por qué la gestión de claves es tan importante como el algoritmo criptográfico?

Porque una clave expuesta puede permitir descifrar la información aunque el algoritmo sea seguro. También es necesario poder controlar su acceso, rotación, respaldo y revocación.

10. ¿Qué mecanismo adicional implementarías para proteger los respaldos?

Implementaría cifrado de respaldos, almacenamiento con acceso restringido, copias protegidas de las claves y pruebas periódicas de restauración.