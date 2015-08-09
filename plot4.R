source("load_data.R")

DF <- load_data()
png("plot4.png", width=480, heigh=480)
plot4(DF)
dev.off()
