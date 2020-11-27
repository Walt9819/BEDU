USE tienda;

-- Reto 1
SELECT nombre 
FROM articulo
WHERE nombre LIKE '%Pasta%';

SELECT nombre 
FROM articulo
WHERE nombre LIKE '%Cannelloni%';

SELECT nombre
FROM articulo
WHERE nombre LIKE '%-%';

-- Reto 2
SELECT AVG(salario)
FROM puesto;
SELECT SUM(salario) / COUNT(salario)
FROM puesto;

SELECT COUNT(1)
FROM articulo
WHERE nombre LIKE '%Pasta%';

SELECT MAX(salario), MIN(salario)
FROM puesto;

SELECT SUM(salario)
FROM (SELECT salario FROM puesto ORDER BY id_puesto DESC LIMIT 5) AS subSalarios;

-- Reto 3
SELECT nombre, COUNT(*) AS registros
FROM puesto
GROUP BY nombre;

SELECT nombre, SUM(salario) AS paga_total
FROM puesto
GROUP BY nombre;

SELECT id_empleado, COUNT(id_venta) AS ventas
FROM venta
GROUP BY id_empleado;

SELECT id_articulo, COUNT(id_venta) AS ventas
FROM venta
GROUP BY id_articulo;


-- Reto 4
SELECT nombre
FROM empleado
WHERE id_puesto IN
	(SELECT id_puesto FROM puesto WHERE salario > 10000);

SELECT fecha,id_empleado, COUNT(id_venta) AS ventas
FROM venta
GROUP BY fecha, id_empleado;
-- Q2 Sol (ordenar por clave)
SELECT id_empleado, min(total_ventas), max(total_ventas)
FROM
 (SELECT clave, id_empleado, count(*) total_ventas
      FROM venta
      GROUP BY clave, id_empleado) AS sq
GROUP BY id_empleado;

SELECT nombre AS nombre_empleado, (SELECT nombre FROM puesto WHERE id_puesto = e.id_puesto) AS nombre_puesto
FROM empleado AS e;