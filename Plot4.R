#dataset was already downloaded and saved into working directory, and unzipped
#read dataset into R

file="household_power_consumption.txt"
data <- read.table(text=grep("^[1,2]/2/2007",readLines(file),value=TRUE), sep = ";",col.names = c("Date","Time",
                                                                                                  "Global_Active_Power","Global_Reactive_Power","Voltage","Global_Intensity","Sub_Metering_1",
                                                                                                  "Sub_Metering_2","Sub_Metering_3"), na.strings = "?")
#Plot 4
if(!file.exists('graphs')) dir.create("graphs")
png(filename="./graphs/plot4.png",width=480,height=480,units="px")
Sys.setlocale(category = "LC_ALL", locale="english")
par(mfrow=c(2,2))
with(data, plot(DateTime, Global_Active_Power,xlab="",ylab="Global Active Power (kilowatts)",type="l"))
with(data, plot(DateTime, Voltage, xlab="datetime", ylab="Voltage",type="l"))
with(data, plot(DateTime, Sub_Metering_1, xlab="",ylab="Energy sub metering",type="l"))
with(data, lines(DateTime, Sub_Metering_2, col="red"))
with(data, lines(DateTime, Sub_Metering_3, col="blue"))
legend("topright", col=c("black","red","blue"), legend = c("Sub_Metering_1","Sub_Metering_2","Sub_Metering_3"),lwd=1)
with(data, plot(DateTime, Global_Reactive_Power, xlab="datetime",ylab="Global_Reactive_Power",type="l"))
dev.off()