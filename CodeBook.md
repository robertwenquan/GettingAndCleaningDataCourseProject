# Getting and Cleaning Data Course Project

##### About this CodeBook
* This is for Coursera getdata-012 "Getting & Cleaning Data" Course Project
* The CodeBook serves as an aid to the R script, defining the steps to work the raw data through the clean data set
* Each step with detailed manipulation is elaborated with descriptive language as well as use of major functions
* Also the data frame name for the output of each step is explicitly specified

##### Input Data
 * Global data
  * activity_labels.txt
    - Map 6 activities to their IDs
  * features.txt
    - Map 561 features to their names
 * Data for each sample
  * [test|train]/X_[test|train].txt
    - the 561 features
  * [test|train]/y_[test|train].txt
    - what activity is performed in this test
  * [test|train]/subject_test.txt
    - who did the test

##### Output Data
 * Clean data set produced in Step 5, named "clean-data.txt"
  * 180 records (30 participants, 6 different activities, meaning all combinations are covered)
  * Apart from the activity and subject columns, the other columns are selected based on value from the 2nd column of "UCI HAR Dataset/features.txt". If "std()" or "mean()" matches the value, those observations are of our interest according to the problem specification.
 * Data Fields for the clean data set
  * "activity"
    - the descriptive name of the activity been measured
  * "subject"
    - the ID of the test subject, corresponding to a certain person
  * "tBodyAcc-mean()-X"
  * "tBodyAcc-mean()-Y"
  * "tBodyAcc-mean()-Z"
  * "tBodyAcc-std()-X"
  * "tBodyAcc-std()-Y"
  * "tBodyAcc-std()-Z"
  * "tGravityAcc-mean()-X"
  * "tGravityAcc-mean()-Y"
  * "tGravityAcc-mean()-Z"
  * "tGravityAcc-std()-X"
  * "tGravityAcc-std()-Y"
  * "tGravityAcc-std()-Z"
  * "tBodyAccJerk-mean()-X"
  * "tBodyAccJerk-mean()-Y"
  * "tBodyAccJerk-mean()-Z"
  * "tBodyAccJerk-std()-X"
  * "tBodyAccJerk-std()-Y"
  * "tBodyAccJerk-std()-Z"
  * "tBodyGyro-mean()-X"
  * "tBodyGyro-mean()-Y"
  * "tBodyGyro-mean()-Z"
  * "tBodyGyro-std()-X"
  * "tBodyGyro-std()-Y"
  * "tBodyGyro-std()-Z"
  * "tBodyGyroJerk-mean()-X"
  * "tBodyGyroJerk-mean()-Y"
  * "tBodyGyroJerk-mean()-Z"
  * "tBodyGyroJerk-std()-X"
  * "tBodyGyroJerk-std()-Y"
  * "tBodyGyroJerk-std()-Z"
  * "tBodyAccMag-mean()"
  * "tBodyAccMag-std()"
  * "tGravityAccMag-mean()"
  * "tGravityAccMag-std()"
  * "tBodyAccJerkMag-mean()"
  * "tBodyAccJerkMag-std()"
  * "tBodyGyroMag-mean()"
  * "tBodyGyroMag-std()"
  * "tBodyGyroJerkMag-mean()"
  * "tBodyGyroJerkMag-std()"
  * "fBodyAcc-mean()-X"
  * "fBodyAcc-mean()-Y"
  * "fBodyAcc-mean()-Z"
  * "fBodyAcc-std()-X"
  * "fBodyAcc-std()-Y"
  * "fBodyAcc-std()-Z"
  * "fBodyAccJerk-mean()-X"
  * "fBodyAccJerk-mean()-Y"
  * "fBodyAccJerk-mean()-Z"
  * "fBodyAccJerk-std()-X"
  * "fBodyAccJerk-std()-Y"
  * "fBodyAccJerk-std()-Z"
  * "fBodyGyro-mean()-X"
  * "fBodyGyro-mean()-Y"
  * "fBodyGyro-mean()-Z"
  * "fBodyGyro-std()-X"
  * "fBodyGyro-std()-Y"
  * "fBodyGyro-std()-Z"
  * "fBodyAccMag-mean()"
  * "fBodyAccMag-std()"
  * "fBodyBodyAccJerkMag-mean()"
  * "fBodyBodyAccJerkMag-std()"
  * "fBodyBodyGyroMag-mean()"
  * "fBodyBodyGyroMag-std()"
  * "fBodyBodyGyroJerkMag-mean()"
  * "fBodyBodyGyroJerkMag-std()"

##### Step 0 Download and read the data
  * Download the file from internet
  * Unpack the ZIP package
  * Read global data (features.txt, activity_labels.txt)
  * Read test data and train data
    * test/y_test.txt, test/subject_test.txt, test/X_test.txt
    * train/y_train.txt, train/subject_train.txt, train/X_train.txt

##### Step 1 Merges the training and the test sets to create one data set.
  * Merge test and train in memory
    * First merge test and train data separately into "features_merged", "activity_merged" and "activity_merged" using rbind()
    * column name were added for "activity_merged" and "subject_merged" in order to avoid duplicate column name
    * Then use cbind() to join them together as a single data frame
  * Output for step 1 is stored in "all_merged" data frame

##### Step 2 Extracts only the measurements on the mean and standard deviation for each measurement.
  * grep feature data frame to find the observations in interest, with their row ID. Those row IDs correspond to the column ID of "all_merged" data frame produced in Step 1
  * Then use select() to extract those targeted columns, in addition to the "activity" and "subject" columns
  * Output for step 2 with the extracted data is stored in "all_extracted" data frame

##### Step 3 Uses descriptive activity names to name the activities in the data set
  * Descriptive activity name is stored in "activity_labels" data frame
  * use merge() to merge "activity_labels" and "all_extracted" based on the activity_id in common
  * then use select() to eliminate the additional "activity_id" colomn just merged
  * Output for step 3 is stored in "merged_with_name" data frame

##### Step 4 Appropriately labels the data set with descriptive variable names.
  * The descriptive variable names are stored in the global "feature" data frame
  * As we had used grep() to filter out the fields in interest, we leverage that list but use the name instead of the ID we just used for extracting data
  * Then use names() to apply the descriptive column names for "merged_with_name" data frame
  * Output for step 4 is still stored in "merged_with_name" data frame, with revised descriptive column names

##### Step 5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  * First use group_by to group by the data observations by activity and subject
  * Then use summarize() to generate the mean value for each metrics
  * As there are too many columns to calculate, it is tedious to hand generate the query string so we construct the query string programatically with a for loop
  * Finally use eval(parse(text = cmd)) execute the command string and store the final result
  * The final result is stored in "clean_data_set" data frame

##### Final step
  * Finally the "clean_data_set" data frame is written back to file "clean-data.txt" with row.name = FALSE

