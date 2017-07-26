## Assignment: Exploratory Data Analysis, Week 1 
## Objective : Measuring PM2.5 emissions for each year and for each type of PM source.
##             
## Source URL: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip

# Set working directory
setwd("~/workspace/ExData_Prj2")

# Download the file and unzip
if(!file.exists("summarySCC_PM25.rds") || !file.exists("Source_Classification_Code.rds"))
{ download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip",destfile="Dataset.zip")
  
  # Unzip to create household_power_consumption.txt file
  unzip(zipfile="Dataset.zip")
}

# Load source files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Converting NEI Columns to factor
NEICol2Fac <- c("fips","SCC", "Pollutant", "Emissions", "type", "year")
NEI[,NEICol2Fac] <- lapply(NEI[,NEICol2Fac], factor)

# Clean Data
NEI[, 4] <- as.numeric(as.character( NEI[, 4] ))
levels(NEI$fips)[1] = NA
