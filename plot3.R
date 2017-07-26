library(ggplot2)

# Download Source Files, Read files and cleans data
source('DataPrep.R')

# Filter for Baltimore City, Maryland 
NEIBalM<-subset(NEI, fips == "24510")

# Aggregate Emissions by year
# TotBalMEmisbyYear <- aggregate(Emissions ~ year, NEI.BalM, sum)

# Open PNG Device
png(filename='plot3.png', width=480, height=480, units='px')

# Generate Plot3
ggp <- ggplot(NEIBalM,aes(factor(year),Emissions/1000)) +
  geom_bar(stat="identity") +
  theme_bw() + guides(fill=FALSE)+
  facet_grid(.~type,scales = "free",space="free") + 
  labs(x="Year", y=expression("Total PM"[2.5]*" Emission (Kilo Tons)")) + 
  labs(title=expression("PM"[2.5]*" Emissions, Baltimore City between 1999-2008 by Source Type"))

# Print Plot
print(ggp)

# close PNG Device
dev.off()
