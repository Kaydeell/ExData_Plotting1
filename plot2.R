#set the working directory, download the dataset and unzip it
setwd("C:/Users/Kari/Documents")

file <- "hpc.zip"
if (!file.exists(file)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(fileURL, file, mode = "wb")
}  
if (!file.exists("Household Power Consumption Dataset")) { 
  unzip(file) 
}

#Read data
hpcdata <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", 
                      stringsAsFactors = FALSE )
#Subset the dates 2007/02/01 and 2007/02/02
subsethpcdata <- hpcdata[hpcdata$Date %in% c("1/2/2007","2/2/2007") ,]
#Set dates language to english
Sys.setlocale("LC_TIME", "C")

#Change time class
datehpcdata <- strptime(paste(subsethpcdata$Date, subsethpcdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#plot and make png file
png(file = "plot2.png", width = 480, height = 480, units = "px")

#make plot
globalActivePower <- subsethpcdata$Global_active_power
plot(datehpcdata, globalActivePower, type = "l", pch = ".", xlab = "", ylab = "Global Active Power (kilowatts)")

#Close graphics device
dev.off()