# Getting and Cleaning Data - November
## Clean the Enviroment form previous objects
rm(list=ls())

# File zip with Dataset 
fileURL = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

# Download the file and unzip in the local folder
# Find the current folder 
Folder_path <- getwd()
download.file(fileURL, destfile = "data.zip", method = 'curl')
unzip("data.zip")

# Update the folder_path 
Folder_path <- file.path(Folder_path, "UCI HAR Dataset")

# STEP 1. Merges the training and the test sets to create one data set.

# Read and Merge the Activity files and concatenating by row
ActivityTest  <- read.table(file.path(Folder_path, "test" , "Y_test.txt" ),header = FALSE)
ActivityTrain <- read.table(file.path(Folder_path, "train", "Y_train.txt"),header = FALSE)
Activity<- rbind(ActivityTrain,ActivityTest)

# Read and Merge the Subject files and concatenating by row
SubjectTrain <- read.table(file.path(Folder_path, "train", "subject_train.txt"),header = FALSE)
SubjectTest  <- read.table(file.path(Folder_path, "test" , "subject_test.txt"),header = FALSE)
Subject <- rbind(SubjectTrain, SubjectTest)

# Read and Merge the Features files and concatenating by row
FeaturesTest  <- read.table(file.path(Folder_path, "test" , "X_test.txt" ),header = FALSE)
FeaturesTrain <- read.table(file.path(Folder_path, "train", "X_train.txt"),header = FALSE)
Features<- rbind(FeaturesTrain, FeaturesTest)

# Step 2 Extracts only the measurements on the mean and standard deviation for each measurement. 
# 2.1 Set names to variables from V1, V2 .. to meaningful names
names(Features)<- read.table(file.path(Folder_path, "features.txt"),head=FALSE)$V2
names(Subject)<-c("Subject")
names(Activity)<- c("Activity")

# Step 2 Extracts only the measurements on the mean and standard deviation for each measurement. 
# Extract the name that contains Mean and Sd
interestName <- names(Features)[grep("mean\\(\\)|std\\(\\)", names(Features))]
Features <- Features[interestName]
# Merge the various datasets
names(Subject)<-c("Subject")
names(Activity)<- c("Activity")
Data <- cbind(Features, Subject, Activity)

# Step 3 Uses descriptive activity names to name the activities in the data set
names(Data)<-gsub("^t", "Time", names(Data))
names(Data)<-gsub("^f", "Frequency", names(Data))
names(Data)<-gsub("Acc", "Acelerometer", names(Data))
names(Data)<-gsub("Gyro", "Gyroscope", names(Data))
names(Data)<-gsub("Mag", "Magnitude", names(Data))
names(Data)<-gsub("BodyBody", "Body", names(Data))

# Step 4 Appropriately labels the data set with descriptive variable names. 
activityLabels <- read.table(file.path(Folder_path, "activity_labels.txt"),header = FALSE)
Data$Activity <- activityLabels[Data$Activity,2]

#Step 5
# From the data set in step 4, creates a second,independent tidy data set with the average (mean)
# of each variable for each activity and each subject.

library(plyr);
tidydata<-aggregate(. ~Subject + Activity, Data, mean)
tidydata<-tidydata[order(tidydata$Subject,tidydata$Activity),]
write.table(tidydata, file = "tidydataset.txt",row.name=FALSE)
View(tidydata)

