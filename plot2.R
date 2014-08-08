# This code generates plot2.png showing global active power consumption by day 
# for the dates 2007-02-01 and 2007-02-02 from the household_power_consumption.txt dataset. 
#
# Prepare the plot data

# TODO: This currently reads the entire file, which is not efficient for a large dataset. 
# A future improvement is to read only the desired subset of the data. 

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
png(filename = 'plot2.png', width = 480, height = 480, units = 'px')

# Generate a line plot for consumption of global active power by day
plot(data$Date, data$Global_active_power, ylab="Global Active Power (kilowatts)", xlab="", type = "l") 

# close the graphics device
dev.off()
