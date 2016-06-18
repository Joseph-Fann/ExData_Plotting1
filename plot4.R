data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, nrows=2880, skip = 66636)
colnames(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

temp <- paste(data$Date,data$Time, sep = " ")
datetime <- strptime(temp, "%d/%m/%Y %H:%M:%S")
data <- cbind(datetime, data)

par(mfrow = c(2, 2))

# chart 1
plot(data$datetime, data$Global_active_power, type = "l", ylab="Global Avtive Power", xlab="")

# chart 2
plot(data$datetime, data$Voltage, type="l", xlab="datetime", ylab="Voltage")

# chart 3
with(data, plot(datetime, data$Sub_metering_1, type="n",ylab = "Energy sub metering", xlab = ""))
with(data, points(datetime, data$Sub_metering_1, col="black", type="l"))
with(data, points(datetime, data$Sub_metering_2, col="red", type = "l"))
with(data, points(datetime, data$Sub_metering_3, col="blue", type = "l"))
legend("topright", pch = "_", col = c("black","blue", "red"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty = "n")

# chart 4
plot(data$datetime, data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.copy(png, file="plot4.png",width=480, height=480 )
dev.off()

