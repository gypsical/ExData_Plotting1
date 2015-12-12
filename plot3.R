##Plot 3##
#download and read in data from files
fileurl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl, destfile="ElectricPower.zip")
unzip(zipfile="ElectricPower.zip")

Dataset<-read.table("household_power_consumption.txt", header=T, sep=';', stringsAsFactors=F)
Dataset$Date<-as.Date(Dataset$Date, format="%d/%m/%Y")
df<-Dataset[(Dataset$Date=="2007-02-01") | (Dataset$Date=="2007-02-02"),]

datetime <- paste(as.Date(df$Date), df$Time)
df$Datetime <- as.POSIXct(datetime)
subMet1 <- as.numeric(df$Sub_metering_1)
subMet2 <- as.numeric(df$Sub_metering_2)
subMet3 <- as.numeric(df$Sub_metering_3)


## Plot
plot(df$Datetime, subMet1, type="l", ylab="Energy sub metering", xlab="",lwd=2)
lines(df$Datetime, subMet2, type="l", col="red",  lwd=2)
lines(df$Datetime, subMet3, type="l", col="blue", lwd=2)
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), lty=c(1,1), lwd=2, x.intersp=0, cex=0.8)

#Saving to png file
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()