# Getting and Cleaning Data Course Project

##### About this README
* This is for Coursera getdata-012 "Getting & Cleaning Data" Course Project
* This README describes the technical assumptions to run the R script
* The means to run the R script is specified
* The way to check the output result is also specified
* As for how the data is interpreted and translated to the clean data set, please refer to the [CodeBook](CodeBook.md)

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

To quickly check the clean set of result, you can run the following lines in R
~~~
# download the data from the web
if (Sys.info()[['sysname']] == "Linux") {
    download.file('https://s3.amazonaws.com/coursera-uploads/user-758a19dee505ee5a355d0cb7/973499/asst-3/5fc626e0d0e411e49f94cf56e74c64c9.txt', destfile = 'rwen_clean_data.txt', method = 'curl')
} else {
    download.file('https://s3.amazonaws.com/coursera-uploads/user-758a19dee505ee5a355d0cb7/973499/asst-3/5fc626e0d0e411e49f94cf56e74c64c9.txt', destfile = 'rwen_clean_data.txt')
}

# read the data
data <- read.table('rwen_clean_data.txt', header = TRUE)
# the data should be 180 rows and 68 columns
dim(data)
# check the colomn names
str(data)
# view data in a separate window
View(data)
~~~
