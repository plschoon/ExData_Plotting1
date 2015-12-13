# The following R script (plot4.r) is part of course project 1 of "Exploratory Data Analysis" and uses
## data from the UC Irvine Machine Learning Repository.  

# Reading in dataset
power <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", stringsAsFactors=FALSE)

# Subsetting dataset for the dates 2007-02-01 and 2007-02-02
power_subset <- power[power$Date %in% c("1/2/2007", "2/2/2007"), ]

# Converting the Date and Time variables to Date/Time classes 
DateTime <- strptime(paste(power_subset$Date, power_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")


# Subsetting data
GlobalActivePower <- as.numeric(power_subset$Global_active_power)
GlobalReactivePower <- as.numeric(power_subset$Global_reactive_power)
Voltage <- as.numeric(power_subset$Voltage)
SubMetering_1 <- as.numeric(power_subset$Sub_metering_1)
SubMetering_2 <- as.numeric(power_subset$Sub_metering_2)
SubMetering_3 <- as.numeric(power_subset$Sub_metering_3)

# Creating the png-file plot4.png
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 
plot(DateTime, GlobalActivePower, type="l", xlab="", ylab="Global Active Power")
plot(DateTime, Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(DateTime, SubMetering_1, type="l", ylab="Energy sub metering", xlab="")
lines(DateTime, SubMetering_2, type="l", col="red")
lines(DateTime, SubMetering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(DateTime, GlobalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()