USE bedutest;

-- Reto 1
CREATE TABLE IF NOT EXISTS movies (
	id INT PRIMARY KEY,
    title VARCHAR(200),
    genres VARCHAR(200)
);

DESCRIBE movies;

CREATE TABLE IF NOT EXISTS ratings (
    id_user INT,
    id_movie INT,
    rating INT,
    time_stamp BIGINT,
    FOREIGN KEY (id_user) REFERENCES users(id),
    FOREIGN KEY (id_movie) REFERENCES movies(id)
);

DESCRIBE ratings;


-- Reto 2
SELECT *
FROM movies
LIMIT 10;

SELECT *
FROM ratings
LIMIT 10;

SELECT COUNT(*)
FROM ratings;