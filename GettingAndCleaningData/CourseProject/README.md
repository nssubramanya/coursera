---
title: "README"
date: "12/10/2017"
output: 
  html_document:
    toc: true # table of content true
    toc_depth: 3  # upto three depths of headings (specified by #, ## and ###)
    number_sections: true  ## if you want number sections at each table header
    theme: united  # many options for theme, this one is my favorite.
    highlight: tango  # specifies the syntax highlighting style
#    css: my.css   # you can add your custom css, should be in same folder
---

# Getting and Cleaning Data Course Project

One of the most exciting areas in all of data science right now is wearable computing - see for example [this article](http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/)

Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 

# Data Set Information

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.  

Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity have been captured at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The dataset includes the following files:

- `'README.txt'` - Main Readme file of dataset
- `'features_info.txt'`: Shows information about the variables used on the feature vector.
- `'features.txt': List of all features.
- `'activity_labels.txt'`: Links the class labels with their activity name.
- `'train/X_train.txt'`: Training set.
- `'train/y_train.txt'`: Training labels.
- `'test/X_test.txt'`: Test set.
- `'test/y_test.txt'`: Test labels.
- `'train/subject_train.txt'`, `'test/subject_test.txt'`: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

# Course Project Activity Detail

The purpose of this project is to demonstrate the process of collecting, working with, and cleaning a data set.

## Activities performed
1. Merge the training and the test sets to create one data set.
1. Extract only the measurements on the mean and standard deviation for each measurement.
1. Use of  descriptive activity names to name the activities in the data set
1. Appropriately labelled the data set with descriptive variable names.
1. An independent tidy data set with the average of each variable for each activity and each subject is created.

## Files in the repository
1. `README.md` - This file
1. `Codebook.md` - This file describes the `Tidy Dataset` created and the detailed process used to create it
1. `run_analysis.R` - Code for processing & tidying the original data 
1. `tidydata.txt` - Tidied dataset with only the averages for Mean & SD data for each subject



