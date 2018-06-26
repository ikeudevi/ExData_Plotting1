#
#Exploratory Data Analysis: Week1 Project
#plot2.R File: The zipped household power consumption data was downloaded to a directory, 
#and, extracted as a text file. The file was read in using read.table.
#
#getwd()
#list.files('./')
power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
#str(power)
#
#Subset the date values between 2017-02-01 & 2017-02-02 and, convert the factor variables to 
#their appropriate data type. 


ppower <- subset(power, Date == "1/2/2007" | Date == "2/2/2007")
ppower$Global_active_power <- as.numeric(as.character(ppower$Global_active_power))
ppower$Date <- as.Date(ppower$Date, format = "%d-%m-%Y")
ppower$Time <- strptime(ppower$Time, format="%H:%M:%S")
ppower[1:1440,"Time"] <- format(ppower[1:1440,"Time"],"2007-02-01 %H:%M:%S")
ppower[1441:2880,"Time"] <- format(ppower[1441:2880,"Time"],"2007-02-02 %H:%M:%S")
#
#Call the plot function for Time Vs. Global Active Power.
plot(ppower$Time, ppower$Global_active_power,  ylab="Global Active Power (kilowatts)", xlab="", type="l")
#
#Copy the plot as a 480 by 480 .png file to the working directory and close the PNG device

dev.copy(png, file = "plot2.png", width=480, height=480, bg="white") 
dev.off() 
#


                     