library(dplyr)
source('features.R')

dataRoot <- "./UCI HAR Dataset/"
if(!file.exists(dataRoot)) {
  stop("No datasets found")
}

## Merges experiments, activities and subjects datasets into single dataset
mergeData <- function(datasets) {
  activities <- rename(datasets$activities, activity=V1)
  subjects <- rename(datasets$subjects, subject=V1)
  cbind(subjects, activities, datasets$experiments)
}


## Loads experiments, activities and subjects datasets for train or test datasets
loadDatasets <- function(dataRoot, datasetType) {
  datasetLocation <- paste0(dataRoot, datasetType, "/")

  experimentsName <- paste0(datasetLocation, "X_", datasetType, ".txt")
  activitiesName <- paste0(datasetLocation, "y_", datasetType, ".txt")
  subjectsName <- paste0(datasetLocation, "subject_", datasetType, ".txt")

  experiments <- read.table(experimentsName)
  activities <- read.table(activitiesName)
  subjects <- read.table(subjectsName)
  list("experiments" = experiments, "activities" = activities, "subjects" = subjects)
}

## Load test datasets
testDatasets <- loadDatasets(dataRoot, "test")
mergedTestExperiments <- mergeData(testDatasets)

## Load train datasets
trainDatasets <- loadDatasets(dataRoot, "train")
mergedTrainExperiments <- mergeData(trainDatasets)

## Combine train and test datasets
combinedExperiments <- rbind(mergedTrainExperiments, mergedTestExperiments)

# Extracts only the measurements on the mean and standard deviation for each measurement.
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

