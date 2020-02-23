household <- read.table("household_power_consumption.txt",header = TRUE, sep = ";")
household$Date <- strptime(household$Date,format = "%d/%m/%Y")
household <- subset(household , household$Date == "2007-02-01" | household$Date == "2007-02-02")
datetime <- strptime(paste(household$Date,household$Time,sep = " "), format = "%Y-%m-%d %H:%M:%S")
globalactivepower <- as.numeric(as.character(household$Global_active_power))
global_reactive_power <- as.numeric(as.character(household$Global_reactive_power))
voltage <- as.numeric(as.character(household$Voltage))

##Plotting the required graph
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0)) ## Declaring the dimension of each plot to be plotted
plot(datetime,globalactivepower,type = 'l') ##1st plot
plot(datetime,voltage,type = 'l',ylab = "Voltage") ##2nd Plot
plot(datetime,as.numeric(household$Sub_metering_1),type = "l" , ylim = c(0,40),xlab = "Time",ylab = "Energy sub metering") ## 3rd PLot
lines(datetime,as.numeric(household$Sub_metering_2),col ="red")
lines(datetime,as.numeric(as.character(household$Sub_metering_3)),col ="blue")
title(main = "Energy Sub Metering")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       +        legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(datetime,global_reactive_power,type = "l") ## 4th Plot