rm(list=ls())
setwd("D:/Data Science Course/04 - Exploratory Data/Week 4/Assignment")
NEI <- readRDS("Data/summarySCC_PM25.rds")
SCC <- readRDS("Data/Source_Classification_Code.rds")



EMISSIONS <- aggregate(NEI[,'Emissions'],by=list(NEI$year),FUN=sum)
EMISSIONS$PM <- round(EMISSIONS[,2]/1000,2)

barplot(EMISSIONS$PM,names.arg = EMISSIONS$Group.1,main='Total Emission of PM2.5',xlab='Year',ylab = 'PM in Kilotons')

dev.off()