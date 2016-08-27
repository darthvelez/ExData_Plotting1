#Download File#

if(!file.exists("exdata-data-household_power_consumption.zip")) {
  download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "household_power_consumption.zip")
  unzip("household_power_consumption.zip")
}

#Subset the Data#
  data <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings = "?", stringsAsFactors = FALSE)
  data$Date <- as.Date(data$Date, format="%d/%m/%Y")
  subdata <- data[(data$Date=="2007-02-01") | (data$Date=="2007-02-02"),]

#Plot the plotting plotted plot#
  png("plot1.png", width = 480, height = 480)
  hist(subdata$Global_active_power, main = paste("Global Active Power"), col="red", xlab="Global Active Power (kilowatts)")
  dev.copy(png, file="plot1.png")
  dev.off()

