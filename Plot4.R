## Read Data
energyData<- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",stringsAsFactors=FALSE)
subsetEnergyData <- subset(energyData, Date %in% c("1/2/2007","2/2/2007"))
subsetEnergyData$Date <- as.Date(subsetEnergyData$Date, format="%d/%m/%Y")
dateWithTime <- paste(as.character(subsetEnergyData$Date), as.character(subsetEnergyData$Time))
subsetEnergyData$DateWithTime <- as.POSIXct(dateWithTime)
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

plot(subsetEnergyData$Global_active_power~subsetEnergyData$DateWithTime, type="l", 
     ylab="Global Active Power (kilowatts)", xlab="")
plot(subsetEnergyData$Voltage~subsetEnergyData$DateWithTime, type="l", 
     ylab="Voltage (volt)", xlab="")
mtext("datetime", 1)
plot(subsetEnergyData$Sub_metering_1~subsetEnergyData$DateWithTime, type="l", 
     ylab="Global Active Power (kilowatts)", xlab="")
lines(subsetEnergyData$Sub_metering_2~subsetEnergyData$DateWithTime,col='Red')
lines(subsetEnergyData$Sub_metering_3~subsetEnergyData$DateWithTime,col='Blue')
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(subsetEnergyData$Global_reactive_power~subsetEnergyData$DateWithTime, type="l", 
     ylab="Global Rective Power (kilowatts)",xlab="")
mtext("datetime", 1)

dev.copy(png, file="Plot4.png",height=480, width=480)
dev.off()







