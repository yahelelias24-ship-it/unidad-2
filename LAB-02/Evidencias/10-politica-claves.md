Evidencia 10 — Política mínima de gestión de claves criptográficas

Objetivo

Establecer reglas básicas para proteger las claves criptográficas utilizadas por las aplicaciones y bases de datos de una organización.

Política

Regla 1. Generación de claves

Las claves deberán generarse mediante herramientas y procedimientos criptográficos confiables. No se deberán utilizar claves débiles, predecibles ni reutilizadas sin una justificación de seguridad.

Regla 2. Almacenamiento

Las claves reales no deberán guardarse en scripts SQL, código fuente, archivos de documentación ni repositorios Git. Se utilizará un almacén seguro de secretos o claves apropiado para el entorno.

Regla 3. Control de acceso

Solamente las personas, aplicaciones y servicios autorizados podrán acceder a las claves necesarias para sus funciones. Se aplicará el principio de mínimo privilegio.

Regla 4. Uso de las claves

Las claves deberán utilizarse únicamente para los fines autorizados. No se deberán compartir por mensajes, capturas de pantalla, documentos públicos o canales no aprobados.

Regla 5. Rotación

Las claves se sustituirán de acuerdo con el riesgo, las políticas de la organización y los requisitos del sistema. También deberán cambiarse cuando exista sospecha o confirmación de exposición.

Regla 6. Respaldo y recuperación

Las claves necesarias para recuperar información deberán contar con un procedimiento de respaldo y recuperación seguro. Las copias deberán tener acceso restringido y almacenarse separadas de los datos que protegen.

Regla 7. Revocación y exposición accidental

Cuando una clave se exponga o deje de estar autorizada, se deberá revocar o sustituir tan pronto como sea posible. También se evaluará si los datos protegidos pudieron quedar comprometidos.

Regla 8. Eliminación

Las claves que ya no sean necesarias deberán eliminarse de manera segura conforme a los procedimientos de la organización y los requisitos de conservación aplicables.

Regla 9. Revisión de repositorios

Antes de publicar cambios en GitLab, se revisarán los archivos para detectar contraseñas, tokens, claves y otros secretos. Si se descubre una clave real en el historial, eliminarla del archivo no será suficiente: se deberá considerar comprometida y actuar en consecuencia.

Análisis

La gestión de claves es esencial porque la confidencialidad de los datos cifrados depende de mantener las claves fuera del alcance de personas no autorizadas. Un algoritmo criptográfico adecuado no evita los daños que puede provocar una clave expuesta, perdida o administrada incorrectamente.

Conclusión

Estas reglas permiten establecer controles básicos durante todo el ciclo de vida de las claves criptográficas. En un entorno productivo deberán complementarse con procedimientos técnicos, responsabilidades definidas, auditoría y herramientas de gestión de secretos apropiadas.