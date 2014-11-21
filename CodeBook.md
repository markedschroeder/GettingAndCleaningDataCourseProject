#CodeBook for simplified Human Activity Recognition Using Smartphones Dataset
###Created By: Mark Schroeder
###Purpose: Getting and Cleaning Data Course Project
###Original Data from: Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto. www.smartlab.ws

* Original data obtained from: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
* Actual data files link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

In the following the base directory where the data files were unzipped is referred to as ".".  For further information about the data itself see ./UCI HAR Dataset/README.txt

###Data Transformation Steps:
1.  Read the file ./UCI HAR Dataset/test/X_test.txt and generated column headers from ./UCI HAR Dataset/features.txt
2.  Read the subject (./UCI HAR Dataset/test/subject_test.txt) and activity (./UCI HAR Dataset/test/y_test.txt) files
    and bound them to the X test data frame as the first and second columns respectively.
3.  Carried out the same process for the analogous files in ./UCI HAR Dataset/train/
4.  Bound the rows from the equivalently structured test and train data, with the rows from the test data above those
    of the train data.
5.  Simplified the names by: Removing the parenthesis ("(" and ")") and hyphens ("-") from the variable names.
    Converting all characters to lower case. This was done in accordance with suggestions from the fourth week lectures
    of the getting and cleaning data course.
6.  Removed duplicate column names present in the original data set (i.e. fBodyAcc-bandsEnergy()-1,8).  These columns 
    are not of interest anyways, so this was just a convenience step for working with the column names.
7.  Dropped all columns lacking mean and std, as well as those containing meanfreq and those starting with angle.
    This set of columns seemed to best match the pairs of mean and std that were asked for in the course project 
    directions.
8.  Averaged all observations with the same subject and activity to have a single representative value for each feature
    for each subject and activity combination.
9.  Sorted by subject, activity.
10. This resulted in a data set of 180 observations composed of 30 subjects doing 6 activities.

###Data Explanation
The columns in the final data set are a subset of the "A 561-feature vector with time and frequency domain variables."  These variables are best described in ./UCI HAR Dataset/feature_info.txt.  They are derived from transformations of the gyroscope and accelerometer of the Samsung Galaxy SII.  The directions x, y, and z are relative to the phone.  The following descriptions are to the best understanding I had of the data.  Refer back to the original description in the feature_info.txt and README.txt files for any necessary clarification.  No units were given so the units are unknown for all variable fields.  The final tidy data set is in the file tidy-UCI-HAR.csv.

#####Column names:
1.  subject: Unique numerical identifier from 1-30 for each subject tested
2.  activity: a factor variable taking on the values "walking", "walkingupstairs", "walkingdownstairs", "sitting",
                  "standing", "laying"
3.  tbodyaccmeanx: time domain variable of the mean body accelerometer signal in the x direction.
4.  tbodyaccmeany: time domain variable of the mean body accelerometer signal in the y direction.
5.  tbodyaccmeanz: time domain variable of the mean body accelerometer signal in the z direction.
6.  tgravityaccmeanx: time domain variable of the mean gravity component of the accelerometer signal in the x direction.
7.  tgravityaccmeany: time domain variable of the mean gravity component of the accelerometer signal in the y direction.
8.  tgravityaccmeanz: time domain variable of the mean gravity component of the accelerometer signal in the z direction.
9.  tbodyaccjerkmeanx: time domain variable of jerk estimated by the accelerometer in the x direction.
10. tbodyaccjerkmeany: time domain variable of jerk estimated by the accelerometer in the y direction.
11. tbodyaccjerkmeanz: time domain variable of jerk estimated by the accelerometer in the z direction.
12. tbodygyromeanx: time domain variable of the mean body gyroscope signal in the x direction.
13. tbodygyromeany: time domain variable of the mean body gyroscope signal in the y direction.
14. tbodygyromeanz: time domain variable of the mean body gyroscope signal in the z direction.
15. tbodygyrojerkmeanx: time domain variable of jerk estimated by the gyroscope in the x direction.
16. tbodygyrojerkmeany: time domain variable of jerk estimated by the gyroscope in the y direction.
17. tbodygyrojerkmeanz: time domain variable of jerk estimated by the gyroscope in the z direction.
18. tbodyaccmagmean: time domain variable of the mean magnitude of acceleration from body movement.
19. tgravityaccmagmean: time domain variable of the mean magnitude of acceleration due to gravity.
20. tbodyaccjerkmagmean: time domain variable of the mean magnitude of acceleration due to jerk.
21. tbodygyromagmean: time domain variable of the mean magnitude of gyroscope signal due to slow movement.
22. tbodygyrojerkmagmean: time domain variable of the mean magnitude of gyroscope signal due to jerk.
23. fbodyaccmeanx: frequency domain variable of the mean body accelerometer signal in the x direction.
24. fbodyaccmeany: frequency domain variable of the mean body accelerometer signal in the y direction.
25. fbodyaccmeanz: frequency domain variable of the mean body accelerometer signal in the z direction.
26. fbodyaccjerkmeanx: frequency domain variable of jerk estimated by the accelerometer in the x direction.
27. fbodyaccjerkmeany: frequency domain variable of jerk estimated by the accelerometer in the y direction.
28. fbodyaccjerkmeanz: frequency domain variable of jerk estimated by the accelerometer in the z direction.
29. fbodygyromeanx: frequency domain variable of the mean body gyroscope signal in the x direction.
30. fbodygyromeany: frequency domain variable of the mean body gyroscope signal in the y direction.
31. fbodygyromeanz: frequency domain variable of the mean body gyroscope signal in the z direction.
32. fbodyaccmagmean: frequency domain variable of the mean magnitude of acceleration from body movement.
33. fbodybodyaccjerkmagmean: frequency domain variable of the mean magnitude of body acceleration due to jerk.
34. fbodybodygyromagmean: frequency domain variable of the mean magnitude of gyroscope signal due to body movement.
35. fbodybodygyrojerkmagmean: frequency domain variable of the mean magnitude of body gyroscope signal due to jerk.
36. tbodyaccstdx: time domain variable of the standard deviation in accelerometer signal due to body motion in the x direction.
37. tbodyaccstdy: time domain variable of the standard deviation in accelerometer signal due to body motion in the y direction.
38. tbodyaccstdz: time domain variable of the standard deviation in accelerometer signal due to body motion in the z direction.
39. tgravityaccstdx: time domain variable of the standard deviation of gravity component of the accelerometer signal in the x direction.
40. tgravityaccstdy: time domain variable of the standard deviation of gravity component of the accelerometer signal in the y direction.
41. tgravityaccstdz: time domain variable of the standard deviation of gravity component of the accelerometer signal in the z direction.
42. tbodyaccjerkstdx: time domain variable of standard deviation in jerk estimated from the accelerometer signal in the x direction.
43. tbodyaccjerkstdy: time domain variable of standard deviation in jerk estimated from the accelerometer signal in the y direction.
44. tbodyaccjerkstdz: time domain variable of standard deviation in jerk estimated from the accelerometer signal in the z direction.
45. tbodygyrostdx: time domain variable of the standard deviation in gyroscope signal from bodily motion in the x direction.
46. tbodygyrostdy: time domain variable of the standard deviation in gyroscope signal from bodily motion in the y direction.
47. tbodygyrostdz: time domain variable of the standard deviation in gyroscope signal from bodily motion in the z direction.
48. tbodygyrojerkstdx: time domain variable of the standard deviation of jerk estimated by the gyroscope in the x direction.
49. tbodygyrojerkstdy: time domain variable of the standard deviation of jerk estimated by the gyroscope in the y direction.
50. tbodygyrojerkstdz: time domain variable of the standard deviation of jerk estimated by the gyroscope in the z direction.
51. tbodyaccmagstd: time domain variable of the standard deviation of the magnitude of acceleration due to bodily motion.
52. tgravityaccmagstd: time domain variable of the standard deviation of the magnitude of acceleration due to gravity.
53. tbodyaccjerkmagstd: time domain variable of the standard deviation of the magnitude of acceleration due to jerk.
54. tbodygyromagstd: time domain variable of the standard deviation of the magnitude of gyroscopic motion.
55. tbodygyrojerkmagstd: time domain variable of the standard deviation of the magnitude of gyroscopic motion.
56. fbodyaccstdx: frequency domain variable of the standard deviation in the accelerometer signal in the x direction due to body motion.
57. fbodyaccstdy: frequency domain variable of the standard deviation in the accelerometer signal in the y direction due to body motion.
58. fbodyaccstdz: frequency domain variable of the standard deviation in the accelerometer signal in the z direction due to body motion.
59. fbodyaccjerkstdx: frequency domain variable of the standard deviation in the accelerometer signal in the x direction due to jerk.
60. fbodyaccjerkstdy: frequency domain variable of the standard deviation in the accelerometer signal in the y direction due to jerk.
61. fbodyaccjerkstdz: frequency domain variable of the standard deviation in the accelerometer signal in the z direction due to jerk.
62. fbodygyrostdx: frequency domain variable of the standard deviation in the gyroscope signal in the x direction due to body motion.
63. fbodygyrostdy: frequency domain variable of the standard deviation in the gyroscope signal in the y direction due to body motion.
64. fbodygyrostdz: frequency domain variable of the standard deviation in the gyroscope signal in the z direction due to body motion.
65. fbodyaccmagstd: frequency domain variable of the standard deviation of the magnitude of acceleration from body movement.
66. fbodybodyaccjerkmagstd: frequency domain variable of the standard deviation of the magnitude of body acceleration due to jerk.
67. fbodybodygyromagstd: frequency domain variable of the standard deviation of the magnitude of the gyroscope signal from body movement.
68. fbodybodygyrojerkmagstd: frequency domain variable of the standard deviation of the magnitude of the body gyroscope signal from jerk.
