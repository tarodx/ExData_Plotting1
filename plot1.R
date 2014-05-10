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

## Generate first plot --> Global Active Power (= equals column "V3" in the dataset)

## Plot the histogram for the third column of the dataset in red color and save it to a PNG file
png_file <- "plot1.PNG"
png(filename= png_file, width=480, height=480, units="px")

hist(as.numeric(as.character(epc_filter[, "V3"])), 
     col="red", 
     xlab="Global Active Power (Kilowatts)", 
     main = "Global Active Power")

dev.off()