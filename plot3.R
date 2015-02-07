## Exploratory Data Analysis, Course Project 1
## reconstruct Plot 3 and save to PNG file

library("sqldf")
library("lubridate")

## read in relevant dates, create new date/time POSIX variable
df <- read.csv.sql("./household_power_consumption.txt", sql = 'select * from file where Date = "1/2/2007" or Date = "2/2/2007"', sep = ";", header = T)
df$DateTime <- paste(df$Date, df$Time)
df$DateTime <- dmy_hms(df$DateTime)

## reconstruct plot in PNG file
png(file = "plot3.png")
with(df, plot(DateTime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(df, lines(DateTime, Sub_metering_2, type = "l", col = "red"))
with(df, lines(DateTime, Sub_metering_3, type = "l", col = "blue"))
legend("topright", lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
