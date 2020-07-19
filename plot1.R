##Loading the data file into R##

dataFile<- read.csv("household_power_consumption.txt", header = T, sep=';', 
                    na.strings="?", nrows=2075259, check.names=F, 
                    stringsAsFactors=F, comment.char="", quote='"\"')

##Creating objects to read data##

graph1 <- subset(dataFile,Date %in% c("1/2/2007", "2/2/2007"))

graph1$Date < as.Date(data1$Date, format="%d/%m/%Y")

##Display Results##

hist(graph1$Global_active_power, main="Global Active Power", 
                xlab="Global Active Power(kilowatts)",ylab="Frequency",
                col="Red")

##Export to PNG file##

png("plot1.png", width = 360, height = 360)
dev.off()