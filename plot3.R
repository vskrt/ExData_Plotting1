power = read.csv("household_power_consumption.txt", header=T,
                 sep=";", stringsAsFactors=F, na.strings="?",
                 colClasses=c("character", "character", "numeric",
                 "numeric", "numeric", "numeric",
                 "numeric", "numeric", "numeric"))

power$timest = strptime(paste(power$Date, power$Time), format="%d/%m/%Y %H:%M:%S", tz="UTC")

startDate = strptime("01/02/2007 00:00:00", format="%d/%m/%Y %H:%M:%S", tz="UTC")
endDate = strptime("02/02/2007 23:59:59", format="%d/%m/%Y %H:%M:%S", tz="UTC")
power = power[power$timest >= startDate & power$timest <= endDate, ]

png(filename="plot3.png", width=480, height=480)
plot(power$timest, power$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(power$timest, power$Sub_metering_2, col="red")
lines(power$timest, power$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lwd=par("lwd"))

dev.off()

