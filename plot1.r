plot1<-function (directory){
    ##User inputs the directory in which the unzipped file is under
    setwd(directory)
    file<-file("./household_power_consumption.txt")
    
    ##Load the full set of data, use "?" as NA per the guideline
    full<-read.table(file,header=TRUE,sep=";",na.strings="?")
    
    ##Subset the two required dates
    data<-full[full$Date %in% c("1/2/2007","2/2/2007"),]
    
    ##Convert the factor string Date into date format
    data$Date=as.Date(data$Date,format="%e/%m/%Y")
    
    ##Convert the factor string Time into POSXITlt format
    data$Time=strptime(data$Time,format="%H:%M:%S")
    
    ##Set up the graphic device png
    png(filename="plot1.png",width=480,height=480)
    
    ##Generate the histogram 
    hist(data$Global_active_power,col="red",main="Global Active Power",
         xlab="Global Active Power (kilowatts)")
    
    dev.off() ##Close the png file device
    
}