library(dplyr)

# Merges the training and the test sets to create one data set.
mergeData <- function(subjects, activities, experiments) {
  activities <- rename(activities, activity=V1)
  subjects <- rename(subjects, subject=V1)
  cbind(subjects, activities, experiments)
}

dataLocation <- "./UCI HAR Dataset/"
testDataLocation <- paste0(dataLocation, "test/")
testXDatasetName <- paste0(testDataLocation, "X_test.txt")
testActivityDatasetName <- paste0(testDataLocation, "y_test.txt")
testSubjectDatasetName <- paste0(testDataLocation, "subject_test.txt")

if(file.exists(testXDatasetName)) {
  testExperiments <- read.table(testXDatasetName)
  testActivities <- read.table(testActivityDatasetName)
  testSubjects <- read.table(testSubjectDatasetName)

  mergedTestExperiments <- mergeData(testSubjects, testActivities, testExperiments)
  print(dim(mergedTestX))
  print(head(mergedTestX, 2))
  print(tail(mergedTestX, 2))
}
# Extracts only the measurements on the mean and standard deviation for each measurement.
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive variable names.
# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

