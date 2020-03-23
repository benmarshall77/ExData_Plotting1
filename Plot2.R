#Plot 2

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
data$DateTime <- paste(data$Date, data$Time)
data$DateTime<- as.POSIXlt(data$DateTime)


#creates plot on screen device
data$weekday <- weekdays(data$Date)
plot(data$DateTime, data$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = "", type = "l")

#saves as png
dev.copy(png, file = "plot2.png")
dev.off()