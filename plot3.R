data <- read.csv ("household_power_consumption.txt", sep=";",na.strings=c("?"))
data$DateTime<-strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
## join both columns (date and time) in a new variable
data$Date<- as.Date(data$Date, format="%d/%m/%Y") # change format date
subdata<- subset (data, Date == as.Date("2007-02-01") | Date== as.Date("2007-02-02")) # subset
# the data from date 01/02/2007 to 01/02/2007
png("plot3.png",width=480, height=480)

plot (subdata$DateTime, 
      subdata$Sub_metering_1, 
      type="l",   
      xlab="",  
      ylab="Energy Sub metering")

lines(subdata$DateTime, subdata$Sub_metering_2, col = "red")
lines(subdata$DateTime, subdata$Sub_metering_3, col = "blue")
legend("topright", lty=1, col= c("black","blue","red"),
       legend =c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


dev.off ()
