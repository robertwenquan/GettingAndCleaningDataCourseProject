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

#### Step 1 Merges the training and the test sets to create one data set.
  * Read global data
  * Read test data and train data
  * Merge test and train in memory
  * Write the merged data set to disk

#### Step 2 Extracts only the measurements on the mean and standard deviation for each measurement.
<ul>
<li> sdf </li>
</ul>
#### Step 3 Uses descriptive activity names to name the activities in the data set
<ul>
<li> sdf </li>
</ul>
#### Step 4 Appropriately labels the data set with descriptive variable names.
<ul>
<li> sdf </li>
</ul>
#### Step 5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
<ul>
<li> sdf </li>
</ul>

