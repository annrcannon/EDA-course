#Read in the data

electric <- read.table("household_power_consumption.txt", sep=";", header=TRUE)

#Create the subset of interest

elec.sub <- electric[electric$Date == "1/2/2007"| electric$Date == "2/2/2007",]

#Clean data
elec.sub$Sub_metering_1 <- as.numeric(elec.sub$Sub_metering_1)
elec.sub$Sub_metering_2 <- as.numeric(elec.sub$Sub_metering_2)
elec.sub$Sub_metering_3 <- as.numeric(elec.sub$Sub_metering_3)

#Create date/time variable
elec.sub$DateTime <- as.POSIXct(paste(elec.sub$Date, elec.sub$Time), 
                                format="%d/%m/%Y %H:%M:%S")

#Create graphs

png(file="plot3.png", width=480, height=480)
plot(elec.sub$DateTime, elec.sub$Sub_metering_1, xlab="", 
      ylab="Energy sub metering", type="l")
points(elec.sub$DateTime, elec.sub$Sub_metering_2, col="red", type="l")
points(elec.sub$DateTime, elec.sub$Sub_metering_3, col="blue", type="l")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", 
                            "Sub_metering_3"), col=c("black","red","blue"), 
       lty=c(1,1,1))
dev.off()

