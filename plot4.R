#!/usr/bin/Rscript

library(sqldf)

fileName <- "household_power_consumption.csv"

#read the dataset
data <- read.csv.sql(fileName,sep=";",
  sql="select * from file where Date in ('1/2/2007', '2/2/2007')")
closeAllConnections()



#create datetime column and replace Date with datetime and delete Time
rawdatetime <- paste(data$Date, data$Time)
datetime <- strptime(rawdatetime, format="%d/%m/%Y %H:%M:%S")

data$Date <- datetime
names(data)[1] <- "datetime"
data$Time <- NULL

png("./plot4.png")  
par(mfrow=c(2,2))


with(data, {
        plot(datetime, Global_active_power, type='l', xlab='', 
                ylab='Global Active Power (kilowatts)', main='')

        plot(datetime, Voltage, type='l', ylab='Voltage', main='')

        plot(datetime, Sub_metering_1, type='l', main='', xlab='', 
                ylab='Energy sub metering')
        lines(datetime, Sub_metering_2, col='red', type='l')
        lines(datetime, Sub_metering_3, col='blue')
        legend("topright", lty=1, col=c("black","red","blue"), bty='n',
                legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

        plot(datetime, Global_reactive_power, pch='.')
        lines(datetime, Global_reactive_power)
})

dev.off()  