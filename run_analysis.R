library(dplyr)

dataRoot <- "./UCI HAR Dataset/"
if(!file.exists(dataRoot)) {
  stop("No datasets found")
}

# Merges the training and the test sets to create one data set.
mergeData <- function(datasets) {
  activities <- rename(datasets$activities, activity=V1)
  subjects <- rename(datasets$subjects, subject=V1)
  cbind(subjects, activities, datasets$experiments)
}

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

testDatasets <- loadDatasets(dataRoot, "test")
mergedTestExperiments <- mergeData(testDatasets)

trainDatasets <- loadDatasets(dataRoot, "train")
mergedTrainExperiments <- mergeData(trainDatasets)
print(dim(mergedTrainExperiments))
print(head(mergedTrainExperiments, 2))
print(tail(mergedTrainExperiments, 2))

# Extracts only the measurements on the mean and standard deviation for each measurement.
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive variable names.
# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

