# Postwork

#Ahora graficaremos probabilidades (estimadas) marginales y conjuntas para el 
#número de goles que anotan en un partido el equipo de casa o el equipo visitante.

setwd("D:/Documentos/BEDU/BEDU/mod2/sesion03")

#Con el último data frame obtenido en el postwork de la sesión 2, elabora tablas 
#de frecuencias relativas para estimar las siguientes probabilidades:

################################################################################
#### FROM POSTWORK 2 ####
################################################################################
#### IMPORT DATA ####
# Get URLS
u1 <- "https://www.football-data.co.uk/mmz4281/1718/SP1.csv"
u2 <- "https://www.football-data.co.uk/mmz4281/1819/SP1.csv"
u3 <- "https://www.football-data.co.uk/mmz4281/1920/SP1.csv"
# Download files (/data/postwork) path must exist
download.file(url = u1, destfile = "data/postwork/SP1-1718.csv", mode = "wb")
download.file(url = u2, destfile = "data/postwork/SP1-2018.csv", mode = "wb")
download.file(url = u3, destfile = "data/postwork/SP1-1213.csv", mode = "wb")
# Set working directory to data path
setwd("data/postwork")
# Only if just CSV files exists on dir
allData <- lapply(dir(), read.csv) # read all files

#### SELECT DATA ####
library(dplyr)
# Load desired columns:
selectedData <- lapply(allData, select, c(Date, HomeTeam, AwayTeam, FTHG, FTAG, FTR))
modifiedData <- lapply(selectedData, mutate, 
                       Date = as.Date(Date, "%d/%m/%Y"),
                       HomeTeam = as.factor(HomeTeam),
                       AwayTeam = as.factor(AwayTeam),
                       FTHG = as.numeric(FTHG), 
                       FTAG = as.numeric(FTAG), 
                       FTR = as.factor(FTR)
)
# Merge all data into a simple df
data <- do.call(rbind, modifiedData)

write.csv(data, "allSP1.csv")

################################################################################
#### END POSTWORK 2 ####
################################################################################


################################################################################
#### FROM POSTWORK 1 ####
################################################################################
#### HOME GOALS PROBABILITY ####
# Home goals absolute frequency table
hg.freqT <- table(data$FTHG)
# Divide by the sum for relative frequency
hg.relFreqT <- hg.freqT / sum(hg.freqT)
sum(hg.relFreqT) # well probability distribution
# Get number of items on HG goals 
len.HGgoals = length(hg.relFreqT)

#### AWAY GOALS PROBABILITY ####
# Away goals absolute frequency table
ag.freqT <- table(data$FTAG)
# Divide by the sum for relative frequency
ag.relFreqT <- ag.freqT / sum(ag.freqT)
sum(ag.relFreqT) # well probability distribution
# Get number of items on AG goals 
len.AGgoals = length(ag.relFreqT)

#### CUMULATIVE PROBABILITY OF INDEPENDENT EVENTS ####
# If so, save results into a matrix (empty)
goals.cumProb <- matrix(, nrow = len.HGgoals, ncol = len.AGgoals)
for (i in 1:len.HGgoals) {
  cum.Prob <- hg.relFreqT[i] * ag.relFreqT
  goals.cumProb[i, ] <- cum.Prob
}

# Result matrix (HG goals as rows, AG goals as columns) and values as cumulative probabilities
goals.cumProb
sum(goals.cumProb) # well probability distribution

################################################################################
#### END POSTWORK 1 ####
################################################################################

#Realiza lo siguiente:
# Load library
library(ggplot2)

# Create function for barplot
goalsBarPlot <- function (freqTable, team) {
  # convert frequency table to df for easy acces
  goals.RelFreq.df <- as.data.frame(freqTable) %>% mutate(Goals=as.numeric(Var1)-1) %>% select(Goals, Freq)
  max.prob.goal <- goals.RelFreq.df[which.max(goals.RelFreq.df$Freq), ] # get row with max probability
  # plot as barplot goals vs probability
  return (ggplot() + 
    aes(x=goals.RelFreq.df$Goals, y=goals.RelFreq.df$Freq) + 
    geom_col() +
    labs(x = paste("Goles equipo", team), y = "Probabilidad (marginal)", title=paste("Probabilidad (marginal) número de goles equipo", team)) +
    annotate("text", x = mean(goals.RelFreq.df$Goals), y = max.prob.goal$Freq + 0.03, colour = "blue", size = 5, label = paste("La máxima probabilidad es", round(max.prob.goal$Freq, 3), "para", max.prob.goal$Goals, "goles"))
  )
}


#Un gráfico de barras para las probabilidades marginales estimadas del número de 
#goles que anota el equipo de casa
hg.barPlot.goals <- goalsBarPlot(hg.relFreqT, "de casa")
hg.barPlot.goals

#Un gráfico de barras para las probabilidades marginales estimadas del número de
#goles que anota el equipo visitante.
ag.barPlot.goals <- goalsBarPlot(hg.relFreqT, "visitante")
ag.barPlot.goals

#Un HeatMap para las probabilidades conjuntas estimadas de los números de goles 
#que anotan el equipo de casa y el equipo visitante en un partido.
cum.data <- expand.grid(HG=names(hg.relFreqT), AG=names(ag.relFreqT))
cum.data$Z <- c(goals.cumProb)

# Some cool libraries
library(hrbrthemes) # themes

ggplot(cum.data, aes(x = HG, y = AG, fill=Z)) + 
  geom_tile() +
  labs(x = "Goles equipo de casa", y = "Goles equipo visitante", fill="Probabilidad conjunta", title="Probabilidades (conjuntas) goles equipo de casa y visitante")


#### Not working on my machine :(
library(plotly) # interactive plots

cum.data <- cum.data %>%
  mutate(text = paste0("Goles casa: ", x, "\n", "Goles visitante: ", y, "\n", "Probabilidad: ",round(Z,3)))

goals.plot <- ggplot(cum.data, aes(x = HG, y = AG, fill=Z, text=text)) + 
  geom_tile() +
  labs(x = "Goles equipo de casa", y = "Goles equipo visitante", fill="Probabilidad conjunta", title="Probabilidades (conjuntas) goles equipo de casa y visitante")

ggplotly(goals.plot, tooltip="text")
