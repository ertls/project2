# Project 2

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Question 5: Compare emissions from motor vehicle sources in Baltimore City with
# emissions from motor vehicle sources in Los Angeles County, California
# (fips == "06037"). Which city has seen greater changes over time in motor vehicle
# emissions?

NEI_Baltimore <- NEI[NEI$fips == "24510", ]
NEI_LA <- NEI[NEI$fips == "06037", ]
SCC_motor <- SCC[grep("Motor", SCC$Short.Name),]
NEI_motor_B <- merge(SCC_motor, NEI_Baltimore, by = "SCC")
NEI_motor_LA <- merge(SCC_motor, NEI_LA, by = "SCC")

total_pm_B <- tapply(NEI_motor_B$Emissions, NEI_motor_B$year, sum)
total_pm_LA <- tapply(NEI_motor_LA$Emissions, NEI_motor_LA$year, sum)

plot(names(total_pm_LA), total_pm_LA, main = "Motor related Emissions per year",
     xlab = "Year", ylab = "total PM 2.5")
par(usr = c(1999, 2008, 0, 90), yaxp = c(0, 90, 1))
points(total_pm_B, col = "red")
dev.copy(png, file = "plot6.png")
dev.off()
