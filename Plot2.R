## Read Data
energyData<- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",stringsAsFactors=FALSE)
subsetEnergyData <- subset(energyData, Date %in% c("1/2/2007","2/2/2007"))
subsetEnergyData$Date <- as.Date(subsetEnergyData$Date, format="%d/%m/%Y")
datetime <- paste(as.character(subsetEnergyData$Date), as.character(subsetEnergyData$Time))
subsetEnergyData$Datetime <- as.POSIXct(datetime)

plot(subsetEnergyData$Global_active_power~subsetEnergyData$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

dev.copy(png, file="Plot2.png")
dev.off()







