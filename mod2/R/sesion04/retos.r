# Retos

################################################################################
#### RETO 1 ####
################################################################################

##Distribución binomial
#Consideremos un experimento binomial con n = 35 pruebas idénticas e independientes, 
#en donde la probabilidad de éxito en cada prueba es p = 0.51. Encuentre lo siguiente:

n = 35; p = 0.51;

#La probabilidad de observar exactamente 10 éxitos
dbinom(x = 10, size = n, prob = p)

#La probabilidad de observar 10 o más exitos
pbinom(q = 10, size = n, prob = p, lower.tail = F)

#El cuantil de orden 0.5
qbinom(p = 0.5, size = n, prob = p)

#Genere una muestra aleatoria de tamaño 1000 de esta distribución, construya una
#tabla de frecuencias relativas con los resultados y realice el gráfico de barras 
#de los resultados que muestre las frecuencias relativas.
set.seed(1234)
data.binom <- rbinom(1000, size = n, prob = p)
relFreq.binom <- as.data.frame(table(data.binom)/length(data.binom))
relFreq.binom$data.binom <- as.numeric(relFreq.binom$data.binom)

ggplot(relFreq.binom, aes(x = data.binom, y = Freq)) + 
  geom_bar (stat="identity", position = "dodge") +
  labs(x = "Muestra", y = "Probabilidad")


##Distribución normal
#Considere una variable aleatoria normal con media 110 y desviación estándar 7. Realice lo siguiente:
mean = 110; sd = 7;

#Grafique la función de densidad de probabilidad
x <- seq(mean-4*sd, mean+4*sd, 0.1)
y <- dnorm(x, mean = mean, sd = sd)

plot(x, y, type = "l", xlab = "", ylab = "")
title(main = "Densidad de Probabilidad Normal", sub = expression(paste("mu=", 110, " y ", "sigma=", 7)))
abline(v = mean, lwd = 2, lty = 2)

#Encuentre la probabilidad de que la v.a. sea mayor o igual a 140
pnorm(q = 140, mean = mean, sd = sd, lower.tail = F)

#Encuentre el cuantil de orden 0.95
qnorm(p=0.95, mean = mean, sd = sd)

#Genere una muestra aleatoria de tamaño 1000 y realice el histograma de frecuencias relativas para esta muestra
data.norm <- rnorm(1000, mean = mean, sd = sd)

ggplot(mdf, aes(data.norm)) + 
  geom_histogram(colour = 'red', 
                 fill = 'blue',
                 alpha = 0.3,
                 binwidth = 3)