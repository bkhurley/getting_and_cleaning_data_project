# Getting and Cleaning Data Project

The goal of this project was to clean the Human Activity Recognition (HAR) data set. The HAR data were collected from the accelerometers from the Samsung Galaxy S smartphone while 30 participants carried out activities of daily living. A full description is available at the site where the data were obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## File descriptions
This repository contains the following files:
* `CodeBook.MD` -- detailed description of variables in the tidy data set and transformations performed on the original HAR data
* `README.MD` -- provides overview of the HAR data set; describes the current analysis and how to run it
* `src/run_analysis.R` -- the code used to create the tidy data set (see Running the Analysis Set below)
* `tidy_data/tidy_activity_by_subj_data.txt` -- the cleaned data set, generated by `run_analysis.R`

## Running the analysis
Simply run the script `run_analysis.R` to create the tidy data set.  
Note that the script requries the `dplyr` and `data.table` packages. Please download those packages first if you do not have them.
The analysis script implements the following steps:
1. Downloads and unzips the HAR data set if the data are not already in the working directory.
2. Reads in the HAR data.
3. Combines accelerometer features with subject and activity indicators, merges training and test data sets.
4. Extracts only the measurements on the mean and standard deviation for each measurement.
5. Uses descriptive activity names to name the activities in the data set.
6. Appropriately labels the data set with descriptive variable names.
7. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
