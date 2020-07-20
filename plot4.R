#package
library(data.table)
library(dplyr)
#file
file<-"./data/household_power_consumption.txt"
hpc<-fread(file)
names(hpc)
#data type convertions
subpower <- subset(hpc,hpc$Date=="1/2/2007" | hpc$Date =="2/2/2007")
subpower$Global_active_power<-as.numeric(subpower$Global_active_power)
subpower$Global_reactive_power<-as.numeric(subpower$Global_reactive_power)
subpower$Sub_metering_1<-as.numeric(subpower$Sub_metering_1)
subpower$Sub_metering_2<-as.numeric(subpower$Sub_metering_2)
subpower$Sub_metering_3<-as.numeric(subpower$Sub_metering_3)
subpower$Voltage<-as.numeric(subpower$Voltage)
date_time<-strptime(paste(subpower$Date,subpower$Time,sep = " "), "%d/%m/%Y %H:%M:%S")
png("./output/plot4.png",width = 480,height = 480)
#globalsetting
par(mfrow=c(2,2))
#graph1
plot(date_time,subpower$Global_active_power,type="l",xlab = "",ylab="Global Active Power(kilowatts)")
#graph2
plot(date_time,subpower$Voltage,type = "l",ylab="Voltage",xlab = "datetime")
#graph3

plot(date_time,subpower$Sub_metering_1,type="l",xlab = "",ylab="Energy Sub Metering")
lines(date_time,subpower$Sub_metering_2,type = "l",col="red")
lines(date_time,subpower$Sub_metering_3,type = "l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex = 0.9,col = c("black","red","blue"),lwd=1,bty = "n")
#graph4
plot(date_time,subpower$Global_reactive_power,ylab="Global Reactive Power",xlab="datetime",type = "l")
#saving image of plot
dev.off()
