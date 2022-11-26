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

png("plot2.png", width=480, height=480)
plot(df1$Time, df1$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

