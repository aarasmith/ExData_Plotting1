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
date.time <- parse_date_time(with(sub.data, paste(Date, Time, sep = "-")), c("ymd S", "ymd MS", "ymd HMS"))
## create plot
png("plot4.png",width = 480, height = 480)
par(mfrow = c(2,2))
## plot 1
plot(date.time , sub.data$Global_active_power, type = "l", xlab = " ", ylab = "Global Active Power")
## plot 2
plot(date.time, sub.data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
## plot 3
plot(date.time, sub.data$Sub_metering_1, col = "black", type = "l", xlab = " ", ylab = "Energy sub metering")
lines(date.time, sub.data$Sub_metering_2, col = "red") 
lines(date.time, sub.data$Sub_metering_3, col = "blue")
legend("topright", 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lty = c(1,1,1), col = c("black","red","blue"))
## plot 4
plot(date.time, sub.data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()