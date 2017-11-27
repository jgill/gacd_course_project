# Getting and Cleaning Data Course Project Codebook

## Dataset Generated
`meanVarBySubjectActivity.txt` is generated with the following changes
made to features available in the original dataset:

### Variables
subject - identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

activity - descriptive activity name

Each mean and standard variable has been cleaned from it's orginal form to a one without `-` or `()`. E.g.
`tBodyAcc-mean()-X` becomes `tBodyAccmeanX`. See https://github.com/jgill/gacd_course_project/blob/master/features.R#L23 for more details. The cleanName variable in the generated dataset contains the mean of that variable for each subject and activity.

| originalName              |   cleanName            |
|--------------------------:|-----------------------:|
| tBodyAcc-mean()-X            | tBodyAccmeanX |
| tBodyAcc-mean()-Y            | tBodyAccmeanY |
| tBodyAcc-mean()-Z            | tBodyAccmeanZ |
| tBodyAcc-std()-X             | tBodyAccstdX |
| tBodyAcc-std()-Y             | tBodyAccstdY |
| tBodyAcc-std()-Z             | tBodyAccstdZ |
| tGravityAcc-mean()-X         | tGravityAccmeanX |
| tGravityAcc-mean()-Y         | tGravityAccmeanY |
| tGravityAcc-mean()-Z         | tGravityAccmeanZ |
| tGravityAcc-std()-X          | tGravityAccstdX |
| tGravityAcc-std()-Y          | tGravityAccstdY |
| tGravityAcc-std()-Z          | tGravityAccstdZ |
| tBodyAccJerk-mean()-X        | tBodyAccJerkmeanX |
| tBodyAccJerk-mean()-Y        | tBodyAccJerkmeanY |
| tBodyAccJerk-mean()-Z        | tBodyAccJerkmeanZ |
| tBodyAccJerk-std()-X         | tBodyAccJerkstdX |
| tBodyAccJerk-std()-Y         | tBodyAccJerkstdY |
| tBodyAccJerk-std()-Z         | tBodyAccJerkstdZ |
| tBodyGyro-mean()-X           | tBodyGyromeanX |
| tBodyGyro-mean()-Y           | tBodyGyromeanY |
| tBodyGyro-mean()-Z           | tBodyGyromeanZ |
| tBodyGyro-std()-X            | tBodyGyrostdX |
| tBodyGyro-std()-Y            | tBodyGyrostdY |
| tBodyGyro-std()-Z            | tBodyGyrostdZ |
| tBodyGyroJerk-mean()-X       | tBodyGyroJerkmeanX |
| tBodyGyroJerk-mean()-Y       | tBodyGyroJerkmeanY |
| tBodyGyroJerk-mean()-Z       | tBodyGyroJerkmeanZ |
| tBodyGyroJerk-std()-X        | tBodyGyroJerkstdX |
| tBodyGyroJerk-std()-Y        | tBodyGyroJerkstdY |
| tBodyGyroJerk-std()-Z        | tBodyGyroJerkstdZ |
| tBodyAccMag-mean()          | tBodyAccMagmean |
| tBodyAccMag-std()           | tBodyAccMagstd |
| tGravityAccMag-mean()       | tGravityAccMagmean |
| tGravityAccMag-std()        | tGravityAccMagstd |
| tBodyAccJerkMag-mean()      | tBodyAccJerkMagmean |
| tBodyAccJerkMag-std()       | tBodyAccJerkMagstd |
| tBodyGyroMag-mean()         | tBodyGyroMagmean |
| tBodyGyroMag-std()          | tBodyGyroMagstd |
| tBodyGyroJerkMag-mean()     | tBodyGyroJerkMagmean |
| tBodyGyroJerkMag-std()      | tBodyGyroJerkMagstd |
| fBodyAcc-mean()-X            | fBodyAccmeanX |
| fBodyAcc-mean()-Y            | fBodyAccmeanY |
| fBodyAcc-mean()-Z            | fBodyAccmeanZ |
| fBodyAcc-std()-X             | fBodyAccstdX |
| fBodyAcc-std()-Y             | fBodyAccstdY |
| fBodyAcc-std()-Z             | fBodyAccstdZ |
| fBodyAccJerk-mean()-X        | fBodyAccJerkmeanX |
| fBodyAccJerk-mean()-Y        | fBodyAccJerkmeanY |
| fBodyAccJerk-mean()-Z        | fBodyAccJerkmeanZ |
| fBodyAccJerk-std()-X         | fBodyAccJerkstdX |
| fBodyAccJerk-std()-Y         | fBodyAccJerkstdY |
| fBodyAccJerk-std()-Z         | fBodyAccJerkstdZ |
| fBodyGyro-mean()-X           | fBodyGyromeanX |
| fBodyGyro-mean()-Y           | fBodyGyromeanY |
| fBodyGyro-mean()-Z           | fBodyGyromeanZ |
| fBodyGyro-std()-X            | fBodyGyrostdX |
| fBodyGyro-std()-Y            | fBodyGyrostdY |
| fBodyGyro-std()-Z            | fBodyGyrostdZ |
| fBodyAccMag-mean()          | fBodyAccMagmean |
| fBodyAccMag-std()           | fBodyAccMagstd |
| fBodyBodyAccJerkMag-mean()  | fBodyBodyAccJerkMagmean |
| fBodyBodyAccJerkMag-std()   | fBodyBodyAccJerkMagstd |
| fBodyBodyGyroMag-mean()     | fBodyBodyGyroMagmean |
| fBodyBodyGyroMag-std()      | fBodyBodyGyroMagstd |
| fBodyBodyGyroJerkMag-mean() | fBodyBodyGyroJerkMagmean |
| fBodyBodyGyroJerkMag-std()  | fBodyBodyGyroJerkMagstd |

For more details regarding the original variables please see `features_info.txt` which is available in the downloaded project dataset.
