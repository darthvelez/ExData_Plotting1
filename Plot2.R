#Download File#

if(!file.exists("exdata-data-household_power_consumption.zip")) {
  download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "household_power_consumption.zip")
  unzip("household_power_consumption.zip")
}

#Subsetting the Data#
  hpc <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings = "?", stringsAsFactors = FALSE)
  hpc_subset <- hpc[(hpc$Date=="1/2/2007") | (hpc$Date=="2/2/2007"),]
  Global_active_power <- as.numeric(hpc_subset$Global_active_power)
  timeseries <- strptime(paste(hpc_subset$Date, hpc_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
     
#Plot the plotting plotted plot#
  png("plot2.png", width=480, height=480)
  plot(timeseries, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  dev.off()