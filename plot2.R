## Exploratory Data Analysis, Course Project 1
## reconstruct Plot 2 and save to PNG file

library("sqldf")
library("lubridate")

## read in relevant dates, create new date/time POSIX variable
df <- read.csv.sql("./household_power_consumption.txt", sql = 'select * from file where Date = "1/2/2007" or Date = "2/2/2007"', sep = ";", header = T)
df$DateTime <- paste(df$Date, df$Time)
df$DateTime <- dmy_hms(df$DateTime)

## reconstruct plot in PNG file
png(file = "plot2.png")
with(df, plot(DateTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()
