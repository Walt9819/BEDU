#### Reto 1

# Load data
nfx.data <- read.csv("https://raw.githubusercontent.com/ecoronadoj/Sesion_1/main/Data/netflix_titles.csv")

# Show dims
dim(nfx.data)

# Show class
class(nfx.data)

# Get available columns
str(nfx.data)

# Get all titles released after 2015
net.2015 <- nfx.data$title[nfx.data$release_year > 2015]
net.2015 <- nfx.data[nfx.data$release_year > 2015, ]

# Get current directory
getwd()

# Write results to CSV file
write.csv(net.2015, "res_netflix.csv")

#### Reto 2

# Rand variables 
ran <- rnorm(44)

# results data frame
res <- c()

# res = empty vector
# for i from 1 to 15:
#   add to res[i] (ran[i]^3 + 12)

df.al <- data.frame(rand=c(), )

# Loop
for (i in 1:15) {
  res[i] <- ran[i]^3 + 12
}

# Add to data frame
df.al <- data.frame(aleatorio = ran[1:15], resultado = res)


#### Reto 3
amazon.best <- read.csv("https://raw.githubusercontent.com/beduExpert/Programacion-con-R-Santander/master/Sesion-01/Data/bestsellers%20with%20categories.csv")

tAmazon <- as.data.frame(t(amazon.best))

colnames(tAmazon) <- tAmazon[1,]

row.names(tAmazon)

which.max(tAmazon["Price", ])

which.min(tAmazon["Price", ])
