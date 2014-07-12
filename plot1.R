power = read.csv("household_power_consumption.txt", header=T,
                 sep=";", stringsAsFactors=F, na.strings="?",
                 colClasses=c("character", "character", "numeric",
                 "numeric", "numeric", "numeric",
                 "numeric", "numeric", "numeric"))

power$Date = as.Date(power$Date, format="%d/%m/%Y")
startDate = as.Date("01/02/2007", format="%d/%m/%Y")
endDate = as.Date("02/02/2007", format="%d/%m/%Y")
power = power[power$Date >= startDate & power$Date <= endDate, ]

png(filename="plot1.png", width=480, height=480)
hist(power$Global_active_power, main="Global Active Power",
      xlab="Global Active Power (kilowatts)", col="red")
dev.off()
