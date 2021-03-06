-- Ejemplo 1

CREATE DATABASE IF NOT EXISTS BEDUTest;
DROP DATABASE IF EXISTS BEDUTest;

USE BEDUTest;

-- Ejemplo 2

CREATE TABLE IF NOT EXISTS users (
	id INT PRIMARY KEY,
    genero VARCHAR(1),
    edad INT,
    ocup INT,
    cp VARCHAR(20)
);

DROP TABLE IF EXISTS users;
DESCRIBE users;

-- Ejemplo 3
SELECT *
FROM users
LIMIT 10;