#package
library(data.table)
library(dplyr)
#file
file<-"./data/household_power_consumption.txt"
hpc<-fread(file)
names(hpc)
#data type convertions
subpower <- subset(hpc,hpc$Date=="1/2/2007" | hpc$Date =="2/2/2007")
subpower$Sub_metering_1<-as.numeric(subpower$Sub_metering_1)
subpower$Sub_metering_2<-as.numeric(subpower$Sub_metering_2)
subpower$Sub_metering_3<-as.numeric(subpower$Sub_metering_3)
date_time<-strptime(paste(subpower$Date,subpower$Time,sep = " "), "%d/%m/%Y %H:%M:%S")
#generating png file
png("./output/plot3.png",width = 480,height = 480)
#ploting
plot(date_time,subpower$Sub_metering_1,type="l",xlab = "",ylab="Energy Sub Metering")
lines(date_time,subpower$Sub_metering_2,type = "l",col="red")
lines(date_time,subpower$Sub_metering_3,type = "l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"),lty=1,lwd=2)
#saving in local storage and closing device graphic
dev.off()