#Code Book
This code book defines variable columns in tidy_activity_by_subj_data.txt, which is a tidied version of the Human Activity Recognition (HAR) data set: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The HAR data were derived from inertial sensor recordings in waist-mounted smartphones from 30 individuals performing activities of daily living.
 

The features selected for the HAR data set come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

##Variables

###Subjects
subject_id
*Integer identifying subjects 1 to 30.

###Activities
activity
*categorical variable identifying the activities that subjects performed during recording. Activity categories:
**LAYING
**SITTING
**STANDING
**WALKING
**WALKING_DOWNSTAIRS
**WALKING_UPSTAIRS

###Features
The features selected for the HAR data set come from the accelerometer and gyroscope 3-axial raw signals timeDomainAccelerationXYZ and timeDomainGyroscopeXYZ. The descriptions of time-domain and frequency-domain features below were largely taken from the HAR data set’s original code book (features_info.txt), with feature nomenclature updated to reflect the feature names in the tidied data set tidy_activity_by_subj_data.txt.

####Time domain
Time domain signals (prefix 'timeDomain’) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. 

The acceleration signal was then separated into body and gravity acceleration signals (timeDomainBodyAccelerationXYZ and timeDomainGravityAccelerationXYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (timeDomainBodyAccelerationJerkXYZ and timeDomainBodyGyroscopeJerkXYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (timeDomainBodyAccelerationMagnitude, timeDomainGravityAccelerationMagnitude, timeDomainBodyAccelerationJerkMagnitude, timeDomainBodyGyroscopeMagnitude, timeDomainBodyGyroscopeJerkMagnitude). 

####Frequency domain
Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing frequency domain signals: frequencyDomainBodyAccelerationXYZ, frequencyDomainBodyAccelerationJerkXYZ, frequencyDomainBodyGyroscopeXYZ, frequencyDomainBodyAccelerationJerkMagnitude, frequencyDomainBodyGyroscopeMagnitude, frequencyDomainBodyGyroscopeJerkMagnitude. 

These signals were used to estimate variables of the feature vector for each pattern:  
'XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

####Descriptive Statistics
The mean (feature name contains “Mean”) and standard deviation (feature name contains “StandardDeviation”) were calculated for each signal type. 

##Transformations
The original HAR data set was transformed in the following ways to produce tidy_activity_by_subj_data.txt:
#Appended columns of subject_id and activity indicators to the feature data
#Combined the Training data and Test data into a single data set
#Excluded feature columns that did not pertain to the mean or standard deviation of a measurement
#Renamed activity indicators in the data set from integers to the corresponding activity strings (e.g., 1 was renamed as WALKING)
#Cleaned feature names to become more informative:
##removed special characters[()\-]
##replaced abbreviations with full labels:
###t -> timeDomain
###f -> frequencyDomain
###Acc -> Acceleration
###Gyro -> Gyroscope
###Mag -> Magnitude 
##capitalized Mean and StandardDeviation labels since no longer separated by special characters (mean -> Mean; std -> StandardDeviation)
##replaced typo BodyBody with Body
#Averaged each remaining feature variable for each combination of activity and subject_id to create the final data set tidy_activity_by_subj_data.txt

Original data were collected and transformations performed by the script run_analysis.R