# GettingAndCleaningData Week 2 Peer Assesment
This file describes the variables, the data, and the transformations and/or work that are performed to clean up the data.

1. The raw data is acquired from the URL https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. The data is a zip file containing a series of folders
3. The folder contains 28 files organized. Some files contains Data Points (divided in Train and Test set), Some other files contains Variables Names (e.g. Features, Subject and Activities) 
4. The description of the files is in the README.txt
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

The script to load, and manipulate the data is described extensivelly in the file README.md of this Repository.
[https://github.com/gcinque/GettingAndCleaningData/blob/master/README.md]
In brief:
1. Load the files in dataframes
2. Aggregate train and test dataset appending by row
3. Extracting only the variable of interest as specified by the assignement (i.e. variable that contain mean or standard dev)
4. Change the names of the data frame to easy to read names
5. aggreagte the dataframe in one tidy dataframe
6. save the result


