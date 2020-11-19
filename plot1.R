# script plot1.R that import data and plot plot1.png

# file names
fname = "plot1.R"
pname = "plot1.png"
psize <- 480

# import data
dname <- "data/household_power_consumption.txt"
df <- read.table(dname, 
               sep=";", 
               col.names=c("Date", 
                           "Time",
                           "Global_active_power",
                           "Global_reactive_power",
                           "Voltage",
                           "Global_intensity",
                           "Sub_metering_1",
                           "Sub_metering_2",
                           "Sub_metering_3"), 
               fill=FALSE, 
               strip.white=TRUE)

# select the data from 2007-02-01 and 2007-02-02
df1 <- df[(df$Date=="1/2/2007" | df$Date=="2/2/2007"),]


# plot and export to png
png(filename=pname, width = 480, height = 480, units = "px")

hist(as.numeric(df1$Global_active_power), col='red',
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")

dev.off()
