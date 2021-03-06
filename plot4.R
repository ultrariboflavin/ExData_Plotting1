#read, subset and format data
mydata <- read.delim("household_power_consumption.txt",sep=";")
mydata2 <- mydata[(mydata$Date == "1/2/2007" | mydata$Date == "2/2/2007"),]
mydata2$Date <- as.character(mydata2$Date)
mydata2$Date <- as.Date(mydata2$Date,format="%d/%m/%Y")
mydata2$DayOfWeek <- format(mydata2$Date, "%a")
mydata2$Time <- strptime(as.character(mydata2$Time))
mydata2$Global_active_power <- as.numeric(as.character(mydata2$Global_active_power))
mydata2$Global_reactive_power <- as.numeric(as.character(mydata2$Global_reactive_power))
mydata2$Voltage <- as.numeric(as.character(mydata2$Voltage))
mydata2$Global_intensity <- as.numeric(as.character(mydata2$Global_intensity))
mydata2$Sub_metering_1 <- as.numeric(as.character(mydata2$Sub_metering_1))
mydata2$Sub_metering_2 <- as.numeric(as.character(mydata2$Sub_metering_2))
mydata2$Sub_metering_3 <- as.numeric(as.character(mydata2$Sub_metering_3))


#open png graphics device
png(filename="plot4.png",width=480,height = 480)

#setup matrix of plots
par(mfcol=c(2,2))

#plot1
plot(mydata2$Global_active_power,xaxt="n",type="l",
     ylab="Global Active Power (kilowatts)", xlab = "")
axis(1,at = c(1,1440,2880),labels=c("Thu","Fri","Sat"))

#plot2
with(mydata2, plot(Sub_metering_1,xaxt="n",type="l",xlab = "", ylab = "Energy sub metering"))
axis(1,at = c(1,1440,2880),labels=c("Thu","Fri","Sat"))
with(mydata2, lines(Sub_metering_2, col="red"))
with(mydata2, lines(Sub_metering_3, col="blue"))
legend("topright",pch="-",col = c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#plot3
plot(mydata2$Voltage,xaxt="n",type="l",
     ylab="Voltage", xlab = "datetime")
axis(1,at = c(1,1440,2880),labels=c("Thu","Fri","Sat"))

#plot4
plot(mydata2$Global_reactive_power,xaxt="n",type="l",
     ylab="Global_reactive_power", xlab = "datetime")
axis(1,at = c(1,1440,2880),labels=c("Thu","Fri","Sat"))

#close graphics device
dev.off()