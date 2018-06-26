#
#Exploratory Data Analysis: Week1 Project
#plot4.R File: The zipped household power consumption data was downloaded to a directory, 
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
ppower$Sub_metering_1 <- as.numeric(as.character(ppower$Sub_metering_1))
ppower$Sub_metering_2 <- as.numeric(as.character(ppower$Sub_metering_2))
ppower$Sub_metering_3 <- as.numeric(as.character(ppower$Sub_metering_3))

ppower$Voltage <- as.numeric(as.character(ppower$Voltage))
ppower$Global_reactive_power <- as.numeric(as.character(ppower$Global_reactive_power))
#
ppower$Date <- as.Date(ppower$Date, format = "%d-%m-%Y")
ppower$Time <- strptime(ppower$Time, format="%H:%M:%S")
ppower[1:1440,"Time"] <- format(ppower[1:1440,"Time"],"2007-02-01 %H:%M:%S")
ppower[1441:2880,"Time"] <- format(ppower[1441:2880,"Time"],"2007-02-02 %H:%M:%S")
#
#Create a 2 by 2 plotting area for the 4 plots.
par(mfrow=c(2,2))

plot(ppower$Time, ppower$Global_active_power, xlab="",ylab="Global Active Power", type="l")
plot(ppower$Time, ppower$Voltage, xlab="datetime",ylab="Voltage", type="l")

plot(ppower$Time, ppower$Sub_metering_1, xlab="",ylab="Energy sub metering", type="n")
lines(ppower$Time, ppower$Sub_metering_1)
lines(ppower$Time, ppower$Sub_metering_2, col="blue")
lines(ppower$Time, ppower$Sub_metering_3, col="red")
#
#Add legend
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("green","red","blue"),lty=1, cex=0.4)
#
plot(ppower$Time, ppower$Global_reactive_power, xlab="datetime",ylab="Global_reactive_power", type="l")

#Copy the plot as a 480 by 480 .png file to the working directory and close the PNG device
dev.copy(png, file = "plot4.png", width=1000, height=1000, bg="white") 
dev.off() 
#


                     