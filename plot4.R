########################################################################
## Description: Code for Plot One - First Course Project of the
## Exploratory Data Analysis Course - Data Science specialization -
## Johns Hopkins University / Coursera
##
## Maintainer: Coursera/Johns Hopkins University
## Author: Rodrigo Sant Ana
## Created: Sáb Jun  6 21:50:27 2015 (-0300)
## Version: 0.0.1
## Last-Updated: Sáb Jun  6 21:57:18 2015 (-0300)
##           By: Rodrigo Sant Ana
##
## URL: github.com/rodrigosantana/ExData_Plotting1
## Doc URL: github.com/rodrigosantana/ExData_Plotting1
##
## Database info: Eletric power consumption data set - Measurements of
## electric power consumption in one household with a one-minute
## sampling rate over a period of almost 4 years. Different electrical
## quantities and some sub-metering values are available.
##
### Commentary:
##
### Code:
########################################################################

########################################################################
### Source read.webzip function ...
source("read.webzip.R")

########################################################################
### Downloading, unzipping and loading dataset ...
dados <- read.webzip("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip")

########################################################################
### Subsetting original data ... selecting only the first and second
### days of february 2007 ... Before that, is necessary to transform
### Date column in dataset ...
dados$Date <- as.Date(dados$Date, format = "%d/%m/%Y")
subdata <- dados[dados$Date %in% as.Date(c("2007-02-01",
                                           "2007-02-02")),]
subdata$date.time <- strptime(paste(subdata$Date, subdata$Time,
                                    sep=" "),
                              format = "%Y-%m-%d %H:%M:%S")

########################################################################
### Plot 4 - Multiple plot ...
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
plot(subdata$date.time, subdata$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)")
plot(subdata$date.time, subdata$Voltage, type = "l",
     xlab = "datetime", ylab = "Voltage")
plot(subdata$date.time, subdata$Sub_metering_1, type = "l", xlab = "",
     ylab = "Energy sub metering")
lines(subdata$date.time, subdata$Sub_metering_2, col = "red")
lines(subdata$date.time, subdata$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd = c(1, 1, 1))
plot(subdata$date.time, subdata$Global_reactive_power, type = "l",
     xlab = "", ylab = "Global_reactive_power")
dev.off()

########################################################################
##
## The MIT License (MIT)
##
## Copyright (c) 2014 Rodrigo Sant'Ana
##
## Permission is hereby granted, free of charge, to any person
## obtaining a copy of this software and associated documentation
## files (the 'Software'), to deal in the Software without
## restriction, including without limitation the rights to use,
## copy, modify, merge, publish, distribute, sublicense, and/or
## sell copies of the Software, and to permit persons to whom the
## Software is furnished to do so, subject to the following
## conditions:
##
## The above copyright notice and this permission notice shall be
## included in all copies or substantial portions of the Software.
##
## THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
## EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
## OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
## NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
## BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
## ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
## CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
## SOFTWARE.
##
########################################################################
