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

## create plot4
par(mfcol=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

with(partdata, {
    plot(Global_active_power~datetime, type="l", 
         ylab="Global Active Power (kilowatts)", xlab="")
    plot(datetime, Sub_metering_1, type="l", col="darkgrey",
         ylab="Energy sub metering", xlab="")
        lines(datetime, Sub_metering_2, type="l", col="red")
        lines(datetime, Sub_metering_3, type="l", col="blue") 
        legend("topright", col=c("darkgrey", "red", "blue"), lty=1, lwd=2, 
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Voltage~datetime, type="l")
    plot(Global_reactive_power~datetime, type="l")
})


## save plot to png file and close the file
dev.copy(png, file="./ExploratoryAnalysisProj1/plot4.png", 
         height=480, width=480)
dev.off()


