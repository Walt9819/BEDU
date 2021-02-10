# Postwork

# Set working directory
setwd("D:/Documentos/BEDU/BEDU/mod2/sesion02/")

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


#### Explore data ####

str(allData) # Display columns and few data from each df
head(allData) # Diaplsy first 6 rows from each df
summary(allData) # Not quite useful


#### SELECT DATA ####

# Load library

library(dplyr)

# Load desired columns:
#Date
#HomeTeam
#AwayTeam
#FTHG
#FTAG
#FTR

selectedData <- lapply(allData, select, c(Date, HomeTeam, AwayTeam, FTHG, FTAG, FTR))


#### MERGE DF AND MODIFY DATA TYPES ####
# Modify each selected column to a representative data type
# factor for categorical data
# numeric for int values
# date for date column (must specify strptime format)
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

summary(data) # Get some stats from df
