##
## Read relevant data
##
DT<-fread("household_power_consumption.txt", skip="1/2/2007", nrows=2880)
colnames(DT)<-c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

##
## Open the png file
##
png(filename="plot2.png")
##
## Create a line plot of the Global Active Power per day/time
##
datetime=strptime(paste(DT$Date, DT$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
plot(datetime, DT$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="l")
##
## Close the device
##
dev.off()
