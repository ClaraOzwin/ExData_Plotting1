# This code generates plot3.png, showing three different measures for energy sub-metering 
# for the dates 2007-02-01 and 2007-02-02 from the household_power_consumption.txt dataset. 
#
# Prepare the plot data

# TODO: This currently reads the entire file, which is not efficient for a large dataset. 
# A future improvement is to read only the desired subset of the data. 
#
# Read the data. 
# It's important to note the separation character as ";" and the na.strings as "?"
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
png(filename = 'plot3.png', width = 480, height = 480, units = 'px')

# Generate the plot.
# Start with the first plot, with the largest range to get the axes right without explicitly setting them
# Following the homework example, the y-axis label is "Energy sub metering" and the x-axis label is suppressed
plot(data$Date, data$Sub_metering_1, ylab="Energy sub metering", xlab="", type="l")

# add lines for the other sub-metering variables in the appropriate color
lines(data$Date, data$Sub_metering_3, col="blue")
lines(data$Date, data$Sub_metering_2, col="red") 

# add the legend for each of the sub_metering variables, in their respective colors. The lty parameter gives a line symbol in the legend for each variable
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=1)

# close the graphics device
dev.off()
