#!/usr/bin/Rscript

library(sqldf)

fileName <- "household_power_consumption.csv"

#read the dataset
data <- read.csv.sql(fileName,sep=";",
  sql="select * from file where Date in ('1/2/2007', '2/2/2007')")
closeAllConnections()

png("./plot3.png")  

rawDateTime <- paste(data$Date, data$Time)
dateTime <- strptime(rawDateTime, format="%d/%m/%Y %H:%M:%S")

plot(dateTime, data$Sub_metering_1, type='l', main='', xlab='', 
  ylab='Energy sub metering')
lines(dateTime, data$Sub_metering_2, col='red', type='l')
lines(dateTime, data$Sub_metering_3, col='blue')
legend("topright", lty=1, col=c("black","red","blue"), 
  legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()  