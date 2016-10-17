
cat("\014")  
rm(list=ls())
in_dir<-'C://datascience//Exploratory_Data_Analysis//week4//exdata%2Fdata%2FNEI_data'
setwd(in_dir)

###Read Data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##find cases where keyword vehicle is found###

SCC_vehicle = SCC[grepl("vehicle", SCC$EI.Sector, ignore.case=TRUE),]

###merge the two data frames####
merged <- merge(x=NEI, y=SCC_vehicle, by='SCC')

NEI_baltimore <- subset(merged,fips=="24510")


###sum of emissions by year#####

merged_sum <- aggregate(Emissions ~ year,NEI_baltimore, sum)




png("plot5.png",width=600,height=480)
###generte bar plot#####
barplot(
  (merged_sum$Emissions),
  names.arg=merged_sum$year,
  xlab="Year",
  ylab="PM2.5 Emissions ",
  main="Total Vehicle Source Emissions in Baltimore vs Year"
)


dev.off()

# Decreasing trend vs year ######

