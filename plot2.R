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

## Plot 2
plot(sub_data$Datetime,sub_data$Global_active_power
    , type="l"
    , main=""
    , xlab=""
    , ylab="Global Active Power (kilowatts)"
    ) 

## Copy to Png
dev.copy(png, file="plot2.png", height=480, width=480) 
dev.off() 

