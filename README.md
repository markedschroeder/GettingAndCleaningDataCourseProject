#README
###By: Mark Schroeder
###Purpose: Getting and Cleaning Data Course Project

The analysis has a single script called run_analysis.R, which must be run in a directory containing the unzipped version of the archive getdata-projectfiles-UCI HAR Dataset.zip.  This file can be downloaded from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

run_analysis.R does the following steps:

1. reads in the files:
"UCI HAR Dataset/test/X_test.txt"
"UCI HAR Dataset/test/subject_test.txt"
"UCI HAR Dataset/test/y_test.txt"
"UCI HAR Dataset/train/X_train.txt"
"UCI HAR Dataset/train/subject_train.txt"
"UCI HAR Dataset/train/y_train.txt"
2. simplifies the column names and number of columns
3. creates mean values across subjects and activities
4. creates the a tidy data set in the file: tidy-UCI-HAR.csv

See CodeBook.md for a detailed description of data transformations and description of the final data set.
