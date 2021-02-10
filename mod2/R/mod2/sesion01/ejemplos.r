################################################################################
# EJEMPLO 1. Tipos de datos y vectores
################################################################################

# Objetivo
# Poder determinar el tipo de variables y objetos que se utilizan
# Creación y manipulación de objetos (vectores, matrices, data frames, entre otros)
# Operaciones básicas

# Requisitos
# Tener previamente instalados R y RStudio
# Haber leido y comprendido el Prework

# Desarrollo
# Se tiene una serie de códigos los cuales deberán irse corriento línea a línea, recordar que siempre se ejecuta una línea presionando Ctrl + Enter

# Primero vamos a crear algunas variables de diferentes tipos:

(var.hola <- "Hola Mundo")
(var.number <- 5L)
(var.double <- 2.7076)
(var.logical <- T)
(vector <- c(1,2))

# Ahora con la función class veremos la tipología de las variables

class(var.number)
class(var.hola)
class(var.double)
class(var.logical)

# Observa que diferencia hay entre class y typeof

class(var.logical)
typeof(var.logical)
class(var.number)
typeof(var.number)
class(var.hola)
typeof(var.hola)
class(var.double)
typeof(var.double)

# En este paso vamos a crear vectores, siempre serán de la forma c(elem1, elem2, ...)

a <- c(4, 6, 8, 10,12)
b <- c(3, 5, 7, 9)

# Para saber la longitud del vector

length(a)
length(b)

# Se puede acceder a las coordenadas de un vector haciendo uso de [] y su posición

a[1]
b[4]

# Para unir 2 vectores

d <- c(a,b)

# Organizarlos con la función sort, cambia la F por T y observa que ocurre

# No lo hace in-place, genera una copia
g <- sort(d, decreasing = F)

# Otra forma de generar el vector es de la siguiente manera, utilizando ":"

3:12  # así de sencillo es

# Intenta los siguientes y prueba con otras que se te vengan a la imaginación

10:1
1:1000
0:10

# También se pueden generar vectores que no sean sucesivos con la función seq, intenta cambiar el valor de los argumentos y observa el comportamiento de los vectores

(vector.by2 <- seq(from = 1, to = 10, by =2))

(vector.by3 <- seq(1, 10, 3))

# Para repetir un número o un vector un determinado número de ocasiones utilizamos rep

rep(5, times = 6)

# Observa que hace el siguiente comando con los vectores a y b

rep(a, 2)
rep(b, 3)

# Reciclaje, al hacer operaciones entre vectores, R repetirá los valores del vector, hasta alcanzar la dimensión requerida

c(1, 2) + c(7, 8, 9, 10)

# Existen varias operaciones entre vectores, intenta probar algunas de las siguientes:

a + b
a - b     
a*b
a/b
a^2
a1 <- a*0.5 + b^2
a1[1]


################################################################################
# Ejemplo 2. Matrices
################################################################################

# Objetivo

# Crear nuevas matrices
# Extraer datos dentro de una matriz
# Calcular sus dimensiones
# Realizar operaciones básicas entre matrices

# Requisitos

# Tener instalados R y RStudio
# Haber estudiado el Prework

# Desarrollo

# Se debe seguir el código propuesto y tratar de compreder que es lo que realiza

# Crear Matrices. 

(m <- matrix(1:9, nrow = 3, ncol = 3))

# Extrayendo la primera entrada

m[1,1]

# Extrayendo la primer columna, con todas sus filas

m[ ,1]
m[2, ]

# ¿Qué sucede si se suma un vector y una matriz?

(sum.vecmat <- c(1, 2) + m)

# Creando otra matriz

(n <- matrix(2:7, 4, 6))
(n.byRow <- matrix(2:7, 4, 6, byrow = T))

# Podemos conocer la dimensión de la matriz así

dim(n)

# Extrayendo subconjuntos de la matriz

n[n > 4] 

# Ahora veremos como localizar la posición de las entradas anteriores

which(n > 4)

# Uniendo Vectores para formar una matriz

a <- 2:6
b <- 5:9

# Construyendo la matriz utilizando la función cbind, para unirlos por culumna

cbind(a,b)

# Construyendo la matriz utilizando la función rbind, para unirlos por fila

rbind(a,b)

# Aplicando una función a las filas o columnas de una matriz (mean, sort)

apply(n, 1, mean) # by column
apply(n, 2, mean) # by row
apply(n, 2, sort)

# Algunas operaciones básicas de matrices

A = matrix(1:10, 5)
B = matrix(11:20, 5)

# Producto matricial
A %*% t(B)
# Producto elemento a elemento:
A*B
# Traspuesta:
t(A)
# Determinante:
A = matrix(1:9, 3)
det(A)
# Extraer la diagonal:
diag(A)
# Resolver un sistema de ecuaciones lineales 
A = matrix(runif(9), 3)
b = runif(3)
(( Ax=b )): solve(A,b)
# Inversa: 
solve(A)
# Autovalores y autovectores: 
eigen(A)


################################################################################
# Ejemplo 3. Listas y data frames
################################################################################

# Objetivo
# Crear listas y data frames
# Extraer información de estos
# Cálculo de estadísticos básicos

# Requisitos

# Prework
# R, RStudio
# Ejemplos 1 y 2

# Desarrollo

# Seguir el contenido y tratar de comprender el código mostrado a continuación

# Listas

(milista <- list(nombre = "Pepe", no.hijos = 3, edades.hijos = c(4, 7, 9)))

# propiedades de la lista

str(milista)

# Extrayendo elementos de la lista, recuerda que para ingresar se debe usar el símbolo $

milista$nombre

# Creando data frames

x <- 6:8
y <- c("A", "B", "C")
(mifile <- data.frame(edad = x, grupo = y))

str(mifile)

# Extrayendo información del df, se hace igual que con las matrices

mifile[1]
mifile[,1]
mifile$edad

# Calculando algunos estadísticos básicos

mean(mifile$edad)

# Podemos hacer uso de la función `paste` para agregar un mensaje

paste("La media de la edad es:", mean(mifile$edad))

# Podemos inspeccionar a detalle el df utilizando `summary`

summary(mifile)

# También se puede conocer su dimensión

dim(mifile)

# Podemos agregar una columna extra con datos

mifile$sexo <- c("H", "M", "H")
mifile

# Si fuera el caso, se puede eliminar una columna

mifile$sexo <- NULL
mifile


################################################################################
# EJEMPLO 4. Descarga y lectura de data sets.
################################################################################

# Objetivo
# Fijar y conocer ruta de trabajo
# Lectura de ficheros CSV, locales y en repositorio
# Manejo de objetos

# Requisitos
# R, RStudio
# Prework
# Desarrollo

# Ejecutar las líneas de comando y tratar de comprender que realiza cada parte de sus entradas

# Se pueden obtener diversos data sets de Kaggle, visita el sitio para que te familiarices
# La siguiente es una base de datos de los libros más vendidos en Amazon del 2009 - 2019

# Obtenemos la ruta del directorio de trabajo

getwd()

# Fijando el directorio de trabajo

setwd("D:/Documentos/BEDU/mod2/sesion01/") # Depende del usuario

# La función read.csv será util para leer fichero .csv

read.csv("data/bestsellers with categories.csv") # El archivo csv debe estar en el directorio de trabajo

# se puede asignar a un objeto el fichero leido anteriormente

amazon.books <- read.csv("data/bestsellers with categories.csv")
tail(amazon.books)
str(amazon.books)

# También se puede leer el fichero directamente desde una URL

data.url <- read.csv("https://www.football-data.co.uk/mmz4281/2021/SP1.csv")
tail(data.url); str(data.url)

# Calculamos la dimensión de la base de datos

dim(amazon.books)

# El tipo de objeto se puede saber utilizando class()

class(amazon.books)


################################################################################
# EJEMPLO 5. Instalar paquetes y cargarlos.
################################################################################

# Objetivo
# Instalar paquetes
# Cargar paquetes

# Requisitos
# R y RStudio
# Prework

# Desarrollo
# En este ejemplo se te guiará para poder realizar la instalación y carga de paquetes que son requeridos para realizar análisis, gráficas, o para extraer información con diversas funciones. Esto es útil ya que agrega funcionalidades a R, ya sea para graficar o generar análisis con diversas técnicas.

# Se instalan de la siguiente manera

install.packages("ggplot2") #siempre lleva  comillas

# Una vez que se instaló, se debe de cargar

library(ggplot2) # Se omite el uso de las comillas

# Otro ejemplo

install.packages("dplyr")
library(dplyr)

# Algo útil es revisar la versión que se tiene de R, ya que en ocasiones no se instalan ciertos paquetes por la incompatibilidad de R, el siguiente comando nos indicará la versión que estamos trabajando.

version

# También se puede realizar esta acción en la pestaña de Packages, intentalo.


################################################################################
# EJEMPLO 6. Loops y pseudocódigo: for, while, if, else, if-else
################################################################################

# Objetivo
# Conocer la inicialización de variables
# Ejecutar un loop, for, while, if y if-else

# Requisitos
# R, RStudio
# Prework

# Desarrollo
# Durante este ejemplo se darán las bases para inicializar una variable que sea utilizada dentro de un loop, adicionalmente se utilizaran los comandos while, if y if-else para poder utilizarlos adecuadamente

# Este ejemplo elevará al cuadrado las primeras 10 entradas de un vector generado aleatóriamente de 20 entradas

w <- rnorm(20)              
print("Este loop calcula el cuadrado de los 10 primeros elementos del vector w")

# inicializando la varialbe wsq

wsq <- 0

for(i in 1:10) {
  wsq[i] <- w[i]**2
  print(wsq[i])
}

# Los bucles WHILE comienzan comprobando una condición. Si esta es verdadera, entonces se entra al cuerpo del bucle. Una vez completada una ejecución de este bloque, se comprueba la condición nuevamente y así sucesivamente hasta que la comprobación de la condición de falso.

# while(<condicion>) {
#                     código
#                     ...
#             }

# Ejemplo:

count <- 0
while(count < 10) {
  print(count)
  count <- count + 1
}

# Pseudocódigo para IF - ELSE

# if(<condicion>) {
## bloque de código
# }

## Continua con el resto del código

# if(<condicion>){
## bloque de código
#               } else {
## otro bloque de código
#                      }

# if(<condition1>) {
## bloque de código
#                 } else if(<condicion2>) {
## otro bloque de código
#                                        } else {
## otro bloque de código
#                                               }

# Ejemplo

x <- runif(1, 0, 10) ## creamos un número aleatorio entre 0 y 10
if(x > 5) {
  y <- TRUE
} else {
  y <- FALSE
}
x; y

# De este modo estamos asignando un valor a una variable en función del valor de otra. Lo que se debe tener en cuenta es que la condición debe retornar un valor TRUE o FALSE.
