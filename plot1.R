library(readr)
url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url,"epower.zip") #Download zip file.
unzip("epower.zip", "household_power_consumption.txt") #Unzip file.
epower<-read.csv2("household_power_consumption.txt") #Create dataframe using Readr "read.csv2" package.
#Wrong Column classes, change to appropriate class.
epower$Date <- as.Date(epower$Date, format ="%d/%m/%Y")
epower$Global_active_power <- as.numeric(epower$Global_active_power)
epower$Global_reactive_power <- as.numeric(epower$Global_reactive_power)
epower$Voltage <- as.numeric(epower$Voltage)
epower$Global_intensity <- as.numeric(epower$Global_intensity)
epower$Sub_metering_1 <- as.numeric(epower$Sub_metering_1)
epower$Sub_metering_2 <- as.numeric(epower$Sub_metering_2)
epower$Sub_metering_3 <- as.numeric(epower$Sub_metering_3)
epowersubset<-subset(epower, Date =="2007-02-01" | Date =="2007-02-02")
