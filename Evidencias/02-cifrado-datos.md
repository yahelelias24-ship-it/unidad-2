Evidencia 02: Cifrado de datos sensibles

Objetivo

Proteger un dato sensible, en este caso un RFC, mediante cifrado simetrico en PostgreSQL.

Comando o procedimiento

Se creo la tabla clientes_protegidos con un campo rfc_cifrado de tipo BYTEA. Se utilizó pgp_sym_encrypt() para cifrar el RFC y pgp_sym_decrypt() para recuperar su valor original.

Resultado obtenido

El RFC no se muestra directamente al consultar la tabla. Al utilizar la función de descifrado con la clave correcta, se recupera el dato original: LOPA900101ABC.

Analisis

A diferencia del hash utilizado para las contraseñas, el cifrado permite recuperar la informacion original cuando se dispone de la clave correcta. Si la clave se expone, una persona no autorizada podria descifrar los datos.

Conclusion

El cifrado simétrico permite proteger información sensible almacenada en una base de datos. Sin embargo, es necesario administrar las claves de forma segura y limitar el acceso a los datos protegidos.