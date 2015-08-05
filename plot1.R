library(dplyr)

# Set current directory
setwd("/Users/abdulhalimjohar/Exploratory Data Analysis/ExData_Plotting1")

# Read the dataset file
Full_Data <- read.csv("household_power_consumption.txt", header=TRUE, sep=";",
                      na.strings="?",check.names=FALSE, stringsAsFactors=FALSE,
                      comment.char="", quote='\"')
Full_Data$Date <- as.Date(Full_Data$Date,format="%d/%m/%Y")

# Grab required data only
Data <- filter(Full_Data, Date >= "2007-02-01" & Date <= "2007-02-02")

# Remove Full_Data
rm(Full_Data)

hist(Data$Global_active_power,
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to file
dev.copy(png,file="plot1.png", height=480, width=480)
dev.off()





