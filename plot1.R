# Copyright (c) 2016 Al Warren. All rights reserved.
# Author: Al Warren
#
# This program is a solution to plot 1 of course project 1
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
# Output is a PNG file named plot1.png.
#
# Packages required: data.table, lubridate
# 
# See README.md for additional details

suppressMessages(library(data.table))
suppressMessages(library(lubridate))

# Read the file. Set all columns to character to avoid coersion
DT <- fread("household_power_consumption.txt", sep = ";", na.strings="?")

# Filter only the dates we need and remove NA values
DT <- na.omit(DT[Date %in% c("1/2/2007", "2/2/2007"), .(Global_active_power)])

#Draw the plot
png(filename = "plot1.png", width = 480, height = 480, type = "cairo-png")

hist(DT$Global_active_power, main="Global Active Power",
     xlab="Global Active Power (kilowatts)", col="red")

dev.off()
