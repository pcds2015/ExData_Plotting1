source("load_data.R")

DF <- load_data()
png("plot2.png", width=480, heigh=480)
plot2(DF$Global_active_power, "Global Active Power (kilowatts)")
dev.off()
