#Plot 3

#Loading the Data
library(tidyverse)
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","PowerData.zip", method = "curl")
unzip("PowerData.zip")
alldata <- read.delim("household_power_consumption.txt",sep = ";")

#assigns variable properties
alldata$Date <- as.Date(alldata$Date, "%d/%m/%Y")

#subsets and prepares the data
data <- filter(alldata, (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(alldata)
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
data$Global_reactive_power <- as.numeric(as.character(data$Global_reactive_power))
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))
data$DateTime <- as.POSIXlt(paste(data$Date, data$Time))
data$weekday <- weekdays(data$Date)

#creates plot on screen device

plot(data$DateTime, data$Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "n")
points(data$DateTime, data$Sub_metering_1, type = "l")
points(data$DateTime, data$Sub_metering_2, type = "l", col = "red")
points(data$DateTime, data$Sub_metering_3, type = "l", col = "blue")
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#saves as png
dev.copy(png, file = "plot3.png")
dev.off()

