# read file from working directory

data <- read.csv("household_power_consumption.txt", sep = ";")

# subset data

data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

# replace "?" values with NA

data[data == "?"] <- NA

# create file

png(filename = "plot1.png")

# plot frequency with hist(ogram)

hist(as.numeric(data$Global_active_power), xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")

# close file

dev.off()
