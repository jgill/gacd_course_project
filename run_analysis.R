library(dplyr)

dataRoot <- "./UCI HAR Dataset/"
if(!file.exists(dataRoot)) {
  stop("No datasets found")
}

source('datasets.R')
## 1. Merges the training and the test sets to create one data set.
## Load test datasets
testDatasets <- loadDatasets(dataRoot, "test")
mergedTestExperiments <- mergeData(testDatasets)

## Load train datasets
trainDatasets <- loadDatasets(dataRoot, "train")
mergedTrainExperiments <- mergeData(trainDatasets)

## Combine train and test datasets
combinedExperiments <- rbind(mergedTrainExperiments, mergedTestExperiments)

## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
source('features.R')
features <- loadFeatures(dataRoot)
features <- rename(features, index = V1, name = V2)
featuresWithVIndex <- withVIndex(features)
meanStdFeatures <- nameMatching(featuresWithVIndex, "mean\\(\\)|std\\(\\)")
meanStdFeatures <- withCleanName(meanStdFeatures)

meanStdMeasurements <- select(combinedExperiments, c("subject", "activity", meanStdFeatures$VIndex))

## 3. Uses descriptive activity names to name the activities in the data set
source('activities.R')
activities <- loadActivities(dataRoot)
activities <- renameVariables(activities)
meanStdMeasurements$activity <- sapply(meanStdMeasurements$activity, function(x) retrieveActivity(activities, x))

## 4. Appropriately labels the data set with descriptive variable names.
vcol <- grepl("^V", colnames(meanStdMeasurements))
colnames(meanStdMeasurements)[vcol] <- as.character(meanStdFeatures$cleanName)

## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
## Group by subject and activity
subjectActivities <- group_by(meanStdMeasurements, subject, activity)

## Dynamically generate mean columns from feature names
vars <- sapply(meanStdFeatures$cleanName, function(x) { quo(mean(!!as.name(x))) })

## Summarize mean variables for each subject and activity
meanVarBySubjectActivity <- summarize(subjectActivities, !!! vars)

## Write new tidy dataset to text file
write.table(meanVarBySubjectActivity, "./meanVarBySubjectActivity.txt", row.name=FALSE)
