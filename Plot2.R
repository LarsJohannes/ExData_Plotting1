
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
png(filename = "plot2.png", 
    width = 480, height = 480, 
    units = "px", bg = "white")
plot(data$DateTime,
        data$Global_active_power, 
     type ="l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()