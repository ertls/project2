# Exploratory Data Analysis
# Project 2

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
library(ggplot2)

# Question 3: Of the four types of sources indicated by the type (point, nonpoint,
# onroad, nonroad) variable, which of these four sources have seen decreases in
# emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions
# from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.

Baltimore <- NEI[NEI$fips == "24510", ]
total_pm <- tapply(Baltimore$Emissions, list(Baltimore$year, Baltimore$type), sum)
qplot(names(total_pm[,1]), total_pm[,1])
dev.copy(png, file = "plot3.png")
dev.off()

