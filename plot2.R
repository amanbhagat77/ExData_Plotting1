household <- read.table("household_power_consumption.txt",header = TRUE, sep = ";")
household$Date <- strptime(household$Date,format = "%d/%m/%Y")
household <- subset(household , household$Date == "2007-02-01" | household$Date == "2007-02-02")
datetime <- strptime(paste(household$Date,household$Time,sep = " "), format = "%Y-%m-%d %H:%M:%S")
globalactivepower <- as.numeric(as.character(household$Global_active_power))

plot(datetime,globalactivepower,type = "l", ylab = "Global Active Power(killowatts)", xlab = "Time")
