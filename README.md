# Getting and cleaning data project

This repository will contain

1. 'README.md' This file provides info on the data set
2. 'run_analysis.R' This is the R script that was used to create the independent data set with the following steps 
   -Merges the training and the test sets to create one data set.
   -Extracts only the measurements on the mean and standard deviation for each measurement.
   -Uses descriptive activity names to name the activities in the data set
   -Appropriately labels the data set with descriptive variable names.
   -From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
3. 'Codebook.md' this file explains the variables and contents of the dataset
4. 'CompleteDataSet.txt' This contains the dataset requested in the question

# Data Source

The data comes from the UCI Machine Learning Repository and can be found [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). They carried out experiments with 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

