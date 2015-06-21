#Codebook for Getting and Cleaning Data Project
## Study Design
This data collection is the collection of the aggregate mean of each selected feature of the data collected from the accelerometers from the Samsung Galaxy S smartphone. 

The aggregate mean of each variable is calculated for each activity and each subject. There is a total of 30 subjects, and a total of 6 activities for each subject.

A full description of the original data is available here:

[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The raw data used for creating this collection can be found here:

[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

A thorough explanation of steps done in order to get this data collection is described in README.md

## Variables
###SubjectId
Identifier of the subject who perform the activity
###Activity
The activity performed by the subject

1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING

###tBodyAcc.mean.X
Mean value of the body acceleration signals in X direction

###tBodyAcc.mean.Y
Mean value of the body acceleration signals in Y direction

###tBodyAcc.mean.Z
Mean value of the body acceleration signals in Z direction

###tBodyAcc.std.X
Standard deviation value of the body acceleration signals in X direction

###tBodyAcc.std.Y
Standard deviation value of the body acceleration signals in Y direction

###tBodyAcc.std.Z
Standard deviation value of the body acceleration signals in Z direction

###tGravityAcc.mean.X
Mean value of the gravity acceleration signals in X direction

###tGravityAcc.mean.Y
Mean value of the gravity acceleration signals in Y direction

###tGravityAcc.mean.Z
Mean value of the gravity acceleration signals in Z direction

###tGravityAcc.std.X
Standard deviation value of the gravity acceleration signals in X direction

###tGravityAcc.std.Y
Standard deviation value of the gravity acceleration signals in Y direction

###tGravityAcc.std.Z
Standard deviation value of the gravity acceleration signals in Z direction

###tBodyAccJerk.mean.X
Mean value of Jerk signals of the body linear acceleration in X direction.

###tBodyAccJerk.mean.Y
Mean value of Jerk signals of the body linear acceleration in Y direction.

###tBodyAccJerk.mean.Z
Mean value of Jerk signals of the body linear acceleration in Z direction.

###tBodyAccJerk.std.X
Standard deviation value of Jerk signals of the body linear acceleration in X direction.

###tBodyAccJerk.std.Y
Standard deviation value of Jerk signals of the body linear acceleration in Y direction.

###tBodyAccJerk.std.Z
Standard deviation value of Jerk signals of the body linear acceleration in Z direction.

###tBodyGyro.mean.X
Mean value of the angular velocity in X direction

###tBodyGyro.mean.Y
Mean value of the angular velocity in Y direction
###tBodyGyro.mean.Z
Mean value of the angular velocity in Z direction
###tBodyGyro.std.X
Standard deviation value of the angular velocity in X direction

###tBodyGyro.std.Y
Standard deviation value of the angular velocity in Y direction

###tBodyGyro.std.Z
Standard deviation value of the angular velocity in Z direction

###tBodyGyroJerk.mean.X
Mean value of Jerk signals of the angular velocity in X direction.

###tBodyGyroJerk.mean.Y
Mean value of Jerk signals of the angular velocity in Y direction.

###tBodyGyroJerk.mean.Z
Mean value of Jerk signals of the angular velocity in Z direction.

###tBodyGyroJerk.std.X
Standard deviation value of Jerk signals of the angular velocity in X direction.

###tBodyGyroJerk.std.Y
Standard deviation value of Jerk signals of the angular verlocity in Y direction.

###tBodyGyroJerk.std.Z
Standard deviation value of Jerk signals of the angular verlocity in Z direction.

###tBodyAccMag.mean
Mean value of magnitude of the three-dimensional body acceleration signals.

###tBodyAccMag.std
Standard deviation value of magnitude of the three-dimensional body acceleration signals.

###tGravityAccMag.mean
Mean value of magnitude of the three-dimensional gravity acceleration signals.

###tGravityAccMag.std
Standard deviation value of magnitude of the three-dimensional gravity acceleration signals.

###tBodyAccJerkMag.mean
Mean value of magnitude of the Jerk signals of body acceleration signals.

###tBodyAccJerkMag.std
Standard deviation value of magnitude of the Jerk signals of body acceleration signals.

###tBodyGyroMag.mean
Mean value of magnitude of the angular velocity.

###tBodyGyroMag.std
Standard deviation value of magnitude of the angular velocity.

###tBodyGyroJerkMag.mean
Mean value of magnitude of the Jerk signals of the angular velocity.

###tBodyGyroJerkMag.std
Standard deviation value of magnitude of the Jerk signals of the angular velocity.

###fBodyAcc.mean.X
Mean value of the body acceleration signals in X direction

###fBodyAcc.mean.Y
Mean value of the body acceleration signals in Y direction

###fBodyAcc.mean.Z
Mean value of the body acceleration signals in Z direction

###fBodyAcc.std.X
Standard deviation value of the body acceleration signals in X direction

###fBodyAcc.std.Y
Standard deviation value of the body acceleration signals in Y direction

###fBodyAcc.std.Z
Standard deviation value of the body acceleration signals in Z direction

###fBodyAccJerk.mean.X
Mean value of Jerk signals of the body linear acceleration in X direction.

###fBodyAccJerk.mean.Y
Mean value of Jerk signals of the body linear acceleration in Y direction.

###fBodyAccJerk.mean.Z
Mean value of Jerk signals of the body linear acceleration in Z direction.

###fBodyAccJerk.std.X
Standard deviation value of Jerk signals of the body linear acceleration in X direction.

###fBodyAccJerk.std.Y
Standard deviation value of Jerk signals of the body linear acceleration in Y direction.

###fBodyAccJerk.std.Z
Standard deviation value of Jerk signals of the body linear acceleration in Z direction.

###fBodyGyro.mean.X
Mean value of the angular velocity in X direction

###fBodyGyro.mean.Y
Mean value of the angular velocity in Y direction

###fBodyGyro.mean.Z
Mean value of the angular velocity in Z direction

###fBodyGyro.std.X
Standard deviation value of the angular velocity in X direction

###fBodyGyro.std.Y
Standard deviation value of the angular velocity in Y direction

###fBodyGyro.std.Z
Standard deviation value of the angular velocity in Z direction

###fBodyAccMag.mean
Mean value of magnitude of the three-dimensional body acceleration signals.

###fBodyAccMag.std
Standard deviation value of magnitude of the three-dimensional body acceleration signals.

###fBodyBodyAccJerkMag.mean
Mean value of magnitude of the Jerk signals of body acceleration signals.

###fBodyBodyAccJerkMag.std
Standard deviation value of magnitude of the Jerk signals of body acceleration signals.

###fBodyBodyGyroMag.mean
Mean value of magnitude of the angular velocity.

###fBodyBodyGyroMag.std
Standard deviation value of magnitude of the angular velocity.

###fBodyBodyGyroJerkMag.mean
Mean value of magnitude of the Jerk signals of the angular velocity.

###fBodyBodyGyroJerkMag.std
Standard deviation value of magnitude of the Jerk signals of the angular velocity.

## Notes
Variables with prefix 't' are time domain signals.

Variables with prefix 'f' are frequency domain signals

