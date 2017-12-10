---
title: "CodeBook"
date: "12/10/2017"
output: 
  html_document:
    toc: true # table of content true
    toc_depth: 3  # upto three depths of headings (specified by #, ## and ###)
    number_sections: true  ## if you want number sections at each table header
    theme: united  # many options for theme, this one is my favorite.
    highlight: tango  # specifies the syntax highlighting style
---

This Codebook describes the data present in `tidydata.txt`. This data has been creted after Cleaning and Transforming the Activity data captured via the Samsung Galaxy phone by 30 subjects performing 6 different types of activities. Refer to the `README.md` file for more details

# Tidydata 
The file `tidydata.txt` contains the tidied data from the multiple source files of the dataset

## Variables

* `Subject`  
Unique identifier for the `Subject` (person performing the activity) - Values range from 1 to 30  

* `Activity`  
Numericlal Activity Identifier for the activity performed - Values range from 1 to 6  

* `Activity.Name`  
Name of the activity. It can take on the follwoing values-  

    - `WALKING`: Subject was walking
    - `WALIKING_UPSTAIRS`: Subject was Walking Upstairs
    - `WALKING_DOWNSTAIRS`: Subject was Walking Downstairs
    - `LAYING`: Subject was laying down at rest
    - `SITTING`: Subject was sitting down at rest
    - `STANDING`: Subject was standing at rest

## Average of Measurements
Out of 561 measurements, only the ones that contained Mean (`mean()`) and Standard Deviations (`std()`) have been considered, which results in 66 measurements.

The measurements are classified in two domains:
* Time-domain signals (variables prefixed by `TimeDomain`), resulting from the capture of accelerometer and gyroscope raw signals.

* Frequency-domain signals (variables prefixed by `FreqDomain`), resulting from the application of a Fast Fourier Transform (FFT) to some of the time-domain signals.

Variable names have be modified to ensure they are self-explanatory.

* `TimeDomainBodyAcceleration.Mean.X`
* `TimeDomainBodyAcceleration.Mean.Y`
* `TimeDomainBodyAcceleration.Mean.Z`
* `TimeDomainBodyAcceleration.StdDev.X`
* `TimeDomainBodyAcceleration.StdDev.Y`
* `TimeDomainBodyAcceleration.StdDev.Z`
* `TimeDomainGravityAcceleration.Mean.X`
* `TimeDomainGravityAcceleration.Mean.Y`
* `TimeDomainGravityAcceleration.Mean.Z`
* `TimeDomainGravityAcceleration.StdDev.X`
* `TimeDomainGravityAcceleration.StdDev.Y`
* `TimeDomainGravityAcceleration.StdDev.Z`
* `TimeDomainBodyAccelerationJerk.Mean.X`
* `TimeDomainBodyAccelerationJerk.Mean.Y`
* `TimeDomainBodyAccelerationJerk.Mean.Z`
* `TimeDomainBodyAccelerationJerk.StdDev.X`
* `TimeDomainBodyAccelerationJerk.StdDev.Y`
* `TimeDomainBodyAccelerationJerk.StdDev.Z`
* `TimeDomainBodyGyroscope.Mean.X`
* `TimeDomainBodyGyroscope.Mean.Y`
* `TimeDomainBodyGyroscope.Mean.Z`
* `TimeDomainBodyGyroscope.StdDev.X`
* `TimeDomainBodyGyroscope.StdDev.Y`
* `TimeDomainBodyGyroscope.StdDev.Z`
* `TimeDomainBodyGyroscopeJerk.Mean.X`
* `TimeDomainBodyGyroscopeJerk.Mean.Y`
* `TimeDomainBodyGyroscopeJerk.Mean.Z`
* `TimeDomainBodyGyroscopeJerk.StdDev.X`
* `TimeDomainBodyGyroscopeJerk.StdDev.Y`
* `TimeDomainBodyGyroscopeJerk.StdDev.Z`
* `TimeDomainBodyAccelerationMagnitude.Mean`
* `TimeDomainBodyAccelerationMagnitude.StdDev`
* `TimeDomainGravityAccelerationMagnitude.Mean`
* `TimeDomainGravityAccelerationMagnitude.StdDev`
* `TimeDomainBodyAccelerationJerkMagnitude.Mean`
* `TimeDomainBodyAccelerationJerkMagnitude.StdDev`
* `TimeDomainBodyGyroscopeMagnitude.Mean`
* `TimeDomainBodyGyroscopeMagnitude.StdDev`
* `TimeDomainBodyGyroscopeJerkMagnitude.Mean`
* `TimeDomainBodyGyroscopeJerkMagnitude.StdDev`
* `FreqDomainBodyAcceleration.Mean.X`
* `FreqDomainBodyAcceleration.Mean.Y`
* `FreqDomainBodyAcceleration.Mean.Z`
* `FreqDomainBodyAcceleration.StdDev.X`
* `FreqDomainBodyAcceleration.StdDev.Y`
* `FreqDomainBodyAcceleration.StdDev.Z`
* `FreqDomainBodyAccelerationJerk.Mean.X`
* `FreqDomainBodyAccelerationJerk.Mean.Y`
* `FreqDomainBodyAccelerationJerk.Mean.Z`
* `FreqDomainBodyAccelerationJerk.StdDev.X`
* `FreqDomainBodyAccelerationJerk.StdDev.Y`
* `FreqDomainBodyAccelerationJerk.StdDev.Z`
* `FreqDomainBodyGyroscope.Mean.X`
* `FreqDomainBodyGyroscope.Mean.Y`
* `FreqDomainBodyGyroscope.Mean.Z`
* `FreqDomainBodyGyroscope.StdDev.X`
* `FreqDomainBodyGyroscope.StdDev.Y`
* `FreqDomainBodyGyroscope.StdDev.Z`
* `FreqDomainBodyAccelerationMagnitude.Mean`
* `FreqDomainBodyAccelerationMagnitude.StdDev`
* `FreqDomainBodyAccelerationJerkMagnitude.Mean`
* `FreqDomainBodyAccelerationJerkMagnitude.StdDev`
* `FreqDomainBodyGyroscopeMagnitude.Mean`
* `FreqDomainBodyGyroscopeMagnitude.StdDev`
* `FreqDomainBodyGyroscopeJerkMagnitude.Mean`
* `FreqDomainBodyGyroscopeJerkMagnitude.StdDev`

_________________________________________________________________________________

# Operations performed
## Fetching Data
1. Fetch the data from the following URL. [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip]
1. Unzip the File and get the relevant Data folder.

## Read Data
Training Data contains 7352 rows and Test data contains 2947 rows

* `train_subject.txt` - Contains Training Subject ID, 1 per row. Type is Integer
* `y_test.txt` - Contains the Activity ID for which the training data is present. Type is Integer
* `X_train.txt` - Contains 561 columns of data for the training set. This is for the Activity specified in correspoinding row of `y_test.txt` and the subject specified in `train_subject.txt`

**Note:** Similar files in `test` data folder are also read in

* `activity_lables.txt` - Contains the names of the Activities, 1 per row
* `features.txt` - Contains names of the 561 features, 1 per row

## Merge Data
Merge the data from `training` and `test` data frames. First, bind the columns and in each of the training & test data frames loaded. Then combine the rows.  

Give appropriate column names to the merged dataframe.  

## Select columns with mean() and std()
Select only the columns that represent mean's and standard deviations.

## Transformations
### Rename Column Names
Rename the Column Names by applying followng rules-
1. Replace `BodyBody` by `Body`
1. Replace `f`, Frequence Domain Identifier by `FreqDomain`
1. Replace `t`, Time Domain Identifier by `TimeDomain`
1. Replace `mean() and `std()` with `Mean` and `StdDev`
1. Replace `Acc`, `Mag` and `Gyro` with full-names, `Acceleration`, `Magnitude` and `Gyroscope`
1. Names contained `-` as sepratator. Replace them with a Dot `.`

### Summarize
Group by `Subject` and `Activity` and find out summarize the mean of all the values. This will reduce the combined dataset of 10299 rows in to 180 rows (30 subjects x 6 Activities).

### Bring Activity Names
Activity Names are in a different data-frame. We need to merge/left-join the data frames to get the activity names to be listed along-side the activity IDs.

### Write-out the Tidy Data file
Finally, the data in the merged data frame with all transformations is written out to a text file.
