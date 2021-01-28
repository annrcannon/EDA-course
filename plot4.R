#Read in the data

electric <- read.table("household_power_consumption.txt", sep=";", header=TRUE)

#Create the subset of interest

elec.sub <- electric[electric$Date == "1/2/2007"| electric$Date == "2/2/2007",]

#Clean data
elec.sub$Sub_metering_1 <- as.numeric(elec.sub$Sub_metering_1)
elec.sub$Sub_metering_2 <- as.numeric(elec.sub$Sub_metering_2)
elec.sub$Sub_metering_3 <- as.numeric(elec.sub$Sub_metering_3)
elec.sub$Global_active_power <- as.numeric(elec.sub$Global_active_power)
elec.sub$Voltage <- as.numeric(elec.sub$Voltage)
elec.sub$Global_reactive_power <- as.numeric(elec.sub$Global_reactive_power)

#Create date/time variable
elec.sub$DateTime <- as.POSIXct(paste(elec.sub$Date, elec.sub$Time), 
                                format="%d/%m/%Y %H:%M:%S")


#create plot

png(file="plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot(elec.sub$DateTime, elec.sub$Global_active_power, xlab="", 
     ylab="Global Active Power(kilowatts)", type="l")

plot(elec.sub$DateTime, elec.sub$Voltage, xlab="datetime", 
     ylab="Voltage", type="l")

plot(elec.sub$DateTime, elec.sub$Sub_metering_1, xlab="", 
     ylab="Energy sub metering", type="l")

points(elec.sub$DateTime, elec.sub$Sub_metering_2, col="red", type="l")
points(elec.sub$DateTime, elec.sub$Sub_metering_3, col="blue", type="l")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", 
                            "Sub_metering_3"), col=c("black","red","blue"), 
       lty=c(1,1,1), bty="n")

plot(elec.sub$DateTime, elec.sub$Global_reactive_power, xlab="datetime", 
     ylab="Global_reactive_power", type="l")

dev.off()

