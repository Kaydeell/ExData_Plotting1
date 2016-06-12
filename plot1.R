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

#Read the data
hpcdata <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", 
                      stringsAsFactors = FALSE )

#Subset the dates 2007/02/01 and 2007/02/02
subsethpcdata <- hpcdata[hpcdata$Date %in% c("1/2/2007","2/2/2007") ,]
#Set dates language to english
Sys.setlocale("LC_TIME", "C")

#Open png graphics device
png(file = "plot1.png", width = 480, height = 480, units = "px")

#plot
globalActivePower <- subsethpcdata$Global_active_power
hist(globalActivePower, col = "red", xlab="Global Active Power (kilowatts)", 
     ylab = "Frequency", main = "Global Active Power")

#Close graphics device
dev.off()