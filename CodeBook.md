CODEBOOK

run_analysis.r script:
	1) Tidies Samsung Galaxy S accelerometer study dataset (output: tidy_data.csv)
	2) Creates a table of average metrics by activity for each subject (output: summary.csv)

I. CodeBook: tidy_data.csv

This file contains source data readings for mean and standard deviation metrics in a tidied layout.

FIELD			CLASS			VALUES				DESCRIPTION
transform		character		yes, no				Indicates whether a Fast Fourier Transform was applied
type			character		body, gravity		Indicates whether measure is of gravity or body motion 
signal			character		accelerometer, 		Indicates signal type
								gyroscope, jerkcalc
measure			character		mean, std			Indicates whether value represents mean or standard dev.
axis			character		x, y, z, total		Indicates axis measured (x,y,z) or total magnitude
value			double								Original data readings (Hz) which were normalized and 
													bounded within [-1,1].

Note: Of the available measures, only mean and standard deviations were selected for analysis. (See section 
III on source data)
													
II. Codebook: summary.csv

This file summarizes the data from tidy_data.csv, providing the mean values across field categories.

transform		character		yes, no				Indicates whether a Fast Fourier Transform was applied
type			character		body, gravity		Indicates whether measure is of gravity or body motion 
signal			character		accelerometer, 		Indicates signal type
								gyroscope, jerkcalc
measure			character		mean, std			Indicates whether value represents mean or standard dev.
axis			character		x, y, z, total		Indicates axis measured (x,y,z) or total magnitude
value			double								Mean values of metrics (Hz) across all study subjects. 
													Note: Original data readings (Hz) which were normalized 
													and bounded within [-1,1].
III. Source Data Notes: 

For full notes on original data and study methodology, see:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Experiments were carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 
3-axial linear acceleration and 3-axial angular velocity were captured at a constant rate of 50Hz. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then 
sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor 
acceleration signal, which has gravitational and body motion components, was separated using a Butterworth 
low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low 
frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, 
a vector of features was obtained by calculating variables from the time and frequency domain.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals 
tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a 
constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass 
Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal 
was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using 
another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals 
(tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were 
calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, 
tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, 
fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' 
to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.



