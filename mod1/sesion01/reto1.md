# Reto 1

### `DESCRIBE articulo`

|Field|Type|Null|Key|Default|
|-|-|-|-|-|
|id_venta|int|NO|PRI|NULL|
|nombre|varchar(45)|NO|NULL|
|precio|double|NO|NULL|
|iva|double|NO|NULL|
|cantidad|int|NO|0|

### `DESCRIBE puesto`

|Field|Type|Null|Key|Default|
|-|-|-|-|-|
|id_puesto|int|NO|PRI|NULL|
|nombre|varchar(45)|NO|NULL|
|salario|double|NO|NULL|

### `DESCRIBE venta`

|Field|Type|Null|Key|Default|
|-|-|-|-|-|
|id_puesto|int|NO|PRI|NULL|
|id_venta|int|NO|PRI|NULL|
|id_articulo|int|NO|MUL|NULL|
|id_empleado|int|NO|MUL|NULL|
|clave|varchar(45)|NO|NULL|
|fecha|timestamp|NO|CURRENT_TIMESTAMP|

### Tipos de variables

|Tipo|Descripción|
|-|-|
|int|Variable del tipo `int` (entero) que solo puede almacenar números sin punto decimal (flotante)|
|varchar(45)|Guardar cadenas de caracteres de hasta una longitud de 45 caracteres|
|double|Variable que puede guardar número de punto flotante/fraccionales/con punto decimal|
|timestamp|Variable que almacena fechas y horas con precisión de hasta segundos y que incluso puede guardar zonas horarias|
