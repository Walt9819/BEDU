# Retos

################################################################################
#### Reto 1 ####
################################################################################

set.seed(134)
x <- round(rnorm(1000, 175, 6), 1)

#Calcule, la media, mediana y moda de los valores en x
mean(x)
median(x)
Mode(x)

#Obtenga los deciles de los números en x
quantile(x, seq(0.1, 0.9, by=0.1))

#Encuentre la rango intercuartílico, la desviación estándar y varianza muestral de las mediciones en x
IQR(x)
sd(x)
var(x)


################################################################################
#### Reto 2 ####
################################################################################

#Considere el data frame mtcars de R y utilice las funciones
str(mtcars)
summary(mtcars)
head(mtcars)
View(mtcars)



################################################################################
#### Reto 3 ####
################################################################################

setwd("D:/Documentos/BEDU/mod2/sesion02/")

#Descargue los archivos csv que corresponden a las temporadas 2017/2018, 2018/2019, 2019/2020 y 2020/2021 de la Bundesliga 1 y que se encuentran en el siguiente enlace https://www.football-data.co.uk/germanym.php

u1011 <- "https://www.football-data.co.uk/mmz4281/1718/D1.csv"
u1112 <- "https://www.football-data.co.uk/mmz4281/1819/D1.csv"
u1213 <- "https://www.football-data.co.uk/mmz4281/1920/D1.csv"
u1314 <- "https://www.football-data.co.uk/mmz4281/2021/D1.csv"

download.file(url = u1011, destfile = "data/bundesliga/SP1-1011.csv", mode = "wb")
download.file(url = u1112, destfile = "data/bundesliga/SP1-1112.csv", mode = "wb")
download.file(url = u1213, destfile = "data/bundesliga/SP1-1213.csv", mode = "wb")
download.file(url = u1314, destfile = "data/bundesliga/SP1-1314.csv", mode = "wb")

#Importe los archivos descargados a R

setwd("data/bundesliga")

# Just if only CSV files exists on dir
allData <- lapply(dir(), read.csv) # read all files

#Usando la función select del paquete dplyr, seleccione únicamente las columnas:

library(dplyr)

#Date
#HomeTeam
#AwayTeam
#FTHG
#FTAG
#FTR

selectedData <- lapply(allData, select, c(Date, HomeTeam, AwayTeam, FTHG, FTAG, FTR))

#Combine cada uno de los data frames en un único data frame con ayuda de las funciones:
#  rbind
#do.call

data <- do.call(rbind, selectedData)
dim(data) # dimensions
is.data.frame(data) # check if is data.frame
