sourcedata <- "D:/DataScience/household_power_consumption.txt"
data <- read.table(sourcedata, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
reqdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
timestamp <- strptime(paste(reqdata$Date, reqdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
global_active_power <- as.numeric(reqdata$Global_active_power)
png("plot2.png", width=480, height=480)
plot(timestamp, global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()