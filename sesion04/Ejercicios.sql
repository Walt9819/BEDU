USE classicmodels;

SHOW KEYS FROM orders;
SHOW KEYS FROM orderdetails;

-- Ejercicio 1
SELECT o.orderNumber, SUM(od.quantityOrdered)
FROM orderdetails AS od
JOIN orders AS o
	ON o.orderNumber = od.orderNumber
GROUP BY o.orderNumber;

-- Ejercicio 2
SELECT o.orderNumber, o.status, SUM(od.priceEach) AS total_price
FROM orderdetails AS od
JOIN orders AS o
	ON o.orderNumber = od.orderNumber
GROUP BY o.orderNumber;

-- Ejercicio 3
SELECT o.orderNumber, o.orderDate, od.orderLineNumber, p.productName,od.quantityOrdered, od.priceEach
FROM orders AS o
JOIN orderdetails as od
	ON o.orderNumber = od.orderNumber
JOIN products AS p
	ON p.productCode = od.productCode;
    
-- Ejercicio 4
SELECT o.orderNumber, p.productName, p.MSRP, od.priceEach
FROM orders as o
JOIN orderdetails AS od
	ON o.orderNumber = od.orderNumber
JOIN products AS p
	ON od.productCode = p.productCode;
    
-- Ejercicio 5
SELECT c.customerNumber, c.customerName, o.orderNumber, o.status
FROM customers AS c
LEFT JOIN orders AS o
	ON o.customerNumber = c.customerNumber;
/* ¿De qué nos sirve hacer LEFT JOIN en lugar de JOIN?
	En que podríamos identificar si algún cliente no ha realizado pedidos todavía ya que estaría con valore NULL para su fila en la info de pedidos.
*/

-- Ejercicio 6
SELECT c.customerNumber, c.customerName, o.orderNumber, o.status
FROM customers AS c
LEFT JOIN orders AS o
	ON o.customerNumber = c.customerNumber
WHERE orderNumber IS NULL;

-- Ejercicio 7
SHOW KEYS FROM customers;

SELECT concat(e.lastName, ' ', e.firstName) AS employee, c.customerName, p.checkNumber,  p.amount
FROM employees AS e
LEFT JOIN customers AS c
	ON e.employeeNumber = c.salesRepEmployeeNumber
LEFT JOIN payments AS p
	ON p.customerNumber = c.customerNumber;


-- Ejercicio 8
SELECT c.customerNumber, c.customerName, o.orderNumber, o.status
FROM customers AS c
RIGHT JOIN orders AS o
	ON o.customerNumber = c.customerNumber;

SELECT c.customerNumber, c.customerName, o.orderNumber, o.status
FROM customers AS c
RIGHT JOIN orders AS o
	ON o.customerNumber = c.customerNumber
WHERE orderNumber IS NULL;

SELECT concat(e.lastName, ' ', e.firstName) AS employee, c.customerName, p.checkNumber,  p.amount
FROM employees AS e
RIGHT JOIN customers AS c
	ON e.employeeNumber = c.salesRepEmployeeNumber
RIGHT JOIN payments AS p
	ON p.customerNumber = c.customerNumber;
    
/* Repite los ejercicios 5 a 7 usando RIGHT JOIN. ¿Representan lo mismo? Explica las diferencias en un comentario.
	No, ya que no contienen los mismos datos. En el caso del LEFT JOIN tenemos todos los registrod de la primera tabla sin importar
    si tienen un "match" con la de la derecha, y por tanto podemos tener clientes sin pedidos, mientras que con el RIGHT JOIN no es posible
    obtener esa información. Así como tampoco podemos identificar los empleados que no han realizado ventas, aunque sí podríamos encontrar
    clientes sin empleados u órdenes sin clientes, pero esta búsquedas no causan mucho sentido.
*/

-- Ejercicio 9
CREATE VIEW employees_customers_490 AS (
SELECT concat(e.lastName, ' ', e.firstName) AS employee, c.customerName, p.checkNumber,  p.amount
FROM employees AS e
LEFT JOIN customers AS c
	ON e.employeeNumber = c.salesRepEmployeeNumber
LEFT JOIN payments AS p
	ON p.customerNumber = c.customerNumber);
    
SELECT employee, (SUM(amount) / COUNT(customerName)) AS amount_per_customer
FROM employees_customers_490
GROUP BY employee
ORDER BY amount_per_customer DESC;


CREATE VIEW orders_status_490 AS (
SELECT o.orderNumber, o.status, SUM(od.priceEach) AS costo_total
FROM orderdetails AS od
JOIN orders AS o
	ON o.orderNumber = od.orderNumber
GROUP BY o.orderNumber);

SELECT * 
FROM orders_status_490
WHERE status <> 'Shipped' 
ORDER BY total_price DESC;


CREATE VIEW order_product_price_490 AS (
SELECT o.orderNumber, p.productName, p.MSRP, od.priceEach
FROM orders as o
JOIN orderdetails AS od
	ON o.orderNumber = od.orderNumber
JOIN products AS p
	ON od.productCode = p.productCode);
    
SELECT productName, (priceEach - MSRP) AS price_vs_MSRP
FROM order_product_price_490
ORDER BY price_vs_MSRP DESC;
