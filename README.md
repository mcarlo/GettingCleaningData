GettingCleaningData
===================

Tidy data project for Coursera's "Getting and Cleaning Data" taught by Leek, Peng, and Caffo

This repo contains the required files for the class's peer assessment. It contains an R script, run_analysis.R, and a code book, CodeBook.md. 

The assignment pertains to creating and documenting two tidy data sets consisting of the cited Samsung cell phone data. The original data is already split into test and training subsets and need to be combined. The subject IDs and outcome IDs are in separate data files and have to be incorporated appropriately into the data.

Provided all the requisite data files are in your working directory, and provided you have installed and attached the data.table package, run_analysis.R does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

