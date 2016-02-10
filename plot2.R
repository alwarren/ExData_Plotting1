# Copyright (c) 2016 Al Warren. All rights reserved.
# Author: Al Warren
#
# This program is a solution to plot 2 of course project 1
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
# Output is a PNG file named plot2.png.
# 
# Packages required: data.table, lubridate
# 
# See README.md for additional details

suppressMessages(library(data.table))
suppressMessages(library(lubridate))

# Read the file. Set all columns to character to avoid coersion
DT <- fread("household_power_consumption.txt", sep = ";", na.strings="?")

# Filter only the dates we need and remove NA values
DT <- na.omit(DT[Date %in% c("1/2/2007", "2/2/2007"), .(Date, Time, Global_active_power)])

# Format Date to posix date/time
DT[, Date := dmy_hms(paste(Date, Time))]

# Draw the plots
png(filename = "plot2.png", width = 480, height = 480, type = "cairo-png")

plot(DT$Date, DT$Global_active_power, type="l", 
     ylab="Global Active Power (kilowatts)", xlab="")
dev.off()
