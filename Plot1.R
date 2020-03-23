#Plot 1

#Loading the Data
library(tidyverse)
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","PowerData.zip", method = "curl")
unzip("PowerData.zip")
alldata <- read.delim("household_power_consumption.txt",sep = ";")

#assigns variable properties
alldata$Date <- as.Date(alldata$Date, "%d/%m/%Y")

#subsets the data
data <- filter(alldata, (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(alldata)
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))

#creates plot on screen device
hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)") 
dev.copy(png, file = "plot1.png")
dev.off()
