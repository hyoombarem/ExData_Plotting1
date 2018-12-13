### Plot 2 ###

## reading data
setwd("D:/englishLocal/data_coursera/exdata%2Fdata%2Fhousehold_power_consumption/")

household <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

## reset date
example_date <- as.Date(household$Date, "%d/%m/%Y")
household$Date <- example_date

## select the days
two_days <- household[(household$Date == "2007-02-01" | household$Date == "2007-02-02"), ]

## reset time
example_time <- strptime(two_days$Time, format = "%X")
two_days$Time <- example_time

## reset variable : ? to NA
reset_to_NA <- function(a_vec){
    new_vec <- as.numeric(levels(a_vec)[a_vec])
    return(new_vec)
}

for(i in 3:8){
    two_days[, i] <- reset_to_NA(two_days[, i])
}

## make plot and save it

png("plot2.png", height = 480, width = 480)
plot(1:nrow(two_days), two_days$Global_active_power , type = "l", ylab = "Global Active Power (kilowatts)", xlab = "", xaxt = "n")
axis(side = 1, at = c(1, 1440, 2880), labels = c("Thu", "Fri", "Sat"))
dev.off()
