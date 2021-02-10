# Retos

################################################################################
#### RETO 1 #####
################################################################################
library(DBI)
library(RMySQL)

#Ahora en RStudio crea un script llamado queries.Ren donde se conecte a la BDD shinydemo

MyDataBase <- dbConnect(
  drv = RMySQL::MySQL(),
  dbname = "shinydemo",
  host = "shiny-demo.csa7qlmguqrf.us-east-1.rds.amazonaws.com",
  username = "guest",
  password = "guest")

# Si no se arrojaron errores por parte de R, vamos a explorar la BDD

dbListTables(MyDataBase)

# Ahora si se quieren desplegar los campos o variables que contiene la tabla 
# City se hará lo siguiente

dbListFields(MyDataBase, 'Country')
dbListFields(MyDataBase, 'CountryLanguage')

# Para realizar una consulta tipo MySQL sobre la tabla seleccionada haremos lo 
# siguiente

CountryData <- dbGetQuery(MyDataBase, "select * from Country")
LanguageData <- dbGetQuery(MyDataBase, "select * from CountryLanguage") %>% mutate(Code = CountryCode)

str(CountryData)
str(LanguageData)

allData <- merge(CountryData, LanguageData, by="Code")

# Una vez hecha la conexión a la BDD, generar una busqueda con dplyr que devuelva 
# el porcentaje de personas que hablan español en todos los países
spanishData <- allData %>% filter(Language == "Spanish") %>% select(Name, Percentage, IsOfficial)

# Realizar una gráfica con ggplot que represente este porcentaje de tal modo que
# en el eje de las Y aparezca el país y en X el porcentaje, y que diferencíe 
# entre aquellos que es su lengua oficial y los que no con diferente color 
# (puedes utilizar la geom_bin2d() y coord_flip())
library(ggplot2)

spanishData %>% ggplot(aes( x = Name, y = Percentage, fill = IsOfficial )) + 
  geom_bin2d() +
  coord_flip()

################################################################################
#### RETO 2 #####
################################################################################
library(rvest)

theURL <- "https://www.glassdoor.com.mx/Sueldos/data-scientist-sueldo-SRCH_KO0,14.htm"
#Extraer la tabla del HTML
file <- read_html(theURL)
tables <- html_nodes(file, "table")
table <- html_table(tables[1], fill = TRUE) %>% as.data.frame()

table$Sueldo

# Quitar los caracteres no necesarios de la columna sueldos (todo lo que no sea número), 
# para dejar solamente la cantidad mensual (Hint: la función gsub podría ser de utilidad)

# Asignar ésta columna como tipo numérico para poder realizar operaciones con ella

table$Sueldo <- gsub('[^0-9]' , '', table$Sueldo) %>% as.numeric()

# Ahora podrás responder esta pregunta ¿Cuál es la empresa que más paga y la que menos paga?
index <- order(-table$Sueldo)
paste("Empresa que más paga:", (table$Cargo)[index[1]], "con sueldo:", (table$Sueldo)[index[1]])
paste("Empresa que menos paga:", (table$Cargo)[index[length(index)]], "con sueldo:", (table$Sueldo)[index[length(index)]])

################################################################################
#### RETO 3 #####
################################################################################

# Just do a pull and push