#### Prepared  by Andrii Krasnyi for Coursera - Exploratory Data Analysis

pathref <- file.path("./data")

## Read data
full_dataset <- read.table(file.path(pathref, "household_power_consumption.txt"), header = TRUE, sep=";",dec = ".", na.strings = "?", nrows = 70000)
## Convert date 
full_dataset$Date <- as.Date(full_dataset$Date, format="%d/%m/%Y")

## full_dataset$Time <-  strptime(full_dataset$Time, format="%T")
## full_dataset$Time <-  strptime(full_dataset$Time, format="%H:%M:%S")

## Subseting data
sub_data <- subset(full_dataset, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(full_dataset)

## Plot 1
hist(sub_data$Global_active_power
     , main="Global Active Power"
     , xlab="Global Active Power (kilowatts)"
     , ylab="Frequency"
     , col="Red"
     ) 

## Copy to Png
dev.copy(png, file="plot1.png", height=480, width=480) 
dev.off() 

