
## Load data file
data <- read.table("household_power_consumption.txt",
                   header = TRUE,
                   sep = ";",
                   colClasses = c("character", "character", rep("numeric",7)),
                   na = "?")

## Subset Date
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]

x <- paste(data$Date, data$Time)
data$DateTime <- strptime(x, "%d/%m/%Y %H:%M:%S")

## create png
png(filename = "plot4.png", 
    width = 480, height = 480, 
    units = "px", bg = "white")

par(mfcol=c(2,2))

plot(data$DateTime, 
     data$Global_active_power, 
     type="l",
     col="black", 
     xlab="", 
     ylab="Global Active Power", 
     main="")

plot(data$DateTime, 
     data$Sub_metering_1, 
     type="l",
     col="black", 
     xlab="", 
     ylab="Energy sub metering", 
     main="")
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
legend("topright", 
       lwd=1, 
       lty=1, 
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(data$DateTime, 
     data$Voltage, 
     type="l",
     col="black", 
     xlab="datetime", 
     ylab="Voltage", 
     main="")

plot(data$DateTime, 
     data$Global_reactive_power, 
     type="l",
     col="black", 
     xlab="datetime", 
     ylab="Global_reactive_power", 
     main="")

dev.off()