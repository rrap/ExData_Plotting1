##
## Read relevant data
##
DT<-fread("household_power_consumption.txt", skip="1/2/2007", nrows=2880)
colnames(DT)<-c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

##
## Open the png file
##
png(filename="plot3.png")
##
## Create a line plot of Sub metering 1, 2, 3 per day/time
##
datetime=strptime(paste(DT$Date, DT$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
plot(datetime, DT$Sub_metering_1, xlab="", ylab="Energy sub metering", type="n")
lines(datetime, DT$Sub_metering_1)
lines(datetime, DT$Sub_metering_2, col = "red")
lines(datetime, DT$Sub_metering_3, col = "blue")
legend("topright", lty=c(1, 1, 1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##
## Close the device
##
dev.off()
