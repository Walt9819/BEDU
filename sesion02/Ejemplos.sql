USE tienda;

SELECT *
FROM empleado
WHERE nombre LIKE 'M%';

SELECT *
FROM empleado
WHERE nombre LIKE '%a';

SELECT *
FROM empleado
WHERE nombre LIKE 'M%a';

SELECT *
FROM empleado
WHERE nombre LIKE 'M_losa';

SELECT (1 + 7) * (10 / (6 - 4));

SELECT AVG(precio)
FROM articulo;

SELECT COUNT(*)
FROM articulo;

SELECT COUNT(precio)
FROM articulo;

SELECT COUNT(1)
FROM articulo;

SELECT MAX(precio)
FROM articulo;

SELECT MIN(precio)
FROM articulo;

SELECT SUM(precio)
FROM articulo;

SELECT SUM(precio) / COUNT(1)
FROM articulo;

SELECT nombre, SUM(precio) AS total
FROM articulo
GROUP BY nombre;

SELECT nombre, COUNT(*) AS cantidad
FROM articulo
GROUP BY nombre
ORDER BY cantidad DESC;

SELECT nombre, MIN(salario) AS menor, MAX(salario) AS mayor
FROM puesto
GROUP BY nombre;

SELECT *
FROM empleado
WHERE id_puesto IN 
	(SELECT id_puesto 
	FROM puesto
	WHERE nombre = 'Junior Executive');

SELECT id_articulo, MIN(cantidad), MAX(cantidad)
FROM
	(SELECT clave, id_articulo, COUNT(*) AS cantidad
	FROM venta
	GROUP BY clave, id_articulo
	ORDER BY clave) AS subconsulta
GROUP BY id_articulo;

SELECT nombre, apellido_paterno, 
	(SELECT salario FROM puesto WHERE id_puesto = e.id_puesto) AS sueldo
FROM empleado AS e;
