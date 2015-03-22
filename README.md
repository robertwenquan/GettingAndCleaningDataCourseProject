# Getting and Cleaning Data Course Project

##### About this repository
* This is for Coursera getdata-012 "Getting & Cleaning Data" Course Project
* by Robert Wen (robert.wen@nyu.edu)
* due date is Mar 22 7:30 PM EDT

##### Prepare the dataset for analysis (optional)
* NOTE: This step is only for informational purpose
* The data prepration is included in the R script so you don't have to run this
* The script 'prepare_data.sh' will download the dataset and unpack it under the directory named "UCI HAR Dataset"

##### Technical Assumption
* It's assumed that the "dplyr" package is preinstalled before we run this script because we are using select, felter, summarize functions in dplyr package
* It's also assumed that the internet connection is available because the data for analysis will be fetched from internet before doing analysis
* Exceptions for those assumptions are not handled at all

##### Run the R script
To run the R script, you can simply run the R script if you are under Linux command line
~~~
$ chmod +x ./run_analysis.R
$ ./run_analysis.R
~~~

or you can open R console and load the script file
~~~
$ R
...
> source('run_analysis.R')
~~~

or you can open R Stuidio and load the script from there
either from command line
~~~
> source('run_analysis.R')
~~~
or from the menu "File" -> "Open File" and choose "run_analysis.R"
Ctrl-A to choose all, and Ctrl-Enter to run the selected script

##### Check the result
Once finished running with a bunch of output messages
you will find 'clean-data.txt' under getwd() directory

The first line of this result file is the header with column names
The remaining 180 lines are the 180 data observations

