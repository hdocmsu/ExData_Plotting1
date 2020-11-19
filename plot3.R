# script plot3.R that import data and plot plot1.png

# file names
fname = "plot3.R"
pname = "plot3.png"
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

# get weekdays for x-label
d1 <- weekdays(as.Date(df1$Date[1], format = "%d/%m/%Y"))
d2 <- weekdays(as.Date(df1$Date[length(df1$Date)],format = "%d/%m/%Y"))
d3 <- weekdays(as.Date(df1$Date[length(df1$Date)],format = "%d/%m/%Y")+1)

# plot and export to png
png(filename=pname, width = psize, height = psize, units = "px")

plot(as.numeric(df1$Sub_metering_1), 
     type="l",
     xaxt="none", xlab = "",
     ylab = "Energy sub metering")

lines(as.numeric(df1$Sub_metering_2), col="red", 
     type="l",
     xaxt="none", xlab = "",
     ylab = "Energy sub metering")

lines(as.numeric(df1$Sub_metering_3), col="blue",
     type="l",
     xaxt="none", xlab = "",
     ylab = "Energy sub metering")

axis(1, c(1, length(df1$Date)/2, length(df1$Date)), c(d1, d2, d3))

legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),
       lty=c(1,1,1), ncol=1, cex = 1.0)

dev.off()
