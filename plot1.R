data <- read.csv ("household_power_consumption.txt", sep=";",na.strings=c("?"))
data$Date<- as.Date(data$Date, format="%d/%m/%Y") # change format date
subdata<- subset (data, Date == as.Date("2007-02-01") | Date== as.Date("2007-02-02")) # subset
# the data from date 01/02/2007 to 01/02/2007
hist (subdata$Global_active_power, 
      col= "red",  
      xlab="Global Active Power (Kilowatts)",  
      ylab="Frequency", 
      main= "Global Active Power")
dev.copy(png, file = "plot1.png")
dev.off ()
