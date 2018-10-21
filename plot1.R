library(lubridate)
## read data
data <- read.table("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, header = TRUE)
## subset data
data$Date <- dmy(data$Date)
sub.data <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")
## convert data
sub.data$Time <- hms(sub.data$Time)
sub.data$Global_active_power <- as.numeric(sub.data$Global_active_power)
sub.data$Global_reactive_power <- as.numeric(sub.data$Global_reactive_power)
sub.data$Global_intensity <- as.numeric(sub.data$Global_intensity)
sub.data$Sub_metering_1 <- as.numeric(sub.data$Sub_metering_1)
sub.data$Sub_metering_2 <- as.numeric(sub.data$Sub_metering_2)
sub.data$Sub_metering_3 <- as.numeric(sub.data$Sub_metering_3)
## create plot
png("plot1.png", width = 480, height = 480)
with(sub.data, hist(Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency"))
dev.off()