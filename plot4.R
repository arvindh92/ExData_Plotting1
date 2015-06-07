## Include libraries data.table and drDevices

library(data.table)
library(grDevices)

## use function 'fread' to fetch data use 'skip' to go to date 1/2/2007
## sampling is one minute so use 2880 rows for 2 days (60min*24hours*2days)

setwd("I:\\DATA_Analysis_course\\Exploratory analysis\\Project 1\\ExData_Plotting1")
household <- fread("I:\\DATA_Analysis_course\\Exploratory analysis\\Project 1\\household_power_consumption.txt",sep=";",nrows = 2880 ,skip = "1/2/2007",na.strings = '?')
columnnames <- fread("I:\\DATA_Analysis_course\\Exploratory analysis\\Project 1\\household_power_consumption.txt",sep=";",nrows = 1 )
colnames(household)<-colnames(columnnames)

weekday <- c('sunday','monday','tuesday','wednesday','thursday','friday','saturday')
z<-as.POSIXlt(strptime(household$Date,'%d/%m/%Y'))
x<-cbind(weekday[z$wday],household)


## Plot using 'plot' function and save using 'png' function
## axes are modified seperately by axes function

png("plot4.png",480,480)
par(mfrow = c(2,2))

#plot(1,1)
plot(household$Global_active_power,xaxt = 'n',type = 'l', xlab = '',ylab = 'Gloal active power(Kilowatts)')
axis(side = 1,at = c(1,1440,2880),labels = c('Thu','Fri','Sat'))

#plot(1,2)
plot(household$Voltage,xaxt = 'n',type = 'l', xlab = 'datetime',ylab = 'Voltage')
axis(side = 1,at = c(1,1440,2880),labels = c('Thu','Fri','Sat'))

#plot(2,1)
plot(household$Sub_metering_1,xaxt = 'n',type = 'l', xlab = "",ylab = 'Energy sub metering')
lines(household$Sub_metering_2,col = 'red')
lines(household$Sub_metering_3,col = 'blue')
axis(side = 1,at = c(1,1440,2880),labels = c('Thu','Fri','Sat'))
legend('topright',c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), col = c('black','red','blue'), lty =1)

#plot(2,2)
plot(household$Global_reactive_power,xaxt = 'n',type = 'l', xlab = 'datetime',ylab = 'Gloal reactive power')
axis(side = 1,at = c(1,1440,2880),labels = c('Thu','Fri','Sat'))

dev.off()
