
cat("\014")  
rm(list=ls())
in_dir<-'C://datascience//Exploratory_Data_Analysis//week4//exdata%2Fdata%2FNEI_data'
setwd(in_dir)

###Read Data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##find cases where keyword coal is found###
SCC_coal = SCC[grepl("coal", SCC$Short.Name, ignore.case=TRUE),]

###merge the two data frames####
merged <- merge(x=NEI, y=SCC_coal, by='SCC')


###sum of emissions by year#####

merged_sum <- aggregate(Emissions ~ year,merged, sum)




png("plot4.png",width=600,height=480)
###generte bar plot#####
barplot(
  (merged_sum$Emissions),
  names.arg=merged_sum$year,
  xlab="Year",
  ylab="PM2.5 Emissions ",
  main="Total Emissions From Coal Source Across United States vs Year"
)


dev.off()

# Decreasing trend vs year for all types except POINT##########

