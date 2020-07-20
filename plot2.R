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
date_time<-strptime(paste(subpower$Date,subpower$Time,sep = " "), "%d/%m/%Y %H:%M:%S")
#creating png file
png("./output/plot2.png",width = 480,height = 480)
#ploting the graph
plot(date_time,subpower$Global_active_power,type="l",xlab = "",ylab="Global Active Power(kilowatts)")
#saving and closing graphic device
dev.off()
