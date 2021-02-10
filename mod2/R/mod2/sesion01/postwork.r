# Postwork

#### LOAD DATA ####
# Set where my files are located
setwd("D:/Documentos/BEDU/BEDU/mod2/sesion01")

# Load data from source
data <- read.csv("data/SP1.csv")


#### HOME GOALS PROBABILITY ####
# Home goals absolute frequency table
hg.freqT <- table(data$FTHG)

# Divide by the sum for relative frequency
hg.relFreqT <- hg.freqT / sum(hg.freqT)
sum(hg.relFreqT) # well probability distribution

# Get number of items on HG goals 
len.HGgoals = length(hg.relFreqT)

for (i in 1:len.HGgoals) {
  print(paste("La probabilidad (marginal) de que el equipo local anote", dimnames(hg.relFreqT)[[1]][i], "goles es:", hg.relFreqT[i]))
}


#### AWAY GOALS PROBABILITY ####
# Away goals absolute frequency table
ag.freqT <- table(data$FTAG)

# Divide by the sum for relative frequency
ag.relFreqT <- ag.freqT / sum(ag.freqT)
sum(ag.relFreqT) # well probability distribution

# Get number of items on AG goals 
len.AGgoals = length(ag.relFreqT)

for (i in 1:len.AGgoals) {
  print(paste("La probabilidad (marginal) de que el equipo visitante anote", dimnames(ag.relFreqT)[[1]][i], "goles es:", ag.relFreqT[i]))
}


#### CUMULATIVE PROBABILITY OF INDEPENDENT EVENTS ####
# If so, save results into a matrix (empty)
goals.cumProb <- matrix(, nrow = len.HGgoals, ncol = len.AGgoals)
for (i in 1:len.HGgoals) {
  cum.Prob <- hg.relFreqT[i] * ag.relFreqT
  goals.cumProb[i, ] <- cum.Prob
  for (j in 1:len.AGgoals) {
    print(paste("La probabilidad (conjunta) de que el equipo local anote", 
                dimnames(hg.relFreqT)[[1]][i], 
                "goles y que el equipo visitante anote",
                dimnames(hg.relFreqT)[[1]][j],
                "goles es:",
                cum.Prob[j]))
  }
}

# Result matrix (HG goals as rows, AG goals as columns) and values as cumulative probabilities
goals.cumProb
sum(goals.cumProb) # well probability distribution