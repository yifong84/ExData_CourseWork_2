rm(list=ls())

library(ggplot2)
setwd("D:/Data Science Course/04 - Exploratory Data/Week 4/Assignment")
NEI <- readRDS("Data/summarySCC_PM25.rds")
SCC <- readRDS("Data/Source_Classification_Code.rds")

NEI$year <- factor(NEI$year, levels=c('1999', '2002', '2005', '2008'))

ML.Onroad<- subset(NEI,fips=='24510'&type=='ON-ROAD')

ML.OnroadSum <- aggregate(ML.Onroad[,'Emissions'],by=list(ML.Onroad$year),sum)
colnames(ML.OnroadSum)<-c('Year','Emissions')

png(filename = 'plot5.png')

ggplot(data=ML.OnroadSum,aes(x=Year,y=Emissions))+geom_bar(aes(fill=Year),stat = 'identity') + guides(fill=F) + ggtitle('Total Emission of Motor Vehicle Sources in Baltimore City, Maryland')+ylab('PM 2.5')+xlab('Year') + theme(legend.position='none')+geom_text(aes(label=round(Emissions,0),size=1,hjust=0.5,vjust=2))

dev.off()