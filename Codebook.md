# Download and Load data files

This dataset is derived from the "Human Activity Recognition Using Smartphones Data Set" which was originally made avaiable here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
Downlload the above mentioned zip file, unzip and load the following data
  Data Description
    We need to load the features and labels as the common data descriptions for both testing data and training data.
  Testing Data
    consists of subject data, x data and y data.
  Training Data
    consists of subject data, x data and y data.
    
#  Merge the testing data and the training data:
    Since the dataset consists of 3 parts (x, y and subject), the testing data and the training data should be combined repesctively. Then, the training data are appended to the tail of the testing data.

# Extracts only the measurements on the mean and standard deviation for each measurement.
  Put the raw data into dplyr data table
  mean() and std() column list, need to add up 2 (Subject, Activity)
  
# Uses descriptive activity names to name the activities in the data set
 Change the Activity to charater class
 
# Create tidy dataset
 Label the dataset with descriptive variable names and create tidydata.txt
 
