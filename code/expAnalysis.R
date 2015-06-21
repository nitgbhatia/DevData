
#Using ggplot library
library(ggplot2)

trainData <- read.csv("./data/train.csv")

#####Checking the data first
#summary(trainData)
#str(trainData)
##Check to see if any NAs
#sum(is.na(trainData$Pclass)) #nop
#sum(is.na(trainData$Sex)) #nop
#sum(is.na(trainData$Age)) #Yes: 177!

#Collection of plots
g <- ggplot(trainData, aes(Age, Pclass))
p11 <- g + geom_point(aes(color=Sex)) 
p12 <- g + geom_point(aes(color=Sex)) + labs(title="Titanic intro Exploratory Analysis") + labs(x="Age of Passenger", y="Passenger Class on boat(1-3)")
p21 <- g + geom_point(aes(color=Sex)) + facet_grid(Survived ~.)
p22 <- g + geom_point(aes(color=Sex)) + facet_grid(Survived ~.) + labs(title="Titanic intro Exploratory Analysis") + labs(x="Age of Passenger", y="Passenger Class on boat(1-3)")

##To save the Plot 11:
png(filename='./figures/Plot11.png',
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white")
p11
#Close device connection
dev.off()

##To save the Plot 12:
png(filename='./figures/Plot12.png',
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white")
p12
#Close device connection
dev.off()

##To save the Plot 21:
png(filename='./figures/Plot21.png',
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white")
p21
#Close device connection
dev.off()


##To save the Plot 22:
png(filename='./figures/Plot22.png',
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white")
p22
#Close device connection
dev.off()
