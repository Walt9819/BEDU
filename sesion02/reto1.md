# Reto 1

### ¿Qué artículos incluyen la palabra Pasta en su nombre?

```
SELECT nombre
FROM articulo
WHERE nombre LIKE '%Pasta%';
```

![R1_Q1.png](R1_Q1.png)


### ¿Qué artículos incluyen la palabra Cannelloni en su nombre?

```
SELECT nombre
FROM articulo
WHERE nombre LIKE '%Cannelloni%';
```

![R1_Q2.png](R1_Q2.png)

### ¿Qué nombres están separados por un guión (-) por ejemplo Puree - Kiwi?

```
SELECT nombre
FROM articulo
WHERE nombre LIKE '%-%';
```

![R1_Q3.png](R1_Q3.png)
