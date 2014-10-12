
## Load data file
data <- read.table("household_power_consumption.txt",
                   header = TRUE,
                   sep = ";",
                   colClasses = c("character", "character", rep("numeric",7)),
                   na = "?")

## Subset Date
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]

## create png
png(filename = "plot1.png", 
    width = 480, height = 480, 
    units = "px", bg = "transparent")
hist(data$Global_active_power, 
     col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)",
     breaks = 12, ylim = c(0, 1200))
dev.off()