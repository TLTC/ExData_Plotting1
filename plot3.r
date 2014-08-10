plot3 <- function (directory){
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
    png(filename="plot3.png",width=480,height=480)
    
    ##Generate the graph
    
    plot(data$Time, data$Sub_metering_2, xlab="", 
        ylab="Energy sub metering",col="red", type = "l")
    lines(data$Time, data$Sub_metering_1)
    lines(data$Time, data$Sub_metering_3,col="blue")
    
    legend("topright",pch=2,col=c("black","red","blue"),legend=c("Sub_metering_1",
        "Sub_metering_2","Sub_metering_3"))
    
    dev.off() ##Close the png file device
}