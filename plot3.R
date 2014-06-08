data=data.frame(matrix(unlist(sapply(d,strsplit,";")),ncol=9,byrow=T),stringsAsFactors =F)


colnames(data)=c("Date","Time","Global_active_power","Global_reactive_power",
                 "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2",
                 "Sub_metering_3")
p=strptime(paste(data[,1],data[,2]),format= "%d/%m/%Y %H:%M:%S")
data$DT=p
head(data)
png(file="plot3.png",width=480,height=480)
plot(data$DT,as.numeric(data$Sub_metering_1),type="l",ylab="Energy sub metering",xlab="")
lines(data$DT,as.numeric(data$Sub_metering_2),col=2)
lines(data$DT,as.numeric(data$Sub_metering_3),col=4)
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c(1,2,4),lty=1)
dev.off()
