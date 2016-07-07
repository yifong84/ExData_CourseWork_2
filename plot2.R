rm(list=ls())
setwd("D:/Data Science Course/04 - Exploratory Data/Week 4/Assignment")
NEI <- readRDS("Data/summarySCC_PM25.rds")
SCC <- readRDS("Data/Source_Classification_Code.rds")



ML<- subset(NEI,fips=='24510')

png(filename = 'plot2.png')

barplot(tapply(X=ML$Emissions,INDEX = ML$year,FUN = sum), 
        main='Total Emission in Baltimore City, Maryland', 
        xlab = 'Year',ylab = 'PM2.5')
