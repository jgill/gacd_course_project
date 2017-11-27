library(dplyr)

dataRoot <- "./UCI HAR Dataset/"
if(!file.exists(dataRoot)) {
  stop("No datasets found")
}

source('datasets.R')
## Load test datasets
testDatasets <- loadDatasets(dataRoot, "test")
mergedTestExperiments <- mergeData(testDatasets)

## Load train datasets
trainDatasets <- loadDatasets(dataRoot, "train")
mergedTrainExperiments <- mergeData(trainDatasets)

## Combine train and test datasets
combinedExperiments <- rbind(mergedTrainExperiments, mergedTestExperiments)

# Extracts only the measurements on the mean and standard deviation for each measurement.
source('features.R')
features <- loadFeatures(dataRoot)
features <- rename(features, index = V1, name = V2)
featuresWithVIndex <- withVIndex(features)
meanStdFeatures <- nameMatching(featuresWithVIndex, "mean\\(\\)|std\\(\\)")
meanStdFeatures <- withCleanName(meanStdFeatures)

meanStdMeasurements <- select(combinedExperiments, c("subject", "activity", meanStdFeatures$VIndex))

# Uses descriptive activity names to name the activities in the data set
source('activities.R')
activities <- loadActivities(dataRoot)
activities <- renameVariables(activities)
meanStdMeasurements$activity <- sapply(meanStdMeasurements$activity, function(x) retrieveActivity(activities, x))

# Appropriately labels the data set with descriptive variable names.
vcol <- grepl("^V", colnames(meanStdMeasurements))
colnames(meanStdMeasurements)[vcol] <- as.character(meanStdFeatures$cleanName)

print(head(meanStdMeasurements, 2))
print(tail(meanStdMeasurements, 2))

# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

