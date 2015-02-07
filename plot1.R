##
## Read relevant data
##
DT<-fread("household_power_consumption.txt", skip="1/2/2007", nrows=2880)
colnames(DT)<-c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

##
## Open the png file
##
png(filename="plot1.png")
##
## Create a histogram of the Global Active Power with appropriate title, x label and color
##
hist(DT$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
##
## Close the device
##
dev.off()
