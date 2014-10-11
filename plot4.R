#Read Household_power data, create graphs
household_power <- read.table("household_power_consumption 2.txt", header = TRUE, sep=";")
household_power$Date2 <- as.Date(household_power$Date,format = "%d/%m/%Y")
# Verify that the new Date2 column is in date format
str(household_power)
#Select 2 specific dates - 2/1/07-2/2/07
housepower<-household_power[household_power$Date2 >= "2007-02-01" & household_power$Date2 <= "2007-02-02",]
#Make Global_active_power and Global_reactive_power in numeric format
housepower$Global_active_power<-as.numeric(as.character(housepower$Global_active_power))
housepower$Global_reactive_power <- as.numeric(as.character(housepower$Global_reactive_power))
#Combine date and time, and convert to date/time
housepower$datetime <- paste(housepower$Date2, housepower$Time)
housepower$datetime <- strptime(housepower$datetime, format = "%Y-%m-%d %H:%M:%S")
#Create 4 plots of various things
png(filename="plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot(housepower$datetime, housepower$Global_active_power, ylab = "Global Access Power (kilowatts)", xlab="", type="l")
plot(housepower$datetime, housepower$Voltage, ylab = "Voltage", xlab="datetime",type="l")
with(housepower, plot(datetime, Sub_metering_1, type="l", col="black", 
                      ylab = "Energy sub-metering", xlab=""))
with(housepower, lines(datetime, Sub_metering_2, col="red"))
with(housepower, lines(datetime, Sub_metering_3, col="blue"))
legend("topright", pch="-", col=c("black", "red", "blue"), legend=c("sub-metering 1", "sub-metering 2", "sub-metering 3"))
with(housepower,plot(datetime, Global_reactive_power, type="l"))
dev.off()