##Plot 2##
#download and read in data from files
fileurl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl, destfile="ElectricPower.zip")
unzip(zipfile="ElectricPower.zip")

Dataset<-read.table("household_power_consumption.txt", header=T, sep=';', stringsAsFactors=F)
Dataset$Date<-as.Date(Dataset$Date, format="%d/%m/%Y")
df<-Dataset[(Dataset$Date=="2007-02-01") | (Dataset$Date=="2007-02-02"),]
df$Global_active_power <- as.numeric(as.character(df$Global_active_power))
datetime <- paste(as.Date(df$Date), df$Time)
df$Datetime <- as.POSIXct(datetime)

##Plot 2
plot(df$Datetime, df$Global_active_power, type="l", 
     xlab="", ylab="Global Active Power (kilowatts)")

#Saving to png file
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()