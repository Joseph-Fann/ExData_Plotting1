data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, nrows=2880, skip = 66636)
colnames(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltager", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

temp <- paste(data$Date,data$Time, sep = " ")
datetime <- strptime(temp, "%d/%m/%Y %H:%M:%S")
data <- cbind(datetime, data)

plot(data$datetime, data$Global_active_power, type = "l", ylab="Global Avtive Power (kimowatts)")

dev.copy(png, file="plot2.png")
dev.off()
