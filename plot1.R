source("load_data.R")

DF <- load_data()
png("plot1.png", width=480, heigh=480)
plot1(DF)
dev.off()
