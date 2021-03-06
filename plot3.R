# read file from working directory

data <- read.csv("household_power_consumption.txt", sep = ";")

# subset data

data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

# replace "?" values with NA

data[data == "?"] <- NA

# convert Time column to R format

data$Time <- strptime(data$Time, format = "%H:%M:%S")
data[1:1440, "Time"] <- format(data[1:1440, "Time"], "2007-02-01 %H:%M:%S")
data[1441:2880, "Time"] <- format(data[1441:2880, "Time"], "2007-02-02 %H:%M:%S")

# create file

png(filename = "plot3.png")

# plot with Dutch day labels

plot(data$Time, as.numeric(data$Sub_metering_1), type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(data$Time, as.numeric(data$Sub_metering_2), col = "red")
lines(data$Time, as.numeric(data$Sub_metering_3), col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"))

# close file

dev.off()
