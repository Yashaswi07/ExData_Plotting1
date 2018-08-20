## Read Data
energyData<- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",stringsAsFactors=FALSE)
subsetEnergyData <- subset(energyData, Date %in% c("1/2/2007","2/2/2007"))
subsetEnergyData$Date <- as.Date(subsetEnergyData$Date, format="%d/%m/%Y")
dateWithTime <- paste(as.character(subsetEnergyData$Date), as.character(subsetEnergyData$Time))
subsetEnergyData$DateWithTime <- as.POSIXct(dateWithTime)

plot(subsetEnergyData$Sub_metering_1~subsetEnergyData$DateWithTime, type="l",
     ylab="Energy sub metering", xlab="")
lines(subsetEnergyData$Sub_metering_2~subsetEnergyData$DateWithTime,col='Red')
lines(subsetEnergyData$Sub_metering_3~subsetEnergyData$DateWithTime,col='Blue')
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file="Plot3.png",height=480, width=480)
dev.off()







