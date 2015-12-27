---
title: "Course Project for Getting and Cleaning Data"
date: "December 27, 2015"
output: html_document
---

# About the dataset:

This project uses the "Human Activity Recognition Usingn Smartphones" dataset from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The dataset is from 30 volunteers who wore a smartphone at the waist with accelerometer and gyroscope sensors while doing 6 types of activities.


# How the script works:

Data manipulations of the script...

1. Reads in six files from directory called "fitnessData" (for example, fitnessData/test/subject_test.txt), with three files in a "test" subdirectory and three in a "train" directory. Each directory has tables for the subject id, data value for each feature, and activity type.  

2. Combines the six files into a single dataframe

3. Creates a new dataframe with only values for "mean()" or "std() for each feature for each subject and activity

4. Creates a new dataframe with only the mean of "mean()" or "std() for each feature for each subject and activity

Final table (long format tidy dataset) with columns "subject", "activity", "feature", "value"."


# Code book:

## Column names:

subject = id of subject; total of thirty with ids 1-30

activity = acitvity performed; total of six (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)

feature = signal captured by accelerometer or gyroscope (or computed from these signals), described by a mean or standard deviation; total of 561 types of features (see section below to decode names)

mean = mean of each feature for a subject and activity

## Decoding feature names

**prefix:** 

X = x-axis component of signal

Y = y-axis component of signal

Z = z-axis component of signal

**suffix:** 

mean = mean

std = standard deviation

**core:** 

tBodyAcc-XYZ = body component of acceleration signal

tGravityAcc-XYZ = gravity component of acceleration signal

tBodyAccJerk-XYZ = jerk signal from the body linear acceleration derived in time

tBodyGyro-XYZ = (undefined in original data codebook)

tBodyGyroJerk-XYZ = jerk signal from the angular velocity derived in time

tBodyAccMag = magnitude of body component of acceleration signal calculated using the Euclidean norm

tGravityAccMag = magnitude of gravity component of acceleration signal calculated using the Euclidean norm

tBodyAccJerkMag = magnitude of jerk signal from the body liner acceleration calculated using the Euclidean norm

tBodyGyroMag = magnitude of (undefined in original data codebook)

tBodyGyroJerkMag = magnitude of jerk signal from the angular velocity calculated using the Euclidean norm

fBodyAcc-XYZ = frequency domain signal from Fast Fourier Transform applied to body component of acceleration signal

fBodyAccJerk-XYZ = frequency domain signal from Fast Fourier Transform applied to jerk signal from the body linear acceleration

fBodyGyro-XYZ = frequency domain signal from Fast Fourier Transform applied to (undefined in original data codebook)

fBodyAccMag = frequency domain signal from Fast Fourier Transform applied to magnitude of body component of acceleration signal

fBodyAccJerkMag = frequency domain signal from Fast Fourier Transform applied to magnitude of jerk signal from the body liner acceleration

fBodyGyroMag = frequency domain signal from Fast Fourier Transform applied to magnitude of (undefined in original data codebook)

fBodyGyroJerkMag = frequency domain signal from Fast Fourier Transform applied to magnitude of jerk signal from the angular velocity


