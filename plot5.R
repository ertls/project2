# Exploratory Data Analysis
# Project 2

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Question 4: How have emissions from motor vehicle sources changed from
# 1999–2008 in Baltimore City?

NEI <- NEI[NEI$fips == "24510", ]
SCC_motor <- SCC[grep("Motor", SCC$Short.Name),]
NEI_motor <- merge(SCC_motor, NEI, by = "SCC")

total_pm <- tapply(NEI_motor$Emissions, NEI_motor$year, sum)
plot(names(total_pm), total_pm, main = "Motor related Emissions per year",
     xlab = "Year", ylab = "total PM 2.5")
dev.copy(png, file = "plot5.png")
dev.off()

