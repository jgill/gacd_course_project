# gacd_course_project
Getting and Cleaning Data Course Project

## Getting Started
These instructions will get a copy of the project code and dataset installed on your computer and enable you to create a tidy version of the dataset.

### Prerequisites
The project is built using the following R version
```
R version 3.4.1 (2017-06-30) -- "Single Candle"
```
Please also ensure that DPLYR package is installed
```
install.packages('dplyr')
```
### Installing
Clone the project to a directory of your choice
```
git clone git@github.com:jgill/gacd_course_project.git
```

Change directory to project directory
```
cd gacd_course_project
```

Download project dataset from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.
```
curl https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip > UCI_HAR_Dataset.zip
```

Unzip project dataset
```
unzip UCI_HAR_Dataset.zip
```

Execute the analysis script
```
Rscript run_analysis.R
```

### Deliverable
Upon completion of the analysis script a file `meanVarBySubjectActivity.txt` is created in the project directory

## Dataset used in project
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L.
Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition
Using Smartphones. 21th European Symposium on Artificial Neural
Networks, Computational Intelligence and Machine Learning, ESANN 2013.
Bruges, Belgium 24-26 April 2013. Retrived from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
