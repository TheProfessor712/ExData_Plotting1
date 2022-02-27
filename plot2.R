library(lubridate)

data<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
##Imports the data into the correct table format

##Now we adjust the date and time strings
data$Date<-as.Date(data$Date, format = "%d/%m/%Y")
data$Time<-lubridate::hms(data$Time)

##now we isolate the two days we wish to focus on
my_data<-data[data$Date=="2007-02-01"|data$Date=="2007-02-02",]

png(file="plot2.png")
with(my_data, plot(Global_active_power, type = "l", xaxt="n", xlab="", ylab = "Global Active Power (kilowatts)"))
axis(1, at = c(0,1440,2880), labels = c("Thu", "Fri", "Sat"))
dev.off()