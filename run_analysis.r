# Script purpose...
# 1) Tidy Samsung Galaxy S accelerometer study dataset (output: )
# 2) Create a table of average metrics by activity for each subject (output: )

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
keep_field <- (grepl("mean()", names(dataX)) | grepl("std()", names(dataX))) & !grepl("meanFreq()", names(dataX))
keep_index <- which(keep_field)
subX <- dataX[,keep_index]

# Update activity names to be more descriptive...???
activity <- read.table("./UCI HAR Dataset/activity_labels.txt")
activity_codes <- as.character(1:6)
activity_names <- tolower(strsplit(gsub("[0-9]", "", activity)),( +))
# ??????

# Improve variable names...


# Other tidying... output saved as XXXX...


# Create a summary table with the subject average metric by activity...


# Summary table saved as XXXX...






