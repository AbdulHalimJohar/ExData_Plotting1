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

# convert datetime
datetime <- paste(as.Date(Data$Date), Data$Time)
Data$Datetime <- as.POSIXct(datetime)

## Plotting here
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(Data, {
    plot(Global_active_power~Datetime, type="l", 
         ylab="Global Active Power (kilowatts)", xlab="")
    plot(Voltage~Datetime, type="l", 
         ylab="Voltage (volt)", xlab="")
    plot(Sub_metering_1~Datetime, type="l", 
         ylab="Global Active Power (kilowatts)", xlab="")
    lines(Sub_metering_2~Datetime,col='Red')
    lines(Sub_metering_3~Datetime,col='Blue')
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Global_reactive_power~Datetime, type="l", 
         ylab="Global Rective Power (kilowatts)",xlab="")
})

## Saving to file
dev.copy(png,file="plot4.png", height=480, width=480)
dev.off()





