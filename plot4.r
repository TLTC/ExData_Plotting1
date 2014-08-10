plot4 <- function (directory){
    ##User inputs the directory in which the unzipped file is under
    setwd(directory)
    file<-file("./household_power_consumption.txt")
    
    ##Load the full set of data, use "?" as NA per the guideline
    full<-read.table(file,header=TRUE,sep=";",na.strings="?")
    
    ##Subset the two required dates
    data<-full[full$Date %in% c("1/2/2007","2/2/2007"),]
    
    ##Convert the factor string Date into date format
    data$Date=as.Date(data$Date,format="%e/%m/%Y")
    
    ##Convert the factor string Time into POSXITct format
    data$Time<-as.POSIXct(paste(data$Date,data$Time), "%Y-%M-%D %H:%M:%S")
    
    ##Set up the graphic device png
    png(filename="plot4.png",width=480,height=480)
    
    ##Set up the grid as two rows and two columns
    par(mfrow=c(2,2))
    
    with(data,{
        plot(data$Time, data$Global_active_power, xlab="", 
             ylab="Global Active Power(kilowatts)", type = "l")
        plot(data$Time, data$Voltage, xlab="datetime", 
             ylab="Voltage", type = "l")
        plot(data$Time, data$Sub_metering_1, xlab="", 
             ylab="Energy sub metering",col="blue", type = "l")
        plot(data$Time, data$Global_reactive_power, xlab="datetime", 
             ylab="Global_reactive_power", type = "l")
    })
    
    

    
    dev.off() ##Close the png file device
}