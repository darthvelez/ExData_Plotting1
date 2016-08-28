#Download File#

if(!file.exists("exdata-data-household_power_consumption.zip")) {
  download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "household_power_consumption.zip")
  unzip("household_power_consumption.zip")
}

#Subsetting the Data#
hpc <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings = "?", stringsAsFactors = FALSE)
hpc_subset <- hpc[(hpc$Date=="1/2/2007") | (hpc$Date=="2/2/2007"),]
Sub_metering_1 <- as.numeric(as.character(hpc_subset$Sub_metering_1))
Sub_metering_2 <- as.numeric(as.character(hpc_subset$Sub_metering_2))
Sub_metering_3 <- as.numeric(as.character(hpc_subset$Sub_metering_3))
timeseries <- strptime(paste(hpc_subset$Date, hpc_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#Plot the plotting plotted plot#
png("plot3.png", width=480, height=480)
plot(timeseries, Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(timeseries, Sub_metering_2, type="l", col="red")
lines(timeseries, Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()