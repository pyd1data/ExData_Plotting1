#We suppose here that the dataset household_power_consumption.txt is in the working directory
#The data contains some ? string we convert to NaN, and the separator is ";" in the file.
consumption<- read.csv("household_power_consumption.txt", sep=";", header=TRUE,stringsAsFactors=FALSE,na.strings="?")
#we are just interested in the very begining of february
index_february=which((consumption["Date"]=="1/2/2007")|(consumption["Date"]=="2/2/2007"))
#restrited lines
restricted_consumption=consumption[index_february,]
#plotting
png("plot1.png",width=480,height=480)
hist(restricted_consumption$Global_active_power,xlab="Global Active Power (kilowatts)", main="Global Active Power",c="red")
#saving
dev.off()
