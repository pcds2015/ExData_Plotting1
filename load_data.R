load_data <- function() {
  DF <- fread("household_power_consumption.txt", data.table=FALSE, na.strings = "?")
  DF$Date <- as.Date(DF$Date, "%d/%m/%Y")
  
  DF2 <- subset(DF, Date==as.Date("2007-02-01")| Date==as.Date("2007-02-02") )
  DF2$Global_active_power <- as.double(DF2$Global_active_power)
  
  return(DF2)
}

plot1 <- function(DF) {
  hist(DF$Global_active_power, col="red", main="Global Active Power", 
       xlab="Global Active Power (kilowatts)", ylab="Frequency")
}

plot2 <- function(values, ylabel) {
  plot(values, type="n", main="", xlab="", 
                ylab=ylabel, xaxt='n')
  axis(1, at = c(1, length(values)/2, 
                          length(values)), 
                labels=c("Thu", "Fri", "Sat"))
  lines(values)
}

plot3 <- function(DF) {
  with(DF, plot(Sub_metering_1, type="n", main="", xlab="", 
                ylab="Energy sub metering", xaxt='n'))
  with(DF, axis(1, at = c(1, length(Sub_metering_1)/2, 
                          length(Sub_metering_1)), 
                labels=c("Thu", "Fri", "Sat")))
  with(DF, lines(Sub_metering_1))
  with(DF, lines(Sub_metering_2, col="red"))
  with(DF, lines(Sub_metering_3, col="blue"))
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
         col=c("black", "red", "blue"), lty=1)
  
}

plot4 <- function(DF) {
  par(mfrow=c(2,2))
  plot2(DF$Global_active_power, "Global Active Power (kilowatts)")
  plot2(DF$Voltage, "Voltage")
  plot3(DF)
  plot2(DF$Global_reactive_power, "Global_reactive_power")
}