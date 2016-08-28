#Download File#

if(!file.exists("exdata-data-household_power_consumption.zip")) {
  download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "household_power_consumption.zip")
  unzip("household_power_consumption.zip")
}

#Subsetting the Data#
  data <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings = "?", stringsAsFactors = FALSE)
  Global_active_power <- as.numeric(data$Global_active_power)
  timeseries <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
  subdata <- data[(data$Date=="2007-2-1") | (data$Date=="2007-2-2"),]

#Plot the plotting plotted plot#
  png("plot2.png", width=480, height=480)
  plot(timeseries, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  dev.off()