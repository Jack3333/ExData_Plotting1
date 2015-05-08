library("dplyr", lib.loc="~/R/win-library/3.2")
hhpc<-read.table("./household_power_consumption.txt",header = TRUE,
                 sep = ";", na.strings = "?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

conv<-as.Date(hhpc$Date, "%d/%m/%Y")
hhpc[,1]<-conv
set <-filter(hhpc, Date == "2007-02-01" | Date == "2007-02-02")
ntim<-paste(set$Date,set$Time, sep = " ")
ntimb<-strptime(ntim, "%Y-%m-%d %H:%M:%S" )
newset<-cbind(set,ntimb)
png(file = "plot3.png")
plot(newset$ntimb,newset$Sub_metering_1, type = "l",col ="black", xlab="", ylab = "Energy sub metering")
lines(newset$ntimb, newset$Sub_metering_2, type = "l", col = "red")
lines(newset$ntimb, newset$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3" ), lty = c(1, 1, 1), lwd = c(1, 1, 1), col = c("black", "red", "blue"))
dev.off()