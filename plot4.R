#### Prepared  by Andrii Krasnyi for Coursera - Exploratory Data Analysis

pathref <- file.path("./data")

## Read data
full_dataset <- read.table(file.path(pathref, "household_power_consumption.txt"), header = TRUE, sep=";",dec = ".", na.strings = "?", nrows = 70000)
## Subseting data
sub_data <- full_dataset[full_dataset$Date %in% c("1/2/2007","2/2/2007") ,]
rm(full_dataset)

## Convert creting datetime 
datetime <- strptime(paste(sub_data$Date, sub_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

## datetime <- paste(sub_data$Date, sub_data$Time, sep=" ")
sub_data$Datetime <- datetime


##par(mfrow = c(2, 2), pty = "s") 
par(mfcol = c(2, 2), mai = c(0.9, 0.7, 0.1, 0.2))
##par(mfcol = c(2, 2),mar=c(4,1,1,1))
## Plot 1

plot(sub_data$Datetime,sub_data$Global_active_power
     , type="l"
     , main=""
     , xlab=""
     , ylab="Global Active Power (kilowatts)"
) 

## Plot 2
plot(sub_data$Datetime,sub_data$Sub_metering_1 
     , type="l"
     , xlab=""
     , ylab="Energy Sub Metering"
     ) 
lines(datetime, sub_data$Sub_metering_2, type="l", col="red") 
lines(datetime, sub_data$Sub_metering_3, type="l", col="blue") 
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
       , lty=1
       , seg.len=0.5 
       , bty = "n"
       , col=c("black", "red", "blue") 
       , y.intersp = 0.5
       )

## Plot 3
plot(sub_data$Datetime,sub_data$Voltage  
     , type="l"
     , xlab="Datetime"
     , ylab="Voltage"
) 

## Plot 4
plot(sub_data$Datetime,sub_data$Global_reactive_power 
     , type="l"
     , xlab="Datetime"
     , ylab="Global_reactive_power"
) 


## Copy to Png
dev.copy(png, file="plot4.png", height=480, width=480) 
dev.off() 

