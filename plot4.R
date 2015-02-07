##
## Read relevant data
##
DT<-fread("household_power_consumption.txt", skip="1/2/2007", nrows=2880)
colnames(DT)<-c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

##
## Open the png file
##
png(filename="plot4.png")
##
## Create a line plot of the Global Active Power per day/time
##
datetime=strptime(paste(DT$Date, DT$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

## Prepare space for 4 plots in 2 rows and 2 columns
par(mfrow = c(2, 2))

## Plot 1
plot(datetime, DT$Global_active_power, xlab="", ylab="Global Active Power", type="l")

## Plot 2
plot(datetime, DT$Voltage, xlab="datetime", ylab="Voltage", type="l")

## Plot 3
plot(datetime, DT$Sub_metering_1, xlab="", ylab="Energy sub metering", type="n")
lines(datetime, DT$Sub_metering_1)
lines(datetime, DT$Sub_metering_2, col = "red")
lines(datetime, DT$Sub_metering_3, col = "blue")
legend("topright", lty=c(1, 1, 1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Plot 4
plot(datetime, DT$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l")


##
## Close the device
##
dev.off()
