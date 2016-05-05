# Script purpose...
# 1) Tidy Samsung Galaxy S accelerometer study dataset (output: tidy_data.csv)
# 2) Create a table of average metrics by activity for each subject (output: summary.csv)

# Original data downloaded on 5/4/2016 from:
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# For notes on original data and study methodology, see:
# http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

# See CodeBook.md and README.md as a guide for the output files.
# --------------------------------------------------------------

library(dplyr) 
library(tidyr)

# Reading in .txt files for test and training data, adding source field for future reference....
trainX <- mutate(data.frame(read.table("./UCI HAR Dataset/train/X_train.txt")), source = "train")
testX <- mutate(data.frame(read.table("./UCI HAR Dataset/test/X_test.txt")), source = "test")

# Merge test and training data to a single file, reading in field names...
dataX <- rbind(trainX,testX)
fields <- read.table("./UCI HAR Dataset/features.txt")
colnames(dataX) <- fields[,2]

# Selecting only *mean() and *std() fields with grepl() logicals...
keep_field <- (grepl("mean", names(dataX)) | grepl("std", names(dataX))) & !grepl("meanFreq", names(dataX))
keep_index <- which(keep_field)
subX <- dataX[,keep_index]

# Gather metrics into a single column and then separate for a tidier layout...
gatherX <- gather(subX, "metric-measure-axis", "value")
sepX <- separate(gatherX, "metric-measure-axis", c("metric", "measure", "axis"))

# Convert to lowercase and fill in "total" magnitude where axis blank...
sepX$metric <- tolower(sepX$metric)
sepX$axis <- tolower(sepX$axis)
sepX$axis[!(sepX$axis %in% c("x", "y", "z"))] <- "total"

# Further separate the metric field, first using sub to add "-" characters...
sepX$metric <- sub("bodybody","body",sepX$metric)
# ---FFT transform portion...
sepX$metric <- sub("t", "no-", sepX$metric)
sepX$metric <- sub("f","yes-", sepX$metric)
# ---measure type portion...
sepX$metric <- sub("body", "body-", sepX$metric)
sepX$metric <- sub("gravity", "gravity-", sepX$metric)
# ---signal type portion...
sepX$metric <- sub("accjerk.*", "jerkcalc", sepX$metric)
sepX$metric <- sub("acc.*", "accelerometer", sepX$metric)
sepX$metric <- sub("gyro.*", "gyroscope", sepX$metric)
# Separate...
names(sepX)[names(sepX) == "metric"] <- "transform-type-signal"
tidyData <- separate(sepX, "transform-type-signal", c("transform", "type", "signal"))

# Export tidied data...
write.csv(tidyData, file = "tidy_data.csv")

# Group by variables and prepare summary table....
groups <- group_by(tidyData, type, signal, axis, measure, transform)
summary <- summarize(groups, value = mean(value))

# Export summary table...
write.csv(summary, file = "summary.csv")





