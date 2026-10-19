Evidencia 07 — Comparación de mecanismos de protección

Objetivo

Identificar los mecanismos de seguridad más adecuados según el tipo de información que se necesita proteger.

Comparación de mecanismos

Las contraseñas de los usuarios deben protegerse mediante funciones de hash, ya que permiten verificar una contraseña sin guardar directamente su valor original. De esta manera, si alguien obtiene acceso a la base de datos, no podrá consultar las contraseñas en texto plano.

Los datos personales, como el RFC, pueden protegerse mediante cifrado cuando sea necesario recuperar su contenido original. Para acceder a la información cifrada se necesita una clave, por lo que es importante mantenerla protegida y evitar que personas no autorizadas puedan utilizarla.

La información que se transmite entre un cliente y un servidor puede protegerse mediante TLS. Este mecanismo ayuda a mantener la confidencialidad de los datos durante la comunicación y permite verificar la identidad del servidor cuando se configura correctamente.

Los respaldos de una base de datos también deben protegerse, ya que pueden contener información sensible. Para reducir los riesgos, se recomienda cifrar los archivos de respaldo y limitar el acceso únicamente al personal autorizado.

Finalmente, las claves criptográficas deben administrarse de forma segura. No deben guardarse directamente en el código fuente ni compartirse en repositorios públicos. También es importante controlar quién puede utilizarlas y cambiarlas cuando exista algún riesgo de exposición.

Conclusión

Cada mecanismo cumple una función diferente. El hash se utiliza para proteger contraseñas, el cifrado permite proteger datos que necesitan recuperarse posteriormente y TLS protege la información durante su transmisión. Además, la seguridad de estos mecanismos depende de una gestión adecuada de las claves y del control de acceso.