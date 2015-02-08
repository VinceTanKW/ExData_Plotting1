## read all data

alldata <- read.csv("household_power_consumption.txt", header=TRUE, sep=';',
                    na.strings="?", nrows=2075259, stringsAsFactors=FALSE) 

## convert to Date class
alldata$Date <- as.Date(alldata$Date, format="%d/%m/%Y")

## select data from the dates in question
partdata <- subset(alldata, Date >= "2007-02-01" & Date <= "2007-02-02")

## clear alldata from memory
rm(alldata)

## combine date and time
partdata$datetime <- as.POSIXct(paste(partdata$Date, partdata$Time))

## create plot2
plot(Global_active_power~datetime, data=partdata, type="l", 
     ylab="Global Active Power (kilowatts)", xlab="")

## save plot to png file and close the file
dev.copy(png, file="./ExploratoryAnalysisProj1/plot2.png", 
         height=480, width=480)
dev.off()



