sourcedata <- "D:/DataScience/household_power_consumption.txt"
data <- read.table(sourcedata, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
reqdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
global_Active_Power <- as.numeric(subSetData$Global_active_power)
png("plot1.png", width=480, height=480)
hist(global_Active_Power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()