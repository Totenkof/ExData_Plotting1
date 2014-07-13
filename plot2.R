data <- read.csv ("household_power_consumption.txt", sep=";",na.strings=c("?"))
data$DateTime<-strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
## join both columns (date and time) in a new variable
data$Date<- as.Date(data$Date, format="%d/%m/%Y") # change format date
subdata<- subset (data, Date == as.Date("2007-02-01") | Date== as.Date("2007-02-02")) # subset
# the data from date 01/02/2007 to 01/02/2007
plot (subdata$DateTime, subdata$Global_active_power, 
      type="l",   
      xlab="",  
      ylab="Global Active Power (Kilowatts)")
dev.copy(png, file = "plot2.png")
dev.off ()
