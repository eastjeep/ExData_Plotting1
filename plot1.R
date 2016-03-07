 data<-read.table("household_power_consumption.txt",sep=";",header=T)
 data_new<-data[as.Date(as.character(data[[1]]),"%d/%m/%Y") < "2007-02-03" & as.Date(as.character(data[[1]]),"%d/%m/%Y")>="2007-02-01",]
 

 GAP<-data_new$Global_active_power
 tt<-levels(GAP)[GAP]
 Global_active_power<-as.numeric(tt)
 
 hist(Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
 dev.copy(png,file="plot1.png") 