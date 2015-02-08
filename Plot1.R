## read all data

alldata <- read.csv("household_power_consumption.txt", header=TRUE, sep=';',
                    na.strings="?", nrows=2075259, stringsAsFactors=FALSE) 

## convert to Date class
alldata$Date <- as.Date(alldata$Date, format="%d/%m/%Y")

## select data from the dates in question
partdata <- subset(alldata, Date >= "2007-02-01" & Date <= "2007-02-02")

## clear alldata from memory
rm(alldata)

## create plot1 
hist(partdata$Global_active_power, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts")

## save plot to png file and close the file
dev.copy(png, file="./ExploratoryAnalysisProj1/plot1.png", 
         height=480, width=480)
dev.off()
