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
meanStdFeatures <- nameMatching(features, "mean\\(\\)|std\\(\\)")
featuresVIndex <- as.VIndex(meanStdFeatures)

meanStdMeasurements <- select(combinedExperiments, c("subject", "activity", featuresVIndex))
print(dim(meanStdMeasurements))
head(meanStdMeasurements, 2)

# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive variable names.
# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

