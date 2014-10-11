#Read Household_power data, create graphs
household_power <- read.table("household_power_consumption 2.txt", header = TRUE, sep=";")
household_power$Date2 <- as.Date(household_power$Date,format = "%d/%m/%Y")
# Verify that the new Date2 column is in date format
str(household_power)
#Select 2 specific dates - 2/1/07-2/2/07
housepower<-household_power[household_power$Date2 >= "2007-02-01" & household_power$Date2 <= "2007-02-02",]
housepower$Global_active_power<-as.numeric(as.character(housepower$Global_active_power))
#Create the histogram...
hist(housepower$Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png", width=480, height=480)
dev.off()
