df <- read.delim("household_power_consumption.txt", sep = ";")

df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
df$Global_active_power <- as.numeric(df$Global_active_power)
df$Sub_metering_1 <- as.numeric(df$Sub_metering_1)
df$Sub_metering_2 <- as.numeric(df$Sub_metering_2)
df$Sub_metering_3 <- as.numeric(df$Sub_metering_3)

filtered_df <- subset(df, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

datetime <- paste(filtered_df$Date, filtered_df$Time)
filtered_df$datetime <- as.POSIXct(datetime)
filtered_df$weekday <- format(filtered_df$datetime, format = "%a")

png("plot3.png", width = 480, height = 480)

plot(filtered_df$datetime, filtered_df$Sub_metering_1, type = "l", xaxt = "n", col = "black", xlab = "", ylab = "Energy sub metering")
lines(filtered_df$datetime, filtered_df$Sub_metering_2, col = "red")
lines(filtered_df$datetime, filtered_df$Sub_metering_3, col = "blue")

legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("Black", "Red", "Blue"),
       lty = c(1, 1, 1))

ticks <- as.POSIXct(c("2007-02-01", "2007-02-02", "2007-02-03"))
axis(1, at = ticks, labels = format(ticks, "%a"))

dev.off()