##Loading the data file into R##

dataFile <- read.csv("household_power_consumption.txt", header=T, sep=';', 
                      na.strings="?", nrows=2075259, check.names=F, 
                      stringsAsFactors=F, comment.char="", quote='\"')

##Creating objects to read data##

graph2 <- subset(dataFile, Date %in% c("1/2/2007","2/2/2007"))

graph2$Date <- as.Date(graph2$Date, format="%d/%m/%Y")

dateAndTime <- paste(as.Date(graph2$Date), graph2$Time)

graph2$dateAndTime <- as.POSIXct(dateAndTime)

##Display Results##

with(graph2, {
  plot(Global_active_power~dateAndTime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
})

##Export to PNG file##

png("plot2.png", width = 360, height = 360)
dev.off()