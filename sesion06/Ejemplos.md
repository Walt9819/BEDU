# Ejemplos

Mongo Shell
```
use sample_airbnb
```

### Comencemos con un filtro sencillo. Dentro de la colección sample_airbnb.listingsAndReviews vamos a buscar aquellas propiedades que estén cerca de una estación del metro. Para ello, buscaremos la palabra Metro. Para ello, escribimos la siguiente consulta, recuerda que las expresiones se delimitan por diagonales.
```
db.listingsAndReviews.find({house_rules: /Metro/})
```

### La consulta anterior parece funcionar, pero qué ocurre si el dueño puso en la descripción metro con minúsculas, todos esos documentos están siendo omitidos. Le pediremos a MongoDB que haga la búsqueda ignorando las mayúsculas y minúsculas agregando el modificador i.

```
db.listingsAndReviews.find({house_rules: /Metro/i})
```

### También podemos buscar patrones por secciones de la misma forma que lo hacíamos con los símbolos de % y _ en SQL. Por ejemplo, dentro de la colección sample_mflix.users podemos obtener todos los correos electrónicos que inician con m. Para esto, necesitamos detectar el inicio de una cadena, para ello, se usa el símbolo ^.

```
db.listingsAndReviews.find({email: /^m/})
```

### De la misma manera, podemos buscar los correos que tengan dominio @cats.com, para ello, debemos buscar correos que tengan al final el texto mencionado. Para ello usamos el símbolo $ que marca el fin de una cadena.

```
db.listingsAndReviews.find({email: /@cats.com$/})
```

### Por último, buscaremos documentos cuyo correo incluya una a en cualquier parte del mismo. Para ello usaremos la expresión .* que se sustituye por cualquier cadena.

```
db.listingsAndReviews.find({email: /.*a.*/})
```
