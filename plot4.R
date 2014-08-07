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

## Plot 4

# Convert the DateTime field to a Posix type 
seldata$DateTime <- as.POSIXlt(seldata$DateTime)

png(file = "plot4.png") ## Open PNG device

omfrow <- par("mfrow") # make a copy of default parameters

par(mfrow=c(2,2)) # Change parameters

plot(seldata$DateTime, seldata$Global_active_power, xlab="",
     ylab="Global Active Power", type="n")
lines(seldata$DateTime, seldata$Global_active_power,type="l") 


plot(seldata$DateTime, seldata$Voltage, xlab="datetime",
     ylab="Voltage", type="n")
lines(seldata$DateTime, seldata$Voltage, type="l")


plot(seldata$DateTime, seldata$Sub_metering_1, xlab="",
     ylab="Energy sub metering", type="n")
with(seldata, {
  lines(DateTime, Sub_metering_1)
  lines(DateTime, Sub_metering_2, col="red")
  lines(DateTime, Sub_metering_3, col="blue")
})


legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3" ),
       col=c("black","red","blue"), lwd=1, bty="n", cex=0.9)


plot(seldata$DateTime, seldata$Global_reactive_power, xlab="datetime",
     ylab="Global_reactive_power", type="n")
lines(seldata$DateTime, seldata$Global_reactive_power, type="l")

par(mfrow=omfrow) # restored old parameters back

dev.off() ## Close the PNG file device and save the file