library(dplyr)

#set the working directory
setwd("~/Google Drive/dataScience/GettingAndCleaningData/GettingAndCleaningDataCourseProject")

#read the features information for column names
featuresFile <- "UCI HAR Dataset/features.txt"
features <- read.table(featuresFile,header=FALSE)

#read in the files for the test data set
testFile         <- "UCI HAR Dataset/test/X_test.txt"
testSubjectsFile <- "UCI HAR Dataset/test/subject_test.txt"
testActivityFile <- "UCI HAR Dataset/test/y_test.txt"

testData     <- read.table(testFile,header=FALSE)
testSubjects <- read.table(testSubjectsFile,header=FALSE)
testActivity <- read.table(testActivityFile,header=FALSE)

#combine data into one test data data frame
colnames(testData) <- features$V2
colnames(testSubjects) = c("subject")
colnames(testActivity) = c("activity")
testData <- cbind(testSubjects,testActivity,testData)

#read in files for the train data set
trainFile         <- "UCI HAR Dataset/train/X_train.txt"
trainSubjectsFile <- "UCI HAR Dataset/train/subject_train.txt"
trainActivityFile <- "UCI HAR Dataset/train/y_train.txt"

trainData     <- read.table(trainFile,header=FALSE)
trainSubjects <- read.table(trainSubjectsFile,header=FALSE)
trainActivity <- read.table(trainActivityFile,header=FALSE)

#combine data into one train data data frame
colnames(trainData) <- features$V2
colnames(trainSubjects) = c("subject")
colnames(trainActivity) = c("activity")
trainData <- cbind(trainSubjects,trainActivity,trainData)

#combine the test and train data sets into a single dplyr table data frame
data <- tbl_df(rbind(testData, trainData))

#remove left over variables
rm("trainData","trainSubjects","trainActivity","testData","testSubjects","testActivity","features")

#clean up column names
names(data)<-gsub("\\(","",names(data),)
names(data)<-gsub("\\)","",names(data),)
names(data)<-gsub("-","",names(data),)
names(data) <- tolower(names(data))

#some of the column names are duplicates (true of original names from features.txt)
data <- data[, !duplicated(colnames(data))]

#select to obtain minimal set of columns
data <- select(data, subject, activity, contains("mean"), contains("std"))
data <- select(data, -contains("meanfreq"), -starts_with("angle"))

# 1 WALKING
# 2 WALKING_UPSTAIRS
# 3 WALKING_DOWNSTAIRS
# 4 SITTING
# 5 STANDING
# 6 LAYING
#make activity a factor variable with readable names
data$activity <- factor(data$activity, labels = c("walking", "walkingupstairs", 
                                                  "walkingdownstairs", "sitting",
                                                  "standing", "laying"
                                                  ))

#group data and use summarise_each to calculate a mean for each activity/subject
#combination
data <- group_by(data, subject, activity)
summary <- summarise_each(data, funs(mean))

#order by subject id
summary <- arrange(summary, subject, activity)

#write table with row.name false.  Chose csv, because it makes the separator clear and
#is easy to read.
write.table(summary, "tidy-UCI-HAR.csv", sep = ",", row.name=FALSE)