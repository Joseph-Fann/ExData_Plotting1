data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, nrows=2880, skip = 66636)
colnames(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltager", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

temp <- data["Date"]
temp <- lapply(temp, as.Date,"%d/%m/%Y")
data["Date"] <- temp

temp <- data["Time"]
temp <- lapply(temp,strptime,"%H:%M:%S")
data["Time"] <- temp

head(data)
hist(data$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col="red")

dev.copy(png, file="plot1.png",width=480, height=480)
dev.off()
