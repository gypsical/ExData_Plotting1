##Plot 4##
#download and read in data from files
fileurl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl, destfile="ElectricPower.zip")
unzip(zipfile="ElectricPower.zip")

Dataset<-read.table("household_power_consumption.txt", header=T, sep=';', stringsAsFactors=F)
Dataset$Date<-as.Date(Dataset$Date, format="%d/%m/%Y")
df<-Dataset[(Dataset$Date=="2007-02-01") | (Dataset$Date=="2007-02-02"),]

datetime <- paste(as.Date(df$Date), df$Time)
df$Datetime <- as.POSIXct(datetime)
df$Global_active_power <- as.numeric(df$Global_active_power)
df$Global_reactive_power <- as.numeric(df$Global_reactive_power)
df$Voltage <- as.numeric(df$Voltage)
subMet1 <- as.numeric(df$Sub_metering_1)
subMet2 <- as.numeric(df$Sub_metering_2)
subMet3 <- as.numeric(df$Sub_metering_3)

#Plot 4
par(mfrow = c(2, 2), mar=c(4,4,2,1)) 
plot(df$Datetime, df$Global_active_power, type="l", xlab="", ylab="Global Active Power")
plot(df$Datetime, df$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(df$Datetime, subMet1, type="l", ylab="Energy sub metering", xlab="")
lines(df$Datetime, subMet2, type="l", col="red")
lines(df$Datetime, subMet3, type="l", col="blue")
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), lty=c(1,1), lwd=1, bty="n")
plot(df$Datetime, df$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

#Saving to png file
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()