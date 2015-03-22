# Getting and Cleaning Data Course Project Code Book

#### Input Data
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
  * {test,train}/Inertial Signals/{body_acc,total_acc,body_gyro}_{x,y,z}_{test,train}.txt
    - The total accelation on X/Y/Z axis
    - body acceleration on X/Y/Z axis
    - body velocity on X/Y/Z axis

#### Intermediate Data
 * Intermediate data is all in memory

#### Output Data
 * Clean data set in step.5
  * 180 records (30 participants, 6 different activities, meaning all combinations are covered)
  * Apart from the activity and subject columns, the other columns are selected based on value from the 2nd column of "UCI HAR Dataset/features.txt". If "std()" or "mean()" matches the value, those observations are of our interest according to the problem specification.

#### Step 0 Download and read the data
  * Download the file from internet
  * Unpack the ZIP package
  * Read global data (features.txt, activity_labels.txt)
  * Read test data and train data
    * test/y_test.txt, test/subject_test.txt, test/X_test.txt
    * train/y_train.txt, train/subject_train.txt, train/X_train.txt

#### Step 1 Merges the training and the test sets to create one data set.
  * Merge test and train in memory
    * First merge test and train data separately into "features_merged", "activity_merged" and "activity_merged" using rbind()
    * column name were added for "activity_merged" and "subject_merged" in order to avoid duplicate column name
    * Then use cbind() to join them together as a single data set "all_merged"

#### Step 2 Extracts only the measurements on the mean and standard deviation for each measurement.
  * 
#### Step 3 Uses descriptive activity names to name the activities in the data set
#### Step 4 Appropriately labels the data set with descriptive variable names.
#### Step 5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

