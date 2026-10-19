 

ACTIVIDAD 1.-

| Campo | ¿Identifica directamente? | ¿Puede contribuir a identificar? | ¿Requiere protección? | Justificación |
|---|---|---|---|---|
| id | No necesariamente | Sí | Sí | Identifica un registro y puede vincularse con otros datos. |
| nombre | Sí | Sí | Sí | Permite reconocer directamente al cliente. |
| correo | Sí, generalmente | Sí | Sí | Puede identificar y contactar al cliente. |
| telefono | Sí, generalmente | Sí | Sí | Puede vincularse con una persona. |
| rfc | Sí, en este contexto | Sí | Sí | Es un identificador fiscal. |
| edad | No, por sí sola normalmente | Sí | Sí | Combinada con otros datos puede distinguir a una persona. |
| ciudad | No, por sí sola normalmente | Sí | Sí | Puede ayudar a identificar junto con otros atributos. |
| codigo_postal | No, por sí solo normalmente | Sí | Sí | Reduce el grupo de personas posibles al combinarse con otros datos. |
| fecha_alta | No, por sí sola normalmente | Sí | Sí | Puede ayudar a distinguir registros si se combina con otra información. |

PREGUNTAS.-

¿Qué campos identifican directamente a una persona?

Los campos nombre, correo, teléfono y RFC pueden identificar directamente a un cliente. El correo y el teléfono también permiten establecer contacto con él.

¿Qué campos no identifican por sí solos pero podrían contribuir a hacerlo?

La edad, la ciudad, el código postal y la fecha de alta pueden contribuir a identificar a una persona cuando se combinan con otros datos. El identificador interno también puede relacionarse con la identidad del cliente si se tiene acceso a la tabla correspondiente.

¿Qué combinación de campos podría incrementar el riesgo de reidentificación?

La combinación de edad, ciudad y código postal puede reducir el número de personas posibles y facilitar la identificación de un cliente. La fecha de alta también podría aportar información adicional.

¿Todos los datos que deben protegerse son necesariamente datos personales sensibles desde el punto de vista jurídico?

No. Algunos datos son personales, pero no necesariamente pertenecen a la categoría jurídica de datos personales sensibles. Aun así, deben protegerse para evitar accesos no autorizados, divulgaciones o usos indebidos.


ACTIVIDAD 2.- ENMASCARAMIENTO DE DATOS

¿Qué información continúa existiendo en la tabla original?
La tabla clientes conserva todos los datos originales, incluyendo nombres, correos, teléfonos y RFC completos.
1. ¿Qué información puede visualizar el usuario soporte?
Puede ver los datos permitidos mediante la vista, donde la información sensible aparece parcialmente oculta.
2. ¿Por qué no es suficiente ocultar los datos únicamente en la aplicación?
Porque el usuario podría acceder directamente a la base de datos. Por eso, también se deben configurar permisos en PostgreSQL.
3. ¿Qué ocurriría si soporte tuviera acceso directo a clientes?
Podría ver los datos completos de los clientes, poniendo en riesgo su privacidad.

ACTIVIDAD 4.- SEPARACION DE FUNCIONES

1. ¿Qué ocurriría si analista pudiera consultar también pii.mapa_cliente?
Podría relacionar los tokens con los datos reales de los clientes y conocer sus identidades.
2. ¿Qué principio de seguridad se está aplicando al separar ambos accesos?
El principio de mínimo privilegio, donde cada usuario solo tiene acceso a la información que necesita.
3. ¿Por qué la seudonimización no equivale a anonimización?
Porque los datos se pueden relacionar nuevamente con una persona mediante información adicional.
4. ¿Qué información permite volver a relacionar el token con una persona?
La tabla pii.mapa_cliente, que relaciona cada token con la identidad real del cliente.

ACTIVIDAD 5.- ANONIMIZACION

1. ¿Qué identificadores directos fueron eliminados?
El nombre, correo electrónico, teléfono y RFC de los clientes.
2. ¿Qué cuasi-identificadores permanecen?
Datos como la edad, el sexo, la ubicación o el código postal, si están presentes en el conjunto de datos.
3. ¿Qué combinaciones de atributos podrían reducir el anonimato?
La combinación de edad, ubicación y sexo, porque podría ayudar a identificar a una persona.
4. ¿Qué sucede cuando un grupo contiene pocos registros?
Es más fácil identificar a las personas porque hay menos individuos con características similares.
5. ¿Qué atributos deberían generalizarse?
La edad y la ubicación, por ejemplo, usando rangos de edad y regiones más amplias.
6. ¿Qué información debería suprimirse?
Los datos que permitan identificar directamente a una persona o que la hagan fácilmente identificable al combinarse con otros datos.
7. ¿Es correcto afirmar que el conjunto de datos es “100 % anónimo”? ¿Por qué?
No, porque todavía podrían existir combinaciones de datos que permitan identificar a una persona.