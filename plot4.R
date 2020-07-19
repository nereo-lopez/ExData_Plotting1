##Loading the data file into R##

dataFile <- read.csv("household_power_consumption.txt", header=T, sep=';', 
                     na.strings="?", nrows=2075259, check.names=F, 
                     stringsAsFactors=F, comment.char="", quote='\"')

##Creating objects to read data##

graph4 <- subset(dataFile, Date %in% c("1/2/2007","2/2/2007"))

graph4$Date <- as.Date(graph4$Date, format="%d/%m/%Y")

dateAndTime3 <- paste(as.Date(graph4$Date), graph4$Time)

graph4$dateAndTime3 <- as.POSIXct(dateAndTime3)

##Display Results##

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(graph4, {
  plot(Global_active_power~dateAndTime3, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~dateAndTime3, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~dateAndTime3, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~dateAndTime3,col='Red')
  lines(Sub_metering_3~dateAndTime3,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~dateAndTime3, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})

##Export to PNG file##

png("plot4.png", width = 540, height = 540)
dev.off()