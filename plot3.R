
cat("\014")  
rm(list=ls())
in_dir<-'C://datascience//Exploratory_Data_Analysis//week4//exdata%2Fdata%2FNEI_data'
setwd(in_dir)

###read data###
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##subset Baltimore city data###
NEI_baltimore <- subset(NEI,fips=="24510")


png("plot3.png",width=600,height=480)

##plot vs year by type###
library("ggplot2")
 ggplot(baltimoreNEI,aes(factor(year),Emissions,fill=type)) +
  geom_bar(stat="identity") +
  
  facet_grid(.~type) + 
  labs(x="year", y="Total Emission ",title=" Emissions for Baltimore City vs Year by Type")
       +guides(fill=FALSE)


dev.off()

# Decreasing trend vs year for all types except POINT##########

