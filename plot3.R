data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, nrows=2880, skip = 66636)
colnames(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltager", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

temp <- paste(data$Date,data$Time, sep = " ")
datetime <- strptime(temp, "%d/%m/%Y %H:%M:%S")
data <- cbind(datetime, data)

with(data, plot(datetime, data$Sub_metering_1, type="n",ylab = "Energy sub metering"))
with(data, points(datetime, data$Sub_metering_1, col="black", type="l"))
with(data, points(datetime, data$Sub_metering_2, col="red", type = "l"))
with(data, points(datetime, data$Sub_metering_3, col="blue", type = "l"))
legend("topright", pch = "_", col = c("black","blue", "red"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.copy(png, file="plot3.png")
dev.off()
