# This code generates plot1.png, a histogram showing global active power consumption for 
# a subset of the household_power_consumption.txt dataset. 
# Only data from the dates 2007-02-01 and 2007-02-02 are shown.
#
# Prepare the plot data
#
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
png(filename = 'plot1.png', width = 480, height = 480, units = 'px')

# Plot the histogram in red with title and x-axis label as specified. 
# The y-axis label defaults to "Frequency"
hist(data$Global_active_power, col= "red", main = "Global Active Power", xlab ="Global Active Power (killowatts)")

# close the graphics device
dev.off()
