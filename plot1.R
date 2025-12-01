
df <- read.delim("household_power_consumption.txt", sep = ";")

df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
df$Global_active_power <- as.numeric(df$Global_active_power)

filtered_df <- subset(df, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))


png("plot1.png", width = 480, height = 480)

hist(filtered_df$Global_active_power, 
     col = "red",
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")

dev.off()