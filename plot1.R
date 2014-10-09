#plotting project
#This is the R code to generate Plot1.png using R's Base Plotting System
plot1 <- function(){	
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
	hist(filtInputFile$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
		#plot the histogram on the screen
	dev.copy(device = png, height = 480, width = 480, file = "plot1.png")
	dev.off()
		#copy it to png file.
}