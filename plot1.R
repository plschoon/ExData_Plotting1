## The following R script (plot1.r) is part of course project 1 of "Exploratory Data Analysis" and uses
## data from the UC Irvine Machine Learning Repository.  


# Reading in dataset
power <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", stringsAsFactors=FALSE)

# Subsetting dataset for the dates 2007-02-01 and 2007-02-02
power_subset <- power[power$Date %in% c("1/2/2007", "2/2/2007"), ]

# Creating the png-file plot1.png
GlobalActivePower <- as.numeric(power_subset$Global_active_power)
png("plot1.png", width=480, height=480)
hist(GlobalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()