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
png(filename="plot1.png",width=480,height = 480)

#plot data
hist(data$Global_active_power,
     breaks = 12,
     col="orangered2", 
     main="Global Active Power", 
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency")

#close graphics device
dev.off()
