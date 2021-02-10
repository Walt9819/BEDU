# Retos

################################################################################
#### RETO 1 ####
################################################################################

#Este ejemplo aunque es básico, servirá para realizar una comparación entre las 
#funciones hist() y ggplot, los dos útiles, comparalos y decide cual es de tu 
#agrado de acuerdo a los requerimientos.

#Carga el data set BD_Altura_Alunos.csv (Hint: Si tienes algún inconveniente con
#los datos, lee sobre el argumento sep de la función read.csv)

# read and transform data (sep with `;`)
data <- read.csv("data/BD_Altura_Alunos.csv", sep=";") %>% mutate(Altura = as.numeric(Altura))
str(data) # show data structure


#Realiza el histograma con la función hist(), nativa de R
hist(data$Altura, breaks = 5,
  xlab = "Altura",
  ylab = "Frecuencia"
)


#Ahora realiza el histograma con la función ggplot. (Recuerda que debes instalar el paquete ggplot2)
data %>% ggplot() + 
  aes(Altura) + 
  geom_histogram(binwidth = 5) + 
  xlab("Altura") + 
  ylab("Frecuencia")


################################################################################
#### RETO 2 ####
################################################################################
# Load data
data <- read.csv("data/players_stats.csv")
str(data)
summary(data)

#Generar un histograma de los minuntos totales (MIN), de los jugadores y agregar 
#una línea donde se muestre la media (Hint: para agregar la línea que muestre la 
#media consulta la documentación sobre geom_vline y el argumento xintercept)

data %>% 
  ggplot() + 
  aes(MIN) + 
  geom_histogram(binwidth = 10) +
  geom_vline(xintercept = mean(data$MIN), color="red")
  

#Generar un histograma de edad (Age) y agregar una línea con la media
summary(data$Age)

data %>% na.omit() %>% 
  ggplot() + 
  aes(Age) + 
  geom_histogram(binwidth = 1) +
  geom_vline(xintercept = mean(data$Age %>% na.omit()), color="red")


#Hacer un scatterplot de las variables Weight y Height y observar la correlacón 
#que existe entre ambas variables (1 sola gráfica)

data$Weight

data %>%
  ggplot() +
  aes(x = Height, y = Weight) +
  geom_point() + 
  geom_smooth(method = "lm", se = T)


#Utiliza la función which.max para saber quién es el jugador más alto, una vez 
#hecho esto, presenta los resultados en una leyenda que diga "El jugador más alto 
#es: Name, con una altura de: Height". Las unidades de altura deben ser en metros.
maxPlayer = data[which.max(data$Height), ]
print(paste("El jugador más alto es:", maxPlayer$Name, "con una altura de:", maxPlayer$Height))


#Utiliza la función which.min para saber quién es el jugador más bajito, una vez 
#hecho esto, presenta los resultados en una leyenda que diga "El jugador más 
#bajito es: Name, con una altura de: Height". Las unidades de altura deben ser en metros.
minPlayer = data[which.min(data$Height), ]
print(paste("El jugador más bajito es:", minPlayer$Name, "con una altura de:", minPlayer$Height))

#¿Cuál es la altura promedio?, representa el resultado en una frase que diga: 
#"La altura promedio es: ALTURA"
print(paste("La altura promedio es: ", mean(na.omit(data$Height))))

#Generar un scatterplot donde se representen las Asistencias totales (AST.TOV) 
#vs Puntos (PTS), además has un face wrap con la posición (Pos).
data %>% 
  ggplot() +
  aes(x = AST.TOV, y = PTS) +
  geom_point() +
  facet_wrap("Pos") +
  labs(x = "Asistencias totales", y = "Puntos")
