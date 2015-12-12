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
plot(new.Date,my.data$Global_active_power,type='l',ylab="Global Active Power")


