 data<-read.table("household_power_consumption.txt",sep=";",header=T)
 data_new<-data[as.Date(as.character(data[[1]]),"%d/%m/%Y") < "2007-02-03" & as.Date(as.character(data[[1]]),"%d/%m/%Y")>="2007-02-01",]
 

 GAP<-data_new$Global_active_power
 tt<-levels(GAP)[GAP]
 Global_active_power<-as.numeric(tt)
 


 date<-data_new$Date 
 time<-data_new$Time
 x<-paste(date,time)
 
 day<-strptime(x, "%d/%m/%Y %H:%M:%S") 


 sub_1<-as.numeric(levels(data_new$Sub_metering_1)[data_new$Sub_metering_1])
 sub_2<-as.numeric(levels(data_new$Sub_metering_2)[data_new$Sub_metering_2])
 sub_3<-data_new$Sub_metering_3
 
 
##plot-4
 par(mfrow=c(2,2))
 
 vol<-data_new$Voltage
 voltage<-as.numeric(levels(vol)[vol])
 reac<-data_new$Global_reactive_power
 Global_reactive_power<-as.numeric(levels(reac)[reac])
 
 plot(day,Global_active_power,type="l",xlab="")
 plot(day,voltage,type="l",xlab="datetime")
 plot(day,sub_1,type="l",xlab="",ylab="Energy sub metering")
 lines(day,sub_2,col="red")
 lines(day,sub_3,col="blue")
 #legend("topright",pch=1,col=c("black","red","blue"),legend=c("sub_1","sub_2","sub_3"))
 legend("topright",pch="-",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")) 
 plot(day,Global_reactive_power,type="l",xlab="datetime")
 
dev.copy(png,file="plot4.png")

 
 