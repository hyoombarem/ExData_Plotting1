### Plot 1 ###

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

png("plot1.png", height = 480, width = 480)
hist(two_days$Global_active_power, col = "red", xlim = c(0, 6), xlab = "Global Actice Power (killowatts)", main = "Global Active Power", xaxt = "n")
axis(side = 1, at = c(0, 2, 4, 6))
dev.off()
