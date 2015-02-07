## Exploratory Data Analysis, Course Project 1
## reconstruct Plot 4 and save to PNG file

library("sqldf")
library("lubridate")

## read in relevant dates, create new date/time POSIX variable
df <- read.csv.sql("./household_power_consumption.txt", sql = 'select * from file where Date = "1/2/2007" or Date = "2/2/2007"', sep = ";", header = T)
df$DateTime <- paste(df$Date, df$Time)
df$DateTime <- dmy_hms(df$DateTime)

## reconstruct plot in PNG file
png(file = "plot4.png")
par(mfcol = c(2,2), mar = c(4, 4, 2, 2))
with(df, {
    plot(DateTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
    plot(DateTime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
    lines(DateTime, Sub_metering_2, type = "l", col = "red")
    lines(DateTime, Sub_metering_3, type = "l", col = "blue")
    legend("topright", lwd = 1, bty = "n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(DateTime, Voltage, type = "l", xlab = "datetime")
    plot(DateTime, Global_reactive_power, type = "l", xlab = "datetime")         
})
dev.off()
