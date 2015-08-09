source("load_data.R")

DF <- load_data()
png("plot3.png", width=480, heigh=480)
plot3(DF)
dev.off()
