df <- read.delim("household_power_consumption.txt", sep = ";")

df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
df$Global_active_power <- as.numeric(df$Global_active_power)

filtered_df <- subset(df, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

datetime <- paste(filtered_df$Date, filtered_df$Time)
filtered_df$datetime <- as.POSIXct(datetime)
filtered_df$weekday <- format(filtered_df$datetime, format = "%a")

png("plot2.png", width = 480, height = 480)

plot(filtered_df$datetime, 
     filtered_df$Global_active_power, 
     type = "l", 
     col = "black",
     xlab = "",
     ylab = "Global Active Power (kilowatts)",
     main = "", 
     xaxt = "n")

ticks <- as.POSIXct(c("2007-02-01", "2007-02-02", "2007-02-03"))
axis(1, at = ticks, labels = format(ticks, "%a"))

dev.off()