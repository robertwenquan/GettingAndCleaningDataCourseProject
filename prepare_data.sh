#!/bin/bash

rm -fr UCI_HAR_Dataset &>/dev/null
wget -q https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip -O UCI_HAR_Dataset.zip
unzip -q UCI_HAR_Dataset.zip
mv "UCI HAR Dataset" UCI_HAR_Dataset

