rm(list=ls())

library(ggplot2)
require(gridExtra)
setwd("D:/Data Science Course/04 - Exploratory Data/Week 4/Assignment")
NEI <- readRDS("Data/summarySCC_PM25.rds")
SCC <- readRDS("Data/Source_Classification_Code.rds")

NEI$year <- factor(NEI$year, levels=c('1999', '2002', '2005', '2008'))

ML.Onroad<- subset(NEI,fips=='24510'&type=='ON-ROAD')
LA.Onroad<- subset(NEI,fips=='06037'&type=='ON-ROAD')

ML.OnroadSum <- aggregate(ML.Onroad[,'Emissions'],by=list(ML.Onroad$year),sum)
colnames(ML.OnroadSum)<-c('Year','Emissions')
ML.OnroadSum$City<-paste(rep('MD', 4))

LA.OnroadSum <- aggregate(LA.Onroad[,'Emissions'],by=list(LA.Onroad$year),sum)
colnames(LA.OnroadSum)<-c('Year','Emissions')
LA.OnroadSum$City<-paste(rep('CA', 4))

plot1<-ggplot(data=ML.OnroadSum,aes(x=Year,y=Emissions))+geom_bar(aes(fill=Year),stat = 'identity')+ coord_cartesian(ylim = c(0, 5000)) + guides(fill=F) + ggtitle('Baltimore City, Maryland')+ylab('PM 2.5')+xlab('Year') + theme(legend.position='none')+geom_text(aes(label=round(Emissions,0),size=1,hjust=0.5,vjust=2))
plot2<-ggplot(data=LA.OnroadSum,aes(x=Year,y=Emissions))+geom_bar(aes(fill=Year),stat = 'identity')+ coord_cartesian(ylim = c(0, 5000))+ guides(fill=F) + ggtitle('Los Angeles, California')+ylab('PM 2.5')+xlab('Year') + theme(legend.position='none')+geom_text(aes(label=round(Emissions,0),size=1,hjust=0.5,vjust=2))

png(filename = 'plot6.png',width=800, height=500, units='px')

grid.arrange(plot1,plot2,ncol=2)

dev.off()