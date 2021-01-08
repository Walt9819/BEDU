USE classicmodels;

-- Ejercicio 1
SELECT employeeNumber, lastName, firstName
FROM employees WHERE firstName LIKE 'A%';

-- Ejercicio 2
SELECT employeeNumber, lastName, firstName
FROM employees WHERE firstName LIKE '%on';

-- Ejercicio 3
SELECT employeeNumber, lastName, firstName
FROM employees WHERE firstName LIKE '%on%';

-- Ejercicio 4
SELECT employeeNumber, lastName, firstName
FROM employees WHERE firstName LIKE 'G_____';

-- Ejercicio 5
SELECT employeeNumber, lastName, firstName
FROM employees WHERE firstName NOT LIKE 'B%';

-- Ejercicio 6
SELECT productCode, productName
FROM products WHERE productCode LIKE "%_20%";

-- Ejercicio 7
SELECT orderNumber, SUM(priceEach)
FROM orderdetails
GROUP BY orderNumber;

-- Ejercicio 8
SELECT year(orderDate) AS the_year, count(*)
FROM orders
GROUP BY the_year;

-- Ejercicio 9
SELECT lastName, firstName 
FROM employees
WHERE officeCode IN
	(SELECT officeCode FROM offices WHERE country = 'USA');

-- Ejercicio 10
SELECT customerNumber, checkNumber, amount
FROM payments
ORDER BY amount DESC
LIMIT 1;

-- Ejercicio 11
SELECT customerNumber, checkNumber, amount
FROM payments 
WHERE amount > (SELECT AVG(amount) FROM payments);

-- Ejercicio 12
SELECT customerName
FROM customers
WHERE customerNumber NOT IN (SELECT customerNumber FROM orders);

-- Ejercicio 13
SELECT orderNumber, MIN(quantityOrdered), MAX(quantityOrdered), AVG(quantityOrdered) 
FROM orderdetails
GROUP BY orderNumber;

-- Ejercicio 14
SELECT status, COUNT(orderNumber)
FROM orders
GROUP BY status;
