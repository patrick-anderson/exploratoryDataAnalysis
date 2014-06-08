d=scan("household_power_consumption.txt", what=character(),na.strings="?", skip=66637, nlines=2880)
data=data.frame(matrix(unlist(sapply(d,strsplit,";")),ncol=9,byrow=T),stringsAsFactors =F)

d=scan("household_power_consumption.txt", what=character(),na.strings="?", skip=66637, nlines=2880)


colnames(data)=c("Date","Time","Global_active_power","Global_reactive_power",
                 "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2",
                 "Sub_metering_3")
p=strptime(paste(data[,1],data[,2]),format= "%d/%m/%Y %H:%M:%S")
data$DT=p


png(file="plot4.png",width=480,height=480)
par(mfcol=c(2,2))
plot(data$DT,as.numeric(data$Global_active_power),type="l",ylab="Global active power",xlab="")


plot(data$DT,as.numeric(data$Sub_metering_1),type="l",ylab="Energy sub metering",xlab="")
lines(data$DT,as.numeric(data$Sub_metering_2),col=2)
lines(data$DT,as.numeric(data$Sub_metering_3),col=4)
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c(1,2,4),lty=1,bty = "n")


plot(data$DT,as.numeric(data$Voltage),type="l",ylab="Voltage",xlab="datetime")


plot(data$DT,as.numeric(data$Global_reactive_power),type="l",ylab="Global_reactive_power",xlab="datetime")


dev.off()
