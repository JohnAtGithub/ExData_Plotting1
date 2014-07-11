# read file

raw_data = read.table("household_power_consumption.txt", 
                      na.strings="?", sep=";",
                      stringsAsFactors=FALSE,
                      header=T)
# convert date and get data
raw_data$Date=as.Date(raw_data$Date,"%d/%m/%Y")
aa=raw_data[raw_data$Date=="2007-02-01",]
bb=raw_data[raw_data$Date=="2007-02-02",]
cc=rbind(aa,bb)

# start to plot 3 and annotate
data_3=cc
data_3$datetime=strptime(paste(data_3$Date,data_3$Time),
                         "%Y-%m-%d %H:%M:%S")
png("plot3.png",width=480,height=480)
plot(data_3$datetime,data_3$Sub_metering_1,
     col="black",
     type="s",xlab=" ", ylab="Energy sub metering")
par(new=T)
plot(data_3$datetime,data_3$Sub_metering_2,
     col="orangered",ylim=range(data_3$Sub_metering_1),
     type="s",xlab=" ", ylab=" ")
par(new=T)
plot(data_3$datetime,data_3$Sub_metering_3,
     col="blue",ylim=range(data_3$Sub_metering_1),
     type="s",xlab=" ", ylab=" ")
legend("topright",lty=c(1,1),col=c("black","orangered","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()