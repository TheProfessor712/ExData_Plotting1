library(lubridate)

data<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
##Imports the data into the correct table format

##Now we adjust the date and time strings
data$Date<-as.Date(data$Date, format = "%d/%m/%Y")
data$Time<-lubridate::hms(data$Time)

##now we isolate the two days we wish to focus on
my_data<-data[data$Date=="2007-02-01"|data$Date=="2007-02-02",]

##Now we make a png of the histogram
png(file="plot1.png")
hist(my_data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()