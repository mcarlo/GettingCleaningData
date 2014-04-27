# Getting and Cleaning Data Assessment: Merging and Subsetting Data
# This script reads in CellPhoneData, produces a tidy data set, and produces a
# second data set based only on mean values.

# Part of this script makes use of the data.table package. Make sure it is installed
# and attached prior to running the script.

#install.packages("data.table")
#library("data.table")

# Set your working directory to the folder containing the data files
# setwd("D:/DataScience/CleaningData")

# Read in training data, training activity codes, and training subject ids
X_train <- read.table("X_train.txt", quote="\"")
y_train <- read.table("y_train.txt", quote="\"")
subject_train<- read.table("subject_train.txt", quote="\"")

# Read in test data, test activity codes, and test subject ids
X_test <- read.table("X_test.txt", quote="\"")
y_test <- read.table("y_test.txt", quote="\"")
subject_test<- read.table("subject_test.txt", quote="\"")

# Replace activity codes with appropriate, descriptive activity names 
activity_labels <- read.table("activity_labels.txt", quote="\"")
features <- read.table("features.txt", quote="\"")
colnames(features) <- c("dataColumn","dataLabel")
attach(features)

# Assign column names to training and testing datasets
colnames(X_train) <- dataLabel
colnames(X_test) <- dataLabel

# Extract only the measurements on the mean and standard deviation for each measurement. 
relevantLabels <- c("-mean\\()","-std\\()")
relevantColumns <- unique (grep(paste(relevantLabels,collapse="|"),dataLabel, value=TRUE))
trainData <- X_train[,relevantColumns]

dat = as.data.table(y_train)
dat2 = as.data.table(activity_labels)
train_Activity <- merge(dat, dat2, by = "V1", all=TRUE)
train <- cbind(subject_train,train_Activity$V2,trainData)
colnames(train)[1:2] <- c("subject","activity")

testData <- X_test[,relevantColumns]

dat3 = as.data.table(y_test)
test_Activity <- merge(dat3, dat2, by = "V1", all=TRUE)
test <- cbind(subject_test,test_Activity$V2,testData)
colnames(test)[1:2] <- c("subject","activity")

# Merge the training and the test sets to create one data set.
mergedData <- merge(train,test, all = TRUE)

# Create a second, independent tidy data set with the average of each variable for each activity and each subject. 
meanLabels <- c("subject","activity","-mean\\()")
meanColumns <- unique (grep(paste(meanLabels,collapse="|"),colnames(mergedData), value=TRUE))
meanData <- mergedData[,meanColumns]
colnames(meanData) <- gsub("-mean\\()","",colnames(meanData))

write.csv(meanData,"meanData.txt")