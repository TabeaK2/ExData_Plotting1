url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url,"epower.zip") #Download zip file.
unzip("epower.zip", "household_power_consumption.txt") #Unzip file.
epower<-read.table("household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors = FALSE) #Create dataframe using Readr "read.csv2" package.
#Create new merged column of data and time.
datetime<-strptime(paste(epower$Date, epower$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
epower<-cbind(datetime,epower)
#Wrong Column classes, change to appropriate class.
epower$Date <- as.Date(epower$Date, format ="%d/%m/%Y")
epower$Global_active_power <- as.numeric(epower$Global_active_power)
epower$Global_reactive_power <- as.numeric(epower$Global_reactive_power)
epower$Voltage <- as.numeric(epower$Voltage)
epower$Global_intensity <- as.numeric(epower$Global_intensity)
epower$Sub_metering_1 <- as.numeric(epower$Sub_metering_1)
epower$Sub_metering_2 <- as.numeric(epower$Sub_metering_2)
epower$Sub_metering_3 <- as.numeric(epower$Sub_metering_3)
#Subset data for 2 selected dates.
epowersubset<-subset(epower, Date =="2007-02-01" | Date =="2007-02-02")
#Initiate png.
png("plot2.png", width=480, height=480)
#Create line plot.
plot(epowersubset$datetime, epowersubset$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()