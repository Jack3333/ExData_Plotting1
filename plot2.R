library("dplyr", lib.loc="~/R/win-library/3.2")
hhpc<-read.table("./household_power_consumption.txt",header = TRUE,
                 sep = ";", na.strings = "?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

conv<-as.Date(hhpc$Date, "%d/%m/%Y")
hhpc[,1]<-conv
set <-filter(hhpc, Date == "2007-02-01" | Date == "2007-02-02")
ntim<-paste(set$Date,set$Time, sep = " ")
ntimb<-strptime(ntim, "%Y-%m-%d %H:%M:%S" )
newset<-cbind(set,ntimb)
plot(newset$ntimb,newset$Global_active_power, type = "l",xlab="", ylab = "Global Active Power (kilowatts)")
dev.copy(png,file= "plot2.png")
dev.off()



