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

# read the global data
feature <- read.table("UCI HAR Dataset/features.txt", stringsAsFactors=FALSE)
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", stringsAsFactors=FALSE)

# load test data
features_test <- read.table("UCI HAR Dataset/test/X_test.txt")
activity_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test  <- read.table("UCI HAR Dataset/test/subject_test.txt")

body_acc_x_test  <- read.table("UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt")
body_acc_y_test  <- read.table("UCI HAR Dataset/test/Inertial Signals/body_acc_y_test.txt")
body_acc_z_test  <- read.table("UCI HAR Dataset/test/Inertial Signals/body_acc_z_test.txt")
body_gyro_x_test <- read.table("UCI HAR Dataset/test/Inertial Signals/body_gyro_x_test.txt")
body_gyro_y_test <- read.table("UCI HAR Dataset/test/Inertial Signals/body_gyro_y_test.txt")
body_gyro_z_test <- read.table("UCI HAR Dataset/test/Inertial Signals/body_gyro_z_test.txt")
total_acc_x_test <- read.table("UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt")
total_acc_y_test <- read.table("UCI HAR Dataset/test/Inertial Signals/total_acc_y_test.txt")
total_acc_z_test <- read.table("UCI HAR Dataset/test/Inertial Signals/total_acc_z_test.txt")

# load train data
features_train <- read.table("UCI HAR Dataset/train/X_train.txt")
activity_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train  <- read.table("UCI HAR Dataset/train/subject_train.txt")

body_acc_x_train  <- read.table("UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt")
body_acc_y_train  <- read.table("UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt")
body_acc_z_train  <- read.table("UCI HAR Dataset/train/Inertial Signals/body_acc_z_train.txt")
body_gyro_x_train <- read.table("UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt")
body_gyro_y_train <- read.table("UCI HAR Dataset/train/Inertial Signals/body_gyro_y_train.txt")
body_gyro_z_train <- read.table("UCI HAR Dataset/train/Inertial Signals/body_gyro_z_train.txt")
total_acc_x_train <- read.table("UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt")
total_acc_y_train <- read.table("UCI HAR Dataset/train/Inertial Signals/total_acc_y_train.txt")
total_acc_z_train <- read.table("UCI HAR Dataset/train/Inertial Signals/total_acc_z_train.txt")

# merge test and train data
features_merged <- rbind(features_test, features_train)
activity_merged <- rbind(activity_test, activity_train)
subject_merged  <- rbind(subject_test,  subject_train)

body_acc_x_merged <- rbind(body_acc_x_test, body_acc_x_train)
body_acc_y_merged <- rbind(body_acc_y_test, body_acc_y_train)
body_acc_z_merged <- rbind(body_acc_z_test, body_acc_z_train)
body_gyro_x_merged <- rbind(body_gyro_x_test, body_gyro_x_train)
body_gyro_y_merged <- rbind(body_gyro_y_test, body_gyro_y_train)
body_gyro_z_merged <- rbind(body_gyro_z_test, body_gyro_z_train)
total_acc_x_merged <- rbind(total_acc_x_test, total_acc_x_train)
total_acc_y_merged <- rbind(total_acc_y_test, total_acc_y_train)
total_acc_z_merged <- rbind(total_acc_z_test, total_acc_z_train)

