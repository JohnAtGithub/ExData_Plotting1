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

# start to plot 1 and annotate
hist(cc$Global_active_power,
     xlab="Global Active Power (kilowatts)", 
     col="red",main="Global Active Power")
dev.copy(png,width=480,height=480,filename="plot1.png")
dev.off
