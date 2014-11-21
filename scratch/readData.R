library(dplyr)

#fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#destFile <- "./getdata-projectfiles-UCI-HAR-Dataset.zip"
#download.file(fileUrl, destfile=destFile, method="curl")

#command <- paste("unzip", destFile)

#system2(command, stdout = "unzip_stdout.txt", stderr = "unzip_stderr.txt")

setwd("~/Google Drive/dataScience/GettingAndCleaningData/CourseProject")

featuresFile <- "UCI HAR Dataset/features.txt"
features <- read.table(featuresFile,header=FALSE)

testFile         <- "UCI HAR Dataset/test/X_test.txt"
testSubjectsFile <- "UCI HAR Dataset/test/subject_test.txt"
testActivityFile <- "UCI HAR Dataset/test/y_test.txt"

testData     <- read.table(testFile,header=FALSE)
testSubjects <- read.table(testSubjectsFile,header=FALSE)
testActivity <- read.table(testActivityFile,header=FALSE)

colnames(testData) <- features$V2
colnames(testSubjects) = c("subject")
colnames(testActivity) = c("activity")

testData <- cbind(testSubjects,testActivity,testData)

trainFile         <- "UCI HAR Dataset/train/X_train.txt"
trainSubjectsFile <- "UCI HAR Dataset/train/subject_train.txt"
trainActivityFile <- "UCI HAR Dataset/train/y_train.txt"

trainData     <- read.table(trainFile,header=FALSE)
trainSubjects <- read.table(trainSubjectsFile,header=FALSE)
trainActivity <- read.table(trainActivityFile,header=FALSE)

colnames(trainData) <- features$V2
colnames(trainSubjects) = c("subject")
colnames(trainActivity) = c("activity")

trainData <- cbind(trainSubjects,trainActivity,trainData)

data <- tbl_df(rbind(testData, trainData))

rm("trainData","trainSubjects","trainActivity","testData","testSubjects","testActivity","features")

names(data)<-gsub("\\(","",names(data),)
names(data)<-gsub("\\)","",names(data),)
names(data)<-gsub("-","",names(data),)
names(data)<-gsub("-","",names(data),)
names(data) <- tolower(names(data))

data <- data[, !duplicated(colnames(data))]

data <- select(data, subject, activity, contains("mean"), contains("std"))
data <- select(data, -contains("meanfreq"), -starts_with("angle"))

# 1 WALKING
# 2 WALKING_UPSTAIRS
# 3 WALKING_DOWNSTAIRS
# 4 SITTING
# 5 STANDING
# 6 LAYING
data$activity <- factor(data$activity, labels = c("walking", "walkingupstairs", 
                                                  "walkingdownstairs", "sitting",
                                                  "standing", "laying"
                                                  ))

data <- group_by(data, subject, activity)
summary <- summarise_each(data, funs(mean))

write.table(summary, "tidyUCI.txt", sep = ",")