rm(list=ls())

library(ggplot2)
setwd("D:/Data Science Course/04 - Exploratory Data/Week 4/Assignment")
NEI <- readRDS("Data/summarySCC_PM25.rds")
SCC <- readRDS("Data/Source_Classification_Code.rds")

SCC.Coat<-SCC[grepl("coal", SCC$Short.Name, ignore.case=TRUE),]

NEI$year <- factor(NEI$year, levels=c('1999', '2002', '2005', '2008'))

Coat.Merge<-merge(x=NEI,y=SCC.Coat,by='SCC')
Coat.MergeSum<- aggregate(Coat.Merge[,'Emissions'],by=list(Coat.Merge$year),sum)
colnames(Coat.MergeSum)<-c('Year','Emissions')

png(filename = 'plot4.png',width=800, height=500, units='px')

ggplot(data=Coat.MergeSum,aes(x=Year,y=Emissions/1000))+geom_line(aes(group=1, col=Emissions))+geom_point(aes(size=2, col=Emissions)) +ggtitle('Total Emissions of PM 2.5') +ylab('PM 2.5 in Kilotons') +geom_text(aes(label=round(Emissions/1000,digits=2), size=2, hjust=0.5, vjust=-0.5)) +theme(legend.position='none') + scale_colour_gradient(low='black', high='red')


dev.off()