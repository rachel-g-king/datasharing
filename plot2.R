#Title: Coursera - Experimental Data  - Course Project 1 - Plot 2
#Author: Rachel King
#Date: 10.05.17

#reading data. 
df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)

#converting date and time to r data type
df$dateTime <- paste(df$Date, df$Time, sep = " ")
df$dateTime <- strptime(df$dateTime, format = "%d/%m/%Y %H:%M:%S")

#Subsetting to dates required for plots. 
subdf <- subset(df, dateTime >= as.Date("2007-02-01") & dateTime < as.Date("2007-02-03") )
head(subdf)

#making things numeric to allow for plotting. Any ? values should be converted to NA
cols <- c("Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subdf[cols] <- sapply(subdf[cols],as.numeric)

#plot2
png(file = "plot2.png", width = 480, height = 480, units = "px")
with(subdf, plot(dateTime, Global_active_power, type = "l", xlab = NA, ylab = "Global Active Power (kilowatts)"))
dev.off()