#setwd("/Users/genevieve/ElectricConsumption/")
#We suppose here that the dataset household_power_consumption.txt is in the working directory
#The data contains some ? string we convert to NaN, and the separator is ";" in the file.
consumption<- read.csv("household_power_consumption.txt", sep=";", header=TRUE,stringsAsFactors=FALSE,na.strings="?")
#we are just interested in the very begining of february
index_february=which((consumption["Date"]=="1/2/2007")|(consumption["Date"]=="2/2/2007"))
#restrited lines
restricted_consumption=consumption[index_february,]
restricted_consumption$DateTime <- strptime(paste(restricted_consumption$Date,restricted_consumption$Time),"%d/%m/%Y %H:%M:%S")
#plotting, date system is in french in my local environment, the week days are lundi, mardi, mercredi, jeudi, vendredi
#prepare plotting
png("plot4.png",width=480,height=480)
#subdivision for four subplots
par(mfcol=c(2,2))
# plot first quadrant
plot(restricted_consumption$DateTime,restricted_consumption$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=NA)
# plot second quadrant
plot(restricted_consumption$DateTime, restricted_consumption$Sub_metering_1,type="l",ylab="Energy sub metering",xlab=NA,col="black")
lines(restricted_consumption$DateTime, restricted_consumption$Sub_metering_2, col="red")
lines(restricted_consumption$DateTime, restricted_consumption$Sub_metering_3, col="blue")
legend("topright", lty=1, bty="n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
# plot third quadrant
plot(restricted_consumption$DateTime, restricted_consumption$Voltage, type="l", xlab="datetime", ylab="Voltage")
# plot fourth quadrant
plot (restricted_consumption$DateTime, restricted_consumption$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
