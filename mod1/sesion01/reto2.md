# Reto 2

### ¿Cuál es el nombre de los empleados con el puesto 4?
#### Query
```
SELECT nombre
FROM empleado
WHERE id_puesto = 4;
```

#### Result
![R2_Q1](R2_Q1.png)


### ¿Qué puestos tienen un salario mayor a $10,000?
#### Query
```
SELECT *
FROM puesto
WHERE salario > 10000;
```

#### Result
![R2_Q2](R2_Q2.png)

### ¿Qué articulos tienen un precio mayor a $1,000 y un iva mayor a 100?
#### Query
```
SELECT *
FROM articulo
WHERE precio > 1000
  AND iva > 100;
```

#### Result
![R2_Q3](R2_Q3.png)

### ¿Qué ventas incluyen los artículo 135 o 963 y fueron hechas por los empleados 835 o 369?
#### Query
```
SELECT *
FROM venta
WHERE id_articulo IN (135, 963)
  AND id_empleado IN (835, 369);
```

#### Result
![R2_Q4](R2_Q4.png)
