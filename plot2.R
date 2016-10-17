
cat("\014")  
rm(list=ls())
in_dir<-'C://datascience//Exploratory_Data_Analysis//week4//exdata%2Fdata%2FNEI_data'
setwd(in_dir)

##read file###
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##subset Baltimore City data###
NEI_baltimore <- subset(NEI,fips=="24510")


##find sum###
TotalEmission <- aggregate(Emissions ~ year,NEI_baltimore, sum)

png("plot2.png",width=480,height=480)

barplot(
  (TotalEmission$Emissions),
  names.arg=aggTotals$year,
  xlab="Year",
  ylab="PM2.5 Emissions ",
  main="Aggregate PM2.5 Emissions for Baltimore vs Year"
)

dev.off()

# Trend is not very clear, however there appears to be a decrease in emissions from 1998 to 2008##########

