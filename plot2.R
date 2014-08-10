##download and retrieve data file
fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
temp <- tempfile()
download.file(fileurl,temp)
alldata <- read.delim(unz(temp, "household_power_consumption.txt"),colClasses="character",sep=";",na.strings="?")
unlink(temp)

##select specified data for analysis
selectdata <- subset(alldata,Date=="1/2/2007" | Date=="2/2/2007")

##combine date and time and set required fields to datetime and numeric for plotting
selectdata$Date <- strptime(paste(selectdata$Date,selectdata$Time), "%d/%m/%Y %H:%M:%S")
selectdata$Global_active_power <- as.numeric(selectdata$Global_active_power)

##generate plot and save to file
png(file="plot2.png",width=480,height=480)
with(selectdata,plot(Date,Global_active_power,type="n",ylab="Global Active Power (kilowatts)",xlab=""))
with(selectdata,lines(Date,Global_active_power))
dev.off()
