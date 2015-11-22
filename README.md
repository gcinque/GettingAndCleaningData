## Preparation
In line 1 to 15 the script prepares the file name and path for dowloading the dataset and unzip it in local folder
## Step 1: Merges the training and the test sets to create one data set.
From line 17 to 33 the files for the Train and Test set for Subject, Activities and features are loaded and stored in dataframes
## Step 2 Extracts only the measurements on the mean and standard deviation for each measurement.
Line 34 to 37 extract only the variables that contains mean or sd in the names
Line 40 to create a comprehesinve data set of Features, Subject and Activity
## Step 3 Uses descriptive activity names to name the activities in the data set
Line 44 to modify the name of the variables to make them more explicit
## Step 4 Appropriately labels the data set with descriptive variable names. 
Line 52 to 54 changes the Activity variable from a numeric to a factor describing the activity
## Step 5 From the data set in step 4, creates a second,independent tidy dataset
Line 56 to 64 Create the tidy dataset and save it as .txt
