# Formas Normales basadas En claves Principales

El proceso de normalización de bases de datos consiste en aplicar una serie de reglas a las relaciones obtenidas tras el paso del modelo entidad-relación al modelo relacional.

| Forma Normal | Prueba | Remedio (Normalizacion) |
| ------ | ------ | ----- |
| Primera (1FN) | La relación no debe tener atributos multivalor o relaciones anidadas | Generar nuevas relaciones para cada atributo multivalor o relación anidada |
| Segunda (2FN) | Para relaciones en las que la clave principal contiene varios atributos, un atributo no clave debe ser funcionalmente dependiente en una parte de la clave principal. | Descomponer y configurar una nueva relación por cada clave parcial con su(s) atributo(s) dependiente(s). Asegurarse de mantener una relación con la clave principal original y cualquier atributo que sea completa y funcionalmente dependiente de ella |
| Tercera (3FN) | La relación no debe tener un atributo no clave que este funcionalmente determinado por otro atributo no clave (o por un conjunto de atributos no clave) Esto es, debe ser una dependencia transitiva de un atributo no clave de la clave principal. | Descomponer y configurar una relación que incluya el(los) atributo(s) no clave que determine(n) funcionalmente otro(s) atributo(s) no clave. |


### Requerimientos

* Motor de base de datos de Microsoft SQL Server version Express