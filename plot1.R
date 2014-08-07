## Exploratory Data Analysis
## Project 1
## Set Up

dataraw <- read.table("household_power_consumption.txt", sep=";",
                      header=TRUE, na.strings = "?")
dataraw$DateTime <- strptime(paste(dataraw$Date, dataraw$Time), 
                             format="%d/%m/%Y %H:%M:%S")

seldata <- subset(dataraw, 
                  DateTime>="2007-02-01 00:00:00" & DateTime <="2007-02-02 23:59:59", 
                  select= c(DateTime, Global_active_power, Global_reactive_power, 
                            Voltage, Global_intensity, Sub_metering_1, 
                            Sub_metering_2, Sub_metering_3))

## Plot 1

png(file = "plot1.png", width = 480, height = 480, units = "px") ## Open PNG device

hist(seldata$Global_active_power,col="red", main="Global Active Power",
     ylab="Frequency", xlab="Global Active Power (kilowatts)")

dev.off() ## Close the PNG file device and save the file
