# Exploratory Data Analysis
# Project 2

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Question 4: Across the United States, how have emissions from coal
# combustion-related sources changed from 1999–2008?

SCC_coal <- SCC[grep("Coal", SCC$Short.Name),]
NEI_coal <- merge(SCC_coal, NEI, by = "SCC")

total_pm <- tapply(NEI_coal$Emissions, NEI_coal$year, sum)
plot(names(total_pm), total_pm, main = "Coal related Emissions per year",
     xlab = "Year", ylab = "total PM 2.5")
dev.copy(png, file = "plot4.png")
dev.off()
