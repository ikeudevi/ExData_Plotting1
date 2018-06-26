#
#Exploratory Data Analysis: Week1 Project
#plot1.R File; The zipped household power consumtion data was downloaded to a directory, then extracted as a 
#text file. This file was read in usinga read.table for processing
#
getwd()
list.files('./')
power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
power$Date <- as.Date(power$Date)
#
#Next, subset the date values between 2017-02-01 & 2017-02-02 and, convert Global_active_power from factor 
#variables to numeric variables
#
ppower <- subset(power, Date == "1/2/2007" | Date == "2/2/2007")
ppower$Global_active_power <- as.numeric(as.character(ppower$Global_active_power))
#
#We call the histogram ploting function on the date values in this dataset.
#

hist(ppower$Global_active_power, main="Global Active Power", col="red", xlab="Global Active Power(kilowatts)")
#
#Next, copy the plot as a 480 by 480 .png file to the working directory
dev.copy(png, file = "plot1.png", width=480, height=480, bg="white") 
dev.off() 
## Close the PNG device


                     