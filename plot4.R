# This code generates plot4.png, which is a graphic that contains four plots 
# showing different aspects of a subset of the household_power_consumption.txt dataset. 
# Only data from the dates 2007-02-01 and 2007-02-02 are shown.

#
# Prepare the plot data
#
# TODO: This currently reads the entire file, which is not efficient for a large dataset. 
# A future improvement is to read only the desired subset of the data. 
#
# Read the data. It's important to note the separation character as ";" and the na.strings as "?"
hpc <- read.table("household_power_consumption.txt", sep=";", header=T, na.strings="?")

# Select only the rows needed for this assignment: all the data with dates 2007-02-01 and 2007-02-02.
data<-subset(hpc,Date=="1/2/2007" | Date=="2/2/2007")

# Coerce the date and time into r objects. This is important for the time series analysis.
data$Date <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")

# To get the English Day labels on the axes (this formulation is mac specific)
Sys.setlocale("LC_TIME", "en_US")

#
# Now generate the plot
#
# Open the png file device with 480x480 dimensions
png(filename = 'plot4.png', width = 480, height = 480, units = 'px')

# Two rows, two columns, by row.
par(mfrow = c(2,2))

# Generate the first plot in upper left corner. The y-axis label is as specified
plot(data$Date, data$Global_active_power, ylab="Global Active Power (kilowatts)", xlab="",type = "l") 

# Generate the second plot in upper right corner showing Voltage use by datetime.
plot(data$Date, data$Voltage, xlab="datetime", ylab="Voltage",type = "l")

# Generate the third plot in lower left corner showing the three energy sub metering measures.
plot(data$Date, data$Sub_metering_1, ylab="Energy sub metering", xlab="", type="l")
# add other sub metering variables in a different color
lines(data$Date, data$Sub_metering_3, col="blue")
lines(data$Date, data$Sub_metering_2, col="red") 

# add the legend 
#for each of the sub_metering variables, in their respective colors. 
# The lty parameter gives a line symbol in the legend for each variable
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=1)
# Generate the fourth plot in lower right corner 
plot(data$Date, data$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type = "l")  

# close the graphics device
dev.off()
