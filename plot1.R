#Read in the data

electric <- read.table("household_power_consumption.txt", sep=";", header=TRUE)

#Create the subset of interest

elec.sub <- electric[electric$Date == "1/2/2007"| electric$Date == "2/2/2007",]

#clean data
elec.sub$Global_active_power <- as.numeric(elec.sub$Global_active_power)


#Make graph
png(file="plot1.png", width=480, height=480)
hist(elec.sub$Global_active_power, main="Global Active Power", col="red", 
     xlab="Global Active Power (kilowatts)")
dev.off()