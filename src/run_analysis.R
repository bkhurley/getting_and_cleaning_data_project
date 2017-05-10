# Course project for Getting & Cleaning Data (Coursera)
#
# 
#
# Before running, you must set your working directory to the folder in which you 
# have placed this script. 
# Assumes that the folder "UCI HAR Dataset" is within this directory.
#
# 03May2017 Brian K Hurley

library(dplyr)
library(data.table)


# navigate to data directory
starting_dir <- getwd()
setwd("UCI HAR Dataset/")

#############
# function for combining subject, feature, and activity data to common data set
combine_data_columns <- function(data_fnames) {
        # load feature data
        x_data <- read.table(data_fnames[["x"]])
        
        # append subject ID and activity codes to data
        x_data <- x_data %>% 
                cbind(read.table(data_fnames[["subjects"]]), .) %>%
                cbind(., read.table(data_fnames[["y"]]))
        }

############

# populate file name lists for training data and test data
train_data_fnames <- list(x= "train/X_train.txt", 
                          y= "train/y_train.txt",
                          subjects = "train/subject_train.txt")
test_data_fnames <- list(x= "test/X_test.txt", 
                         y= "test/y_test.txt",
                         subjects = "test/subject_test.txt")

# load list of feature names
features <- fread("features.txt") 
feature_names <- select(features, V2) %>% 
        .[["V2"]]

# combine feature, subject, and activity data to a common data set for train and test sets
train_data <- combine_data_columns(train_data_fnames)
test_data <- combine_data_columns(test_data_fnames)


################
# 1. Merge training & test sets
#       same column structure, so we can simply rbind
merged_data <- rbind(train_data, test_data)


###############
# 2. Extract mean & standard dev for each measurement

# get numerical indices of feature names containing "mean" or "std"
mean_std_idx <- grep("mean|std", feature_names)
mean_std_features <- feature_names[mean_std_idx]

# select only columns pertaining to subject, mean or std value, and activity
# Note, adding 1 to mean|std indices to account for subject column ("V1")
mean_std_data <- merged_data[,c(1, (mean_std_idx+1), ncol(merged_data))]


###############
# 3. Name activities in data set with descriptive names
# note that feature names were attached in combine_data_columns()
activity_names <- fread("activity_labels.txt")
mean_std_data[,ncol(mean_std_data)] <- activity_names[,2][mean_std_data[,ncol(mean_std_data)]]


###############
# 4. label variable names informatively
mean_std_data <- setnames(mean_std_data, c("subject_id", mean_std_features, "activity"))


###############
# 5. create second, tidy data set w/ averages of each variable for each activity 
# and each subject

# group data set by activity & subject
by_activ_sub <- group_by(mean_std_data, activity, subject_id)
# get means of features for each unique combination of activity and subject 
activity_by_sub_means <- mean_std_data %>%
        group_by(activity, subject_id) %>%
        summarise_each(funs(mean), 2:80)

# output tidy data set to file
dir.create(file.path(starting_dir, 'tidy_data'), showWarnings = FALSE)
setwd(file.path(starting_dir, 'tidy_data'))
write.table(activity_by_sub_means, 
            file="tidy_activity_by_subj_data.txt", 
            sep="\t",
            row.name=FALSE)