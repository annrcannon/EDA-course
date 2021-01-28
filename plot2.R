#Read in the data

electric <- read.table("household_power_consumption.txt", sep=";", header=TRUE)

#Create the subset of interest

elec.sub <- electric[electric$Date == "1/2/2007"| electric$Date == "2/2/2007",]

#Create date/time variable
elec.sub$DateTime <- as.POSIXct(paste(elec.sub$Date, elec.sub$Time), 
                                format="%d/%m/%Y %H:%M:%S")

#Create plot
png(file="plot2.png", width=480, height=480)
plot(elec.sub$DateTime, elec.sub$Global_active_power, xlab="", 
     ylab="Global Active Power(kilowatts)", type="l")
dev.off()