#plotting project
#This is the R code to generate Plot1.png using R's Base Plotting System
plot4 <- function(){	
	inputFile <- read.csv(file = "household_power_consumption.txt", sep = ";", skip = 1, na.strings = "?", col.names = c("Date","Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
		#Read input file	
	inputFile$Date <- as.Date(inputFile$Date, "%d/%m/%Y")
		#Convert Date field into R's Date format
	filtInputFile <- subset(inputFile, ((Date == as.Date("2007-02-01"))|(Date == as.Date("2007-02-02"))))
	rm(inputFile)
		#filter the data required (1st and 2nd Feb 2007) and delete the rest 
	temp <- paste(filtInputFile$Date, filtInputFile$Time, sep = ",")
	filtInputFile$Time <- strptime(temp, format="%Y-%m-%d,%H:%M:%S")
	rm(temp)
		#get the time in POSIXlt format
      
	par(mfcol=c(2,2))
     
            plot(filtInputFile$Time, filtInputFile$Global_active_power, ylab = "Global Active Power" , xlab = " ", type = "l")	

		plot(filtInputFile$Time, filtInputFile$Sub_metering_1 , ylab = "Energy sub metering" , col = "black",  xlab = " ", type = "l")	
      	lines(filtInputFile$Time, filtInputFile$Sub_metering_2, col = "red", type = "l")		
      	lines(filtInputFile$Time, filtInputFile$Sub_metering_3, col = "blue", type = "l")
      	legend("topright", col = c("black","red", "blue"), lty = c(1,1), bty = "n", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
		
     		plot(filtInputFile$Time, filtInputFile$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

		plot(filtInputFile$Time, filtInputFile$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")

		#plot the MultiPlot on the screen device
	dev.copy(device = png, height = 480, width = 480, file = "plot4.png")
	dev.off()
		#copy it to png file and turn the device off.
}