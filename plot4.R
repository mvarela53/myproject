data<-read.table("household_power_consumption.txt",header=T,sep=';')
# select the desired days
my.day1<-which(data$Date=="1/2/2007")
my.day2<-which(data$Date=="2/2/2007")
my.data<-data[c(my.day1,my.day2),]
# transform the variables to numeric 
for(n in 3:9){
        my.data[,n]<-as.numeric(as.character(my.data[,n]))
}
#create a new date variable
new.Date<-paste(my.data$Date,my.data$Time)
new.Date<-as.POSIXlt(new.Date,format="%d/%m/%Y %H:%M:%S")
#create the plot
par(mfrow=c(2,2))
plot(new.Date,my.data$Global_active_power,type='l',ylab="Global Active Power",xlab="")
plot(new.Date,my.data$Voltage,type='l',xlab="datetime",ylab="Voltage")
plot(new.Date,my.data$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(new.Date,my.data$Sub_metering_2,col="red")
lines(new.Date,my.data$Sub_metering_3,col="blue")
legend("topright",cex=0.5,lwd=1,col=c("black","red","blue"),bty="n",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(new.Date,my.data$Global_reactive_power,type="l",xlab='datetime',ylab="Global_reactive_power")

