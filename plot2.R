archivo <- read.table("household_power_consumption.txt", skip = 1, sep = ";")

names(archivo) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

subdata <- subset(archivo, archivo$Date=="1/2/2007" | archivo$Date=="2/2/2007")


png("plot2.png")

subdata$Date <- as.Date(subdata$Date, format = "%d/%m/%Y")
subdata$Time <- strptime(subdata$Time, format = "%H:%M:%S")
subdata[1:1440, "Time"] <- format(subdata[1:1440, "Time"], "2007-02-01 %H:%M:%S")
subdata[1441:2880, "Time"] <- format(subdata[1441:2880, "Time"], "2007-02-02 %H:%M:%S")

plot(subdata$Time, as.numeric(as.character(subdata$Global_active_power)), type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()