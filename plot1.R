## Exploratory Data Analysis, Course Project 1
## reconstruct Plot 1 and save to PNG file

library("sqldf")

## read in only relevant dates
df <- read.csv.sql("./household_power_consumption.txt", sql = 'select * from file where Date = "1/2/2007" or Date = "2/2/2007"', sep = ";", header = T)

## reconstruct histogram in PNG file
png(file = "plot1.png")
hist(df$Global_active_power, main = "Global Active Power", xlab = "Global active power (kilowatts)", col = "red")
dev.off()