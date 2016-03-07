data<-read.table("household_power_consumption.txt",sep=";",header=T)
 data_new<-data[as.Date(as.character(data[[1]]),"%d/%m/%Y") < "2007-02-03" & as.Date(as.character(data[[1]]),"%d/%m/%Y")>="2007-02-01",]
 
 
 GAP<-data_new$Global_active_power
 tt<-levels(GAP)[GAP]
 Global_active_power<-as.numeric(tt)
 

 ##plot-2
 date<-data_new$Date 
 time<-data_new$Time
 x<-paste(date,time)
 
 day<-strptime(x, "%d/%m/%Y %H:%M:%S") 
 plot(day,Global_active_power,xlab="",type="l")
 dev.copy(png,file = "plot2.png") 

