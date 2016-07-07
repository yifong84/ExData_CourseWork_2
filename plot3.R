rm(list=ls())

library(ggplot2)
setwd("D:/Data Science Course/04 - Exploratory Data/Week 4/Assignment")
NEI <- readRDS("Data/summarySCC_PM25.rds")
SCC <- readRDS("Data/Source_Classification_Code.rds")


ML<- subset(NEI,fips=='24510')



png(filename = 'plot3.png',width=800, height=500, units='px')


ggplot(data=ML,aes(x=year,y=log(Emissions))) +facet_grid(. ~type)+guides(fill=F)+geom_boxplot(aes(fill=type))+ stat_boxplot(geom='errorbar')+ggtitle('Emissions per Type in Baltimore City, Maryland')+geom_jitter(alpha=0.1)

dev.off()