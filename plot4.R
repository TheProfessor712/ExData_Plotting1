library(lubridate)

data<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
##Imports the data into the correct table format

##Now we adjust the date and time strings
data$Date<-as.Date(data$Date, format = "%d/%m/%Y")
data$Time<-lubridate::hms(data$Time)

##now we isolate the two days we wish to focus on
my_data<-data[data$Date=="2007-02-01"|data$Date=="2007-02-02",]




png(file="plot4.png")
par(mfrow = c(2,2), mar=c(4,4,2,1))

##Top Left
with(my_data, plot(Global_active_power, type = "l", xaxt="n", xlab="", ylab = "Global Active Power (kilowatts)"))
axis(1, at = c(0,1440,2880), labels = c("Thu", "Fri", "Sat"))

##Top Right
with(my_data, plot(Voltage, type = "l",xlab = "datetime", ylab="Voltage", xaxt="n"))
axis(1, at = c(0,1440,2880), labels = c("Thu", "Fri", "Sat"))

##Bottom Left
with(my_data, plot(Sub_metering_1, type="l",xaxt="n", xlab="", ylab = "Energy sub metering"))
axis(1, at = c(0,1440,2880), labels = c("Thu", "Fri", "Sat"))
with(my_data, lines(Sub_metering_2, col="red",type="l"))
with(my_data, lines(Sub_metering_3, col="blue",type="l"))
legend("topright", bty = "n", lty=1, col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##Bottom Right
with(my_data, plot(Global_reactive_power, type = "l",xlab = "datetime", ylab="Voltage", xaxt="n"))
axis(1, at = c(0,1440,2880), labels = c("Thu", "Fri", "Sat"))

dev.off()