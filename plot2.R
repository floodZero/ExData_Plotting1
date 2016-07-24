# Change locale for displaying english in plot.
# (I'm using korean windows. If you are using Unix-like system, it's 'Sys.setlocale("LC_TIME", "en_US.UTF-8")' )
Sys.setlocale("LC_TIME", "English")

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
power_consumption$Datetime <- strptime( paste(power_consumption$Date, power_consumption$Time),format="%d/%m/%Y %H:%M:%S")

# Make a plot of Global Active Power (kilowatts) per date
png(width = 480, height = 480, file="plot2.png")
with(power_consumption, plot(Datetime, Global_active_power, type="l", main="", ylab = "Global Active Power (kilowatts)", xlab=""))
dev.off()
