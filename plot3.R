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
selectdata$sub_metering_1 <- as.numeric(selectdata$Sub_metering_1)
selectdata$sub_metering_2 <- as.numeric(selectdata$Sub_metering_2)
selectdata$sub_metering_3 <- as.numeric(selectdata$Sub_metering_3)

##generate plot and save to file
png(file="plot3.png",width=480,height=480)
with(selectdata,plot(Date,Sub_metering_1,type="n",ylab="Energy sub metering",xlab=""))
with(selectdata,lines(Date,Sub_metering_1))
with(selectdata,lines(Date,Sub_metering_2,col="red"))
with(selectdata,lines(Date,Sub_metering_3,col="blue"))
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),
lty=c(1,1,1),lwd=c(2,2,2))
dev.off()
