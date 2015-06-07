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

png("plot2.png",480,480)
plot(household$Global_active_power,xaxt = 'n',type = 'l', Xlab = NULL,ylab = 'Gloal active power(Kilowatts)')
axis(side = 1,at = c(1,1440,2880),labels = c('Thu','Fri','Sat'))
dev.off()
