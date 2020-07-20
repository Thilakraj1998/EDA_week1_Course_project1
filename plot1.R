#package
library(data.table)
library(dplyr)
#file
file<-"./data/household_power_consumption.txt"
hpc<-fread(file)
names(hpc)
#conversion of datatypes from character to numeric and subset
subpower <- subset(hpc,hpc$Date=="1/2/2007" | hpc$Date =="2/2/2007")
subpower$Global_active_power<-as.numeric(subpower$Global_active_power)
#creating png file
png("./output/plot1.png",height = 480,width = 480)
#plotting histograph
hist(subpower$Global_active_power,col = "red",
     xlab = "Global Active Power (kilowatts)",main="Global Active Power")
#saving and closing current graphic device
dev.off()