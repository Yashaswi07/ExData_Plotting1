## Read Data
energyData<- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",stringsAsFactors=FALSE)
subsetEnergyData <- subset(energyData, Date %in% c("1/2/2007","2/2/2007"))
hist(subsetEnergyData$Global_active_power,main='Global Active Power', xlab='Global Active Power(kilowatts)',col='RED')
dev.copy(png, file="Plot1.png")
dev.off()





