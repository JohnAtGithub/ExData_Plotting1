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

# start to plot 2 and annotate
data_2=cc
data_2$datetime=strptime(paste(data_2$Date,data_2$Time),
                         "%Y-%m-%d %H:%M:%S")
plot(data_2$datetime,data_2$Global_active_power,
     type="l",xlab=" ", ylab="Global Active Power (kilowatts)")
dev.copy(png,width=480,height=480,filename="plot2.png")
dev.off()
