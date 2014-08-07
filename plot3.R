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

## Plot 3

# Convert the DateTime field to a Posix type 
seldata$DateTime <- as.POSIXlt(seldata$DateTime)

png(file = "plot3.png") ## Open PNG device

plot(seldata$DateTime, seldata$Sub_metering_1, xlab="",
     ylab="Energy sub metering", type="n")
with(seldata, {
  lines(DateTime, Sub_metering_1)
  lines(DateTime, Sub_metering_2, col="red")
  lines(DateTime, Sub_metering_3, col="blue")
})

legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3" ),
       col=c("black","red","blue"), lwd=1, bty="n")

dev.off() ## Close the PNG file device and save the file