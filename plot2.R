# Exploratory Data Analysis
# Project 2

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Question 2: Have total emissions from PM2.5 decreased in the Baltimore City,
# Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system to make
# a plot answering this question.

Baltimore <- NEI[NEI$fips == "24510", ]
total_pm <- tapply(Baltimore$Emissions, Baltimore$year, sum)
plot(names(total_pm), total_pm, main = "Total pm 2.5 Emissions in Baltimore",
     xlab = "Year", ylab = "total PM 2.5")
dev.copy(png, file = "plot2.png")
dev.off()
