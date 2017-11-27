library(dplyr)

## Imports list of features
loadFeatures <- function(dataRoot) {
  featuresFile <- paste0(dataRoot, "features.txt")
  read.table(featuresFile)
}

## Returns subset of features whose name match regex
nameMatching <- function(features, regex="mean\\(\\)|std\\(\\)") {
  mean.std.features <- grepl(regex, features$name)
  features[mean.std.features,]
}

## Returns list of feature column indices
##
## Indices are prepended with "V" so they can be used after
## importing experiments text file
as.VIndex <- function(features) {
  sapply(features$index, function(x){ paste0("V", x) } )
}

## Adds a VIndex column to our dataset
withVIndex <- function(features) {
  mutate(features, VIndex = as.VIndex(features))
}
