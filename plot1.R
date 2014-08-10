##download and retrieve data file
fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
temp <- tempfile()
download.file(fileurl,temp)
alldata <- read.delim(unz(temp, "household_power_consumption.txt"),colClasses="character",sep=";",na.strings="?")
unlink(temp)

##select specified data for analysis
selectdata <- subset(alldata,Date=="1/2/2007" | Date=="2/2/2007")

##set required field to numeric for plotting
selectdata$Global_active_power <- as.numeric(selectdata$Global_active_power)

##generate plot and save to file
png(file="plot1.png",width=480,height=480)
hist(selectdata$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
