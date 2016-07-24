
# Load data
power_consumption <- read.csv("./household_power_consumption.txt", sep = ";", header=FALSE, skip = 66637, nrows = 2880, na.strings = "?")
names(power_consumption) <- c(
  "Date", "Time", 
  "Global_active_power", 
  "Global_reactive_power", 
  "Voltage",
  "Global_intensity", 
  "Sub_metering_1", 
  "Sub_metering_2", 
  "Sub_metering_3"
  )

# Make a histogam of Frequency of Global Active Power (kilowatts)
png(width = 480, height = 480, file="plot1.png")
hist(power_consumption$Global_active_power, col = "red", main="Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
