library(dplyr)

## loads data.frame of activities
loadActivities <- function(dataRoot) {
  activitiesFile <- paste0(dataRoot, "activity_labels.txt")
  read.table(activitiesFile)
}

## Renames variables to meaningful names
renameVariables <- function(dataset) {
  rename(dataset, index = V1, activity = V2)
}

# Retrieves an activity name for a given index
retrieveActivity <- function(dataset, index) {
  dataset[dataset$index == index,]$activity
}
