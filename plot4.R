## This not the R code you're looking for. Move along.
# Copyright (c) 2016 Al Warren. All rights reserved.
# Author: Al Warren
#
# This program is a solution to plot 4 of course project 1
# from the Coursera course Exploratory Data Analysis.
#
# Input data is from the “Individual household 
# electric power consumption Data Set” of the UC Irvine Machine 
# Learning Repository. The data can be downloaded at
# https://d396qusza40orc.cloudfront.net/
#     exdata%2Fdata%2Fhousehold_power_consumption.zip
#
# Previous commit 11674880daea81e6c5ffa6f239f9ffc0c7194fa7
# 
# Output is a PNG file named plot4.png.
# 
# Packages required: data.table, lubridate
# 
# See README.md for additional details

suppressMessages(library(data.table))
suppressMessages(library(lubridate))

# Read the file. Set all columns to character to avoid coersion
DT <- fread("household_power_consumption.txt", sep = ";", na.strings="?")

# Remove unneeded field before removing NAs
DT$Global_intensity <- NULL

# Filter only the dates we need and remove NA values
DT <- na.omit(DT[Date %in% c("1/2/2007", "2/2/2007")])

# Format Date to posix date/time
DT[, Date := dmy_hms(paste(Date, Time))]

# Draw the plots
png(filename = "plot4.png", width = 480, height = 480, type = "cairo-png")

par(mfrow = c(2,2))

with(DT, plot(Date, Global_active_power, type="l", 
              ylab="Global Active Power", xlab=""))

with(DT, plot(Date, Voltage, type="l", 
              ylab="Voltage", xlab="datetime"))

with(DT, plot(Date, Sub_metering_1, type="l", 
              ylab="Energy sub metering", xlab=""))
with(DT, lines(Date, Sub_metering_2,col = "red"))
with(DT, lines(Date, Sub_metering_3,col = "blue"))
legend("topright", lty=1, col=c("black", "red", "blue"), bty="n",
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

with(DT, plot(Date, Global_reactive_power, type="l",
              ylab="Global_reactive_power", xlab="datetime"))

dev.off()
