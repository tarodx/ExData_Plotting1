## You have to load the script in the same directory as is located the file with the data
## This code reads the "Electric power consumption" file and loads the data 
## for the "2007-02-01" and "2007-02-02" days

## Set the filename
file <- "household_power_consumption.txt"

## Read the table
epc <- read.table(file, sep = ";")

## Get the subset for the specific dates
epc_filter <- epc[as.Date(epc$V1, "%d/%m/%Y") == "2007-02-01" | as.Date(epc$V1, "%d/%m/%Y") == "2007-02-02",]
epc_filter <- epc_filter[!is.na(epc_filter[,"V1"]),] ## Delete NA´s values

## Create the full_date variable
epc_filter$full_date <- strptime(paste(epc_filter$V1, epc_filter$V2), "%d/%m/%Y %H:%M:%S")

## Cast the V7-V9 variables to numeric
epc_filter$V7 <- as.numeric(as.character(epc_filter$V7))
epc_filter$V8 <- as.numeric(as.character(epc_filter$V8))
epc_filter$V9 <- as.numeric(as.character(epc_filter$V9))

## Generate third plot and save it as PNG file
png_file <- "plot3.PNG"
png(filename= png_file, width=480, height=480, units="px")

## Plot the first variable (v7)
plot(epc_filter$full_date, epc_filter$V7, col="black", type="l", ylab="Energy sub metering", xlab="")

## Plot the second variable (v8)
points(epc_filter$full_date, epc_filter$V8, col="red", type="l")

## Plot the third variable (v9)
points(epc_filter$full_date, epc_filter$V9, col="blue", type="l")

## Add legend to the plot
legend("topright", 
        lty = "solid",
        col= c("black", "red", "blue"),
        legend = c("sub_metering_1", "sub_metering_2", "sub_metering_3"))

dev.off()