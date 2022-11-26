df <- read.csv("household_power_consumption.txt", sep=";")
df1 <- subset(df, Date=="1/2/2007" | Date=="2/2/2007")

times <- df1$Time
for(i in 1:length(times)){
  
  times[i] = paste(df1$Date[i],times[i], sep = " ")
}

df1$Date <- as.Date(df1$Date, "%d/%m/%Y")
df1$Sub_metering_1 <- as.numeric(df1$Sub_metering_1)
df1$Sub_metering_2 <- as.numeric(df1$Sub_metering_2)
df1$Global_active_power <- as.numeric(df1$Global_active_power)
df1$Global_reactive_power <- as.numeric(df1$Global_reactive_power)
df1$Voltage <- as.numeric(df1$Voltage)
df1$Global_intensity <- as.numeric(df1$Global_intensity)
df1$Time <- as.POSIXct(times, format  = "%d/%m/%Y %H:%M:%OS")

png("plot4.png", width=480, height=480)

par(mfrow = c(2,2))

plot(df1$Time, df1$Global_active_power, type="l", xlab="", ylab="Global Active Power")

plot(df1$Time, df1$Voltage, type = "l", ylab = "Voltage", xlab= "datetime")

plot(df1$Time, df1$Sub_metering_1, type="l", ylab = "Energy Submetering", xlab="")
lines(df1$Time, df1$Sub_metering_2, type="l", col= "red")
lines(df1$Time, df1$Sub_metering_3, type="l", col= "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(df1$Time, df1$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab = "datetime")

dev.off()

