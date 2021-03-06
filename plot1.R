## Include libraries data.table and drDevices

library(data.table)
library(grDevices)

## use function 'fread' to fetch data use 'skip' to go to date 1/2/2007
## sampling is one minute so use 2880 rows for 2 days (60min*24hours*2days)

setwd("I:\\DATA_Analysis_course\\Exploratory analysis\\Project 1\\ExData_Plotting1")
household <- fread("I:\\DATA_Analysis_course\\Exploratory analysis\\Project 1\\household_power_consumption.txt",sep=";",nrows = 2880 ,skip = "1/2/2007",na.strings = '?')
columnnames <- fread("I:\\DATA_Analysis_course\\Exploratory analysis\\Project 1\\household_power_consumption.txt",sep=";",nrows = 1 )
colnames(household)<-colnames(columnnames)

## Plot using 'hist' function and save using 'png' function

png("plot1.png",480,480)
hist(household$Global_active_power,col = 'red',main = 'Global Active Power',xlab ='Global Active Power (kilowatts)' )
dev.off()

