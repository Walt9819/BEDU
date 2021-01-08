USE tienda;

-- Joins
SHOW KEYS FROM venta;

DESCRIBE empleado;
DESCRIBE puesto;

SELECT *
FROM empleado AS e
JOIN puesto AS p
  ON e.id_puesto = p.id_puesto;


SELECT *
FROM puesto AS p
LEFT JOIN empleado e
ON p.id_puesto = e.id_puesto;

SELECT *
FROM empleado AS e
RIGHT JOIN puesto AS p
ON e.id_puesto = p.id_puesto;

-- Vistas
SELECT v.clave, v.fecha, a.nombre producto, a.precio, concat(e.nombre, ' ', e.apellido_paterno) empleado 
FROM venta v
JOIN empleado e
  ON v.id_empleado = e.id_empleado
JOIN articulo a
  ON v.id_articulo = a.id_articulo;
  
CREATE VIEW tickets_490 AS
(SELECT v.clave, v.fecha, a.nombre producto, a.precio, concat(e.nombre, ' ', e.apellido_paterno) empleado 
FROM venta v
JOIN empleado e
  ON v.id_empleado = e.id_empleado
JOIN articulo a
  ON v.id_articulo = a.id_articulo);
  
SELECT * FROM tickets_490;

SELECT clave, round(sum(precio),2) total
FROM tickets_490
GROUP BY clave;
