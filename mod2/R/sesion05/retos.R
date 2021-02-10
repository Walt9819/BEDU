# Retos

################################################################################
#### RETO 1 #####
################################################################################

data <- read.csv("https://raw.githubusercontent.com/beduExpert/Programacion-con-R-Santander/master/Sesion-05/Reto-01/datoslineal.csv")

#Se cree que entre las variables x y y del archivo csv adjunto, podría haber una
#relación más o menos lineal. Para tener más evidencia sobre esto lleve a cabo lo siguiente:

model <- lm(data$y ~ data$x)
summary(model)

#Realice el gráfico de dispersión de los datos
plot(data$x, data$y, pch = 16)

#Ajuste un modelo de regresión lineal simple a los datos, muestre un resumen del
#modelo ajustado y trace la recta de regresión estimada junto con el gráfico de dispersión
plot(data$x, data$y, pch = 16)
abline(lsfit(data$x, data$y)) # Trazamos la recta de regresión estimada (mínimos cuadrados)


#Obtenga algunas gráficas de diagnóstico y diga si es razonable suponer para los
#errores aleatoriedad, normalidad y varianza constante.

anova(model)

par(mfrow = c(2, 2))
plot(model)
dev.off()