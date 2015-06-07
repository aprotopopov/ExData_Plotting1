#!/usr/bin/Rscript
library(sqldf)

file_name <- "household_power_consumption.csv"

#read the dataset
data <- read.csv.sql(file_name,sep=";",
  sql="select * from file where Date in ('1/2/2007', '2/2/2007')")
closeAllConnections()

png("./plot1.png")  

hist(data[,'Global_active_power'], 
  col='red', 
  xlab='Global Active Power (kilowatts)',
  main='Global Active Power')

dev.off()  