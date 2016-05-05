# Cleaning-Data-with-R-example
Course assignment: Use R to clean up Samsung Galaxy S accelerometer dataset

 Goal: Prepare the Human Activity Recognition Using Smartphones Dataset 
 (Reyes-Ortiz et-al) for analysis.

 run_analysis.r script:
 1) Tidies Samsung Galaxy S accelerometer study dataset (output: tidy_data.csv)
 2) Creates a table of average metrics by activity for each subject (output: summary.csv)
 
 
 Prior step: Download & extract data:
 
 Original data downloaded on 5/4/2016 from:
 https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
 
 Zip folder name: UCI HAR Dataset.zip
 Files extracted with 7-Zip 15.14 File Manager to local repository.
 
	Files read as inputs to the run_analysis.r script include: 
	X_train.txt, 
	X_test.txt, 
	features.txt

Notes on R version/OS: Rx64 3.2.5 running on Windows 10 

See CodeBook.md as a guide for output files
