library("dplyr", lib.loc="~/R/win-library/3.2")
hhpc<-read.table("./household_power_consumption.txt",header = TRUE,
sep = ";", na.strings = "?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

conv<-as.Date(hhpc$Date, "%d/%m/%Y")
hhpc[,1]<-conv
set <-filter(hhpc, Date == "2007-02-01" | Date == "2007-02-02")
hist(set$Global_active_power, col = "red", main = "Global Active Power",
xlab = "Global Active Power (kilowatts)", yaxs = "i")
dev.copy(png,file= "plot1.png")
dev.off()
