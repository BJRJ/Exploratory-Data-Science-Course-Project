
cat("\014")  
rm(list=ls())
in_dir<-'C://datascience//Exploratory_Data_Analysis//week4//exdata%2Fdata%2FNEI_data'
setwd(in_dir)

##read files###
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

###find sum####
TotalEmission <- aggregate(Emissions ~ year,NEI, sum)

###open png file####
png("plot1.png",width=480,height=480)

barplot(
  (TotalEmission$Emissions),
  names.arg=aggTotals$year,
  xlab="Year",
  ylab="PM2.5 Emissions ",
  main="Aggregate PM2.5 Emissions vs Year"
)

dev.off()

# Total emission has actually decreased##########

