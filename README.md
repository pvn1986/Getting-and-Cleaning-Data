# Getting-and-Cleaning-Data - Course Project

# Introduction

This repository is hosting the R code for the assignment of "Getting and Cleaning Data" course. The purpose of this project is to demonstrate the collection, work with, and cleaning of this data set. Tidy data have been prepared so can be used for later analysis.

# Data Set

The data set are avaible in zip file  "getdata-projectfiles-UCI HAR Dataset.zip"  which has been downloaded from UCI.

# Execution and files

The Data Set has been stored in UCI HAR Dataset/ directory.

The CodeBook.md describes the variables, the data, and the work that has been performed to clean up the data.

The run_analysis.R is the script that has been used for this work, which does the following activities.
  1. Dowanload the zip file and load the textfiles & datasets
  2. Merge the testing data and the training data:
  3. Extracts the measurements on the mean and standard deviation for each measurement.
  4. Labels the data set with descriptive variable names. 
  5. Create tidy data set with the average of each variable for each activity and each subject.
  
