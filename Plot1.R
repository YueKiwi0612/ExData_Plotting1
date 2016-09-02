
#dataset was already downloaded and saved into working directory, and unzipped
#read dataset into R

file="household_power_consumption.txt"
data <- read.table(text=grep("^[1,2]/2/2007",readLines(file),value=TRUE), sep = ";",col.names = c("Date","Time",
 "Global_Active_Power","Global_Reactive_Power","Voltage","Global_Intensity","Sub_Metering_1",
 "Sub_Metering_2","Sub_Metering_3"), na.strings = "?")

#Plot 1
if(!file.exists('graphs')) dir.create("graphs")
png(filename="./graphs/plot1.png",width=480,height=480,units="px")
with(data,hist(Global_Active_Power, xlab="Global Active Power (kilowatts)",main="Global Active Power",col="red"))
dev.off()