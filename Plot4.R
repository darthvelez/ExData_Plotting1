#Download File#

if(!file.exists("exdata-data-household_power_consumption.zip")) {
  download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "household_power_consumption.zip")
  unzip("household_power_consumption.zip")
}

#Subsetting the Data#
  hpc <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings = "?", stringsAsFactors = FALSE)
    hpc_subset <- hpc[(hpc$Date=="1/2/2007") | (hpc$Date=="2/2/2007"),]
    Global_active_power <- as.numeric(hpc_subset$Global_active_power)
    Global_reactive_power <- as.numeric(hpc_subset$Global_reactive_power)
    Voltage <- as.numeric(hpc_subset$Voltage)
    Sub_metering_1 <- as.numeric(hpc_subset$Sub_metering_1)
    Sub_metering_2 <- as.numeric(hpc_subset$Sub_metering_2)
    Sub_metering_3 <- as.numeric(hpc_subset$Sub_metering_3)
    timeseries <- strptime(paste(hpc_subset$Date, hpc_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#Plot the plotting plotted plot1#
  png("plot4.png", width=480, height=480)
  par(mfrow=c(2,2))
    plot(timeseries, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#Plot the plotting plotted plot2#
    plot(timeseries,Voltage, type="l", xlab="datetime", ylab="Voltage")

#Plot the plotting plotted plot3#
    plot(timeseries, Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
      lines(timeseries, Sub_metering_2, type="l", col="red")
      lines(timeseries, Sub_metering_3, type="l", col="blue")
      legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
 

#Plot the plotting plotted plot4#
    plot(timeseries,Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
  
dev.off()  