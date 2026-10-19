Evidencia 08 — Análisis de escenario de seguridad

Objetivo

Analizar los riesgos de seguridad que pueden presentarse en una base de datos y proponer medidas para reducirlos.

Descripción del escenario

Una empresa almacena información de sus clientes en una base de datos PostgreSQL. Entre los datos almacenados se encuentran nombres, RFC y contraseñas de usuarios. Sin embargo, algunos datos se guardan sin protección suficiente y la empresa no tiene una política clara para administrar sus claves.

Además, las conexiones con el servidor podrían no utilizar cifrado y algunos archivos de respaldo podrían estar disponibles para personas que no deberían tener acceso a ellos.

Riesgos identificados

Uno de los principales riesgos es almacenar contraseñas en texto plano. Si una persona no autorizada obtiene acceso a la base de datos, podría conocer las contraseñas de los usuarios y utilizarlas para intentar acceder a otros sistemas.

Otro riesgo es guardar datos personales sin cifrado. En caso de una filtración, la información podría utilizarse de manera indebida y afectar la privacidad de los clientes.

También existe el riesgo de que la información sea interceptada durante la comunicación entre el cliente y el servidor si no se utiliza una conexión protegida mediante TLS.

Por último, guardar las claves criptográficas directamente en los archivos del proyecto o permitir el acceso a los respaldos sin restricciones puede facilitar que personas no autorizadas obtengan información confidencial.

Medidas de seguridad propuestas

Para proteger las contraseñas, se deben utilizar funciones de hash diseñadas para este propósito, como bcrypt, evitando almacenarlas directamente en la base de datos.

Los datos personales que necesiten recuperarse deben cifrarse utilizando mecanismos adecuados y claves protegidas. El acceso a la información debe limitarse mediante roles y permisos de PostgreSQL.

También se debe configurar TLS para proteger las comunicaciones entre el cliente y el servidor, verificando que la conexión realmente esté cifrada.

Los respaldos deben almacenarse en ubicaciones seguras, con acceso restringido y cifrado cuando sea necesario. Las claves no deben incluirse directamente en el código fuente ni subirse a repositorios públicos.

Finalmente, la empresa debe establecer una política de gestión de claves que indique cómo se generan, almacenan, utilizan, rotan y revocan.

Conclusión

La seguridad de una base de datos requiere aplicar varias medidas en conjunto. No basta con proteger las contraseñas o cifrar algunos datos; también es necesario proteger las comunicaciones, administrar correctamente las claves, controlar los permisos y mantener seguros los respaldos. Estas acciones ayudan a reducir el riesgo de filtraciones y accesos no autorizados.