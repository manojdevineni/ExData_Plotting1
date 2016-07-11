sourcedata <- "D:/DataScience/household_power_consumption.txt"
data <- read.table(sourcedata, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
reqdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
timestamp <- strptime(paste(reqdata$Date, reqdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
global_active_power <- as.numeric(reqdata$Global_active_power)
global_reactive_power <- as.numeric(reqdata$Global_reactive_power)
voltage <- as.numeric(reqdata$Voltage)
subMetering1 <- as.numeric(reqdata$Sub_metering_1)
subMetering2 <- as.numeric(reqdata$Sub_metering_2)
subMetering3 <- as.numeric(reqdata$Sub_metering_3)
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 
plot(timestamp, global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(timestamp, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(timestamp, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(timestamp, subMetering2, type="l", col="red")
lines(timestamp, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(timestamp, global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()