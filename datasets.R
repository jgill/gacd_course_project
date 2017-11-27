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
