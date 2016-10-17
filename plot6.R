
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

##subset Baltimore city data###
NEI_baltimore <- subset(merged,fips=="24510")
NEI_baltimore$city <- "Baltimore City"

##subset LA county data###
NEI_LA <- subset(merged,fips=="06037")
NEI_LA$city <- "LA County"

##combine data from both cities###
NEI_merged<-rbind(NEI_baltimore,NEI_LA)


png("plot6.png",width=600,height=480)
###generte bar plot#####
g<-ggplot(NEI_merged, aes(x=year, y=Emissions, fill=city)) +
  geom_bar(aes(fill=year),stat="identity") +
  facet_grid(.~city) +
  guides(fill=FALSE) + theme_bw() +
  labs(x="year", y="Total  Emission" ) + 
  labs(title=" Motor Vehicle Source Emissions in Baltimore & LA, 1999-2008")

##use multiple scales so that the trend is clear###
g+facet_wrap(~city,scales="free_y")

##From 1198 to 2008 the change is actually more in Baltimore City###
dev.off()


