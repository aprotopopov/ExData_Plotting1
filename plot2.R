#!/usr/bin/Rscript

library(sqldf)

fileName <- "household_power_consumption.csv"

#read the dataset
data <- read.csv.sql(fileName,sep=";",
  sql="select * from file where Date in ('1/2/2007', '2/2/2007')")
closeAllConnections()

png("./plot2.png")  

rawDateTime <- paste(data$Date, data$Time)
dateTime <- strptime(rawDateTime, format="%d/%m/%Y %H:%M:%S")

plot(dateTime, data[,'Global_active_power'], type='l', xlab='', 
  ylab='Global Active Power (kilowatts)', main='')

dev.off()  