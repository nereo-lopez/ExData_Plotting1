##Loading the data file into R##

dataFile <- read.csv("household_power_consumption.txt", header=T, sep=';', 
                     na.strings="?", nrows=2075259, check.names=F, 
                     stringsAsFactors=F, comment.char="", quote='\"')

##Creating objects to read data##

graph3 <- subset(dataFile, Date %in% c("1/2/2007","2/2/2007"))

graph3$Date <- as.Date(graph3$Date, format="%d/%m/%Y")

dateAndTime2 <- paste(as.Date(graph3$Date), graph3$Time)

graph3$dateAndTime2 <- as.POSIXct(dateAndTime2)

##Display Results##

with(graph3, {
  plot(Sub_metering_1~dateAndTime2, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~dateAndTime2,col='Red')
  lines(Sub_metering_3~dateAndTime2,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##Export to PNG file##

png("plot3.png", width = 360, height = 360)
dev.off()