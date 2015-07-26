# Exploratory Data Analysis
# Project 2


# setting working directory
setwd("C:/Raghu/Rscipts")


# downloading datazip and unzipping
if(!file.exists("./data")){dir.create("./data")}
fileUrl1 <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(fileUrl1, destfile = "./data/exdataNEI_data.zip", method="auto")
unzip("./data/exdataNEI_data.zip",exdir = "./expProject2")


library("plyr")

# Load data
NEI <- readRDS("./expProject2/summarySCC_PM25.rds")
SCC <- readRDS("./expProject2/Source_Classification_Code.rds")

data<-transform(NEI,year=factor(year))

#Plot Data
plotdata<-ddply(data,.(year),summarize,sum=sum(Emissions))
png("./expProject2/plot1.png")
plot(plotdata$year,plotdata$sum,type="n",xlab="year",ylab="total PM2.5 Emission",boxwex=0.05)
lines(plotdata$year,plotdata$sum)
dev.off()