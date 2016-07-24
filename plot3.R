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

# Make a plot of Energy sub metering per date
png(width = 480, height = 480, file="plot3.png")

with(power_consumption, plot(Datetime, Sub_metering_1, type="n", ylab="Engergy sub metering", xlab=""))
with(power_consumption, points(Datetime, Sub_metering_1, col="black", type="l"))
with(power_consumption, points(Datetime, Sub_metering_2, col="red", type="l"))
with(power_consumption, points(Datetime, Sub_metering_3, col="blue", type="l"))
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
