# Reto 1

Mongo shell
```
use sample_airbnb
```

### Propiedades que no permitan fiestas.
Mongo shell
```
db.listingsAndReviews.find({house_rules: /Not? part(ies|y)/i})
```
![R1_Q1.png](R1_Q1.png)

### Propiedades que admitan mascotas.
Mongo shell
```
db.listingsAndReviews.find({house_rules: /pets? allowed/i})
```
![R1_Q2.png](R1_Q2.png)

### Propiedades que no permitan fumadores.
Mongo shell
```
db.listingsAndReviews.find({house_rules: /not? smok(ing|e)/i})
```
![R1_Q3.png](R1_Q3.png)

### Propiedades que no permitan fiestas ni fumadores.
Mongo shell
```
db.listingsAndReviews.find({house_rules: /not? smok(ing|e).*not? part(ies|y)/i})
```
![R1_Q4.png](R1_Q4.png)
