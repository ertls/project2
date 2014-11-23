# Exploratory Data Analysis
# Project 2

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Question 1: Have total emissions from PM2.5 decreased in the United States from
# 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5
# emission from all sources for each of the years 1999, 2002, 2005, and 2008.

total_pm <- tapply(NEI$Emissions, NEI$year, sum)
plot(names(total_pm), total_pm, xlab = "Year", ylab = "total PM 2.5")
dev.copy(png, file = "plot1.png")
dev.off()
