Evidencia 01 — Protección de credenciales

Objetivo

Comparar el almacenamiento de contraseñas en texto claro con el uso de hashes para proteger credenciales en PostgreSQL.
Resultado obtenido

En la tabla insegura, la contraseña se almacena como texto legible. En la tabla protegida se almacena una representación hash, que permite verificar la contraseña sin guardar directamente el valor original.

La verificación debe devolver true para la contraseña correcta y false para la incorrecta.

Análisis

Guardar contraseñas en texto claro representa un riesgo porque una filtración de la tabla expone directamente las credenciales. El uso de crypt() con gen_salt('bf') permite generar una representación con sal que dificulta los ataques de fuerza bruta.

Este mecanismo es un hash para contraseñas, no un cifrado reversible. En aplicaciones reales se debe elegir un algoritmo de protección de contraseñas recomendado y compatible con la aplicación.

Conclusión

Las contraseñas no deben almacenarse directamente en la base de datos. Es preferible almacenar una representación hash diseñada para contraseñas y verificarla cuando el usuario intenta autenticarse.