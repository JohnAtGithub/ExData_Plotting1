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

# start to plot 4 and annotate
data_4=cc
data_4$datetime=strptime(paste(data_4$Date,data_4$Time),
                         "%Y-%m-%d %H:%M:%S")
png("plot4.png",width=480,height=480)
par(mfrow=c(2,2))
with(data_4, {
    plot(datetime,Global_active_power,
         type="l",xlab=" ", ylab="Global Active Power")
    plot(datetime,Voltage,
         type="l",xlab="datetime", ylab="Voltage")
{plot(data_3$datetime,data_3$Sub_metering_1,
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
        legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))}
plot(datetime,Global_reactive_power,
     type="l",xlab="datetime", ylab="Voltage")
})

dev.off()