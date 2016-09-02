#dataset was already downloaded and saved into working directory, and unzipped
#read dataset into R

file="household_power_consumption.txt"
data <- read.table(text=grep("^[1,2]/2/2007",readLines(file),value=TRUE), sep = ";",col.names = c("Date","Time",
         "Global_Active_Power","Global_Reactive_Power","Voltage","Global_Intensity","Sub_Metering_1",
         "Sub_Metering_2","Sub_Metering_3"), na.strings = "?")
#Plot 2
#first convert Date and Time to date/time formats
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$DateTime <- as.POSIXct(paste(data$Date, data$Time))
#plot
if(!file.exists('graphs')) dir.create("graphs")
png(filename="./graphs/plot2.png",width=480,height=480,units="px")
Sys.setlocale(category = "LC_ALL", locale="english")
with(data, plot(DateTime, Global_Active_Power, xlab="",ylab="Global Active Power (Kilowatts)", type="l")) 
dev.off()