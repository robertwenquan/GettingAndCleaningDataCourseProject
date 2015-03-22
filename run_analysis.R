#!/usr/bin/R -q -f

#
# run_analysis.R
#
# Coursera Getting and Cleaning Data Course Project
#
# Robert Wen (robert.wen@nyu.edu)
#
# This script does the following tasks for the dataset:
#  1. Merges the training and the test sets to create one data set.
#  2. Extracts only the measurements on the mean and standard deviation for each measurement. 
#  3. Uses descriptive activity names to name the activities in the data set
#  4. Appropriately labels the data set with descriptive variable names. 
#  5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#

# import library dplyr
library(dplyr)

#
# step0. read the data
#

#   0.1 read the global data
#       the feature data and activity_labels data are globally used for test and train data
#       they give us the descriptive name of the activities, as well as the feature names
feature <- read.table("UCI HAR Dataset/features.txt", col.names=c("feature_id", "feature_name"), stringsAsFactors=FALSE)
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", col.names=c("activity_id", "activity_name"), stringsAsFactors=FALSE)

#   0.2 read test data
                            # load activity (what had been done)
activity_test <- read.table("UCI HAR Dataset/test/y_test.txt")
                            # load subject (who did it)
subject_test  <- read.table("UCI HAR Dataset/test/subject_test.txt")
                            # load the 561 measurements
features_test <- read.table("UCI HAR Dataset/test/X_test.txt")

#   0.3 read train data
                            # load activity (what had been done)
activity_train <- read.table("UCI HAR Dataset/train/y_train.txt")
                            # load subject (who did it)
subject_train  <- read.table("UCI HAR Dataset/train/subject_train.txt")
                            # load the 561 measurements
features_train <- read.table("UCI HAR Dataset/train/X_train.txt")

#
# step1. merge test and train data
#

# first use row bind to merge the test and train data
features_merged <- rbind(features_test, features_train)
activity_merged <- rbind(activity_test, activity_train)
subject_merged  <- rbind(subject_test,  subject_train)

# column names were added to avoid the duplicate column name conflict across data frames
# as V1, V2 like names are commonly used across multiple data sets
names(activity_merged) <- "activity"
names(subject_merged) <- "subject"

# use column bind to merge all data together as a single data set
all_merged <- cbind(features_merged, activity_merged, subject_merged)

#
# step2. extract only the mean and stdev for each measurement
#

# query the global feature data read from 'features.txt' and identify
# which columns are of our interest about mean() and std()
selected_features <- feature[grep('std()|mean()', feature$feature_name),]
selected_columns <- selected_features[,1]

all_extracted <- select(all_merged, c(activity, subject, selected_columns))

#
# step3. apply descriptive activity names to name the activities in the data set
#        by joining the merged data set with the activity_labels data frame
merged_with_name <- select(merge(activity_labels, all_extracted, by.x="activity_id", by.y="activity", all=TRUE), -activity_id)

#
# step4. label the data set with descriptive variable names
#
selected_column_names <- gsub("\\(\\)", "", gsub("-", ".", selected_features[,2]))
names(merged_with_name) <- c("activity", "subject", selected_column_names)

#
# step5. creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#

# group the data by unique combination of activity and subject
# there will be 80 unique groups
gg <- group_by(merged_with_name, activity, subject)

# this is to generate the R command string like this
#   "summarise(gg, tBodyAcc.mean.X=mean(tBodyAcc.mean.X), tBodyAcc.mean.Y=mean(tBodyAcc.mean.Y), ... ... )"
r_cmd_str <- 'summarise(gg'

for (name in selected_column_names)
{
  r_cmd_str <- paste(r_cmd_str, ', ', name, '=mean(', name, ')', sep='')
}

r_cmd_str_end <- ')'
r_cmd_str <- paste(r_cmd_str, r_cmd_str_end)

# execute the R command string to get the clean data set
clean_data_set <- eval(parse(text = r_cmd_str))

# write the data set to a file named "clean-data.txt"
# this will write 181 lines of data
# with the first line as the column names
write.table(clean_data_set, file = 'clean-data.txt', row.name = FALSE)

