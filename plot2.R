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

png(filename = "plot2.png")

# plot with Dutch day labels

plot(data$Time, as.numeric(data$Global_active_power), type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

# close file

dev.off()
