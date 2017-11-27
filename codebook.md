# Getting and Cleaning Data Course Project Codebook

## Dataset Generated
`meanVarBySubjectActivity.txt` is generated with the following changes
made to features available in the original dataset:

Variable
subject - identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
activity - descriptive activity name

Each mean and standard variable has been cleaned from it's orginal form to a one without `-` or `()`. E.g.
`tBodyAcc-mean()-X` becomes `tBodyAccmeanX`. See https://github.com/jgill/gacd_course_project/blob/master/features.R#L23 for more details.
