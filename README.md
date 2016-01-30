# Getting and Cleaning Data - Course Project

This is the course project for the Coursera Getting and Cleaning Data course.

The R script, `run_analysis.R`, does the following:

1. Download the UCI HAR dataset if it does not already exist in the working directory
2. Load the activity and feature information from the dataset
3. Loads both the training and test datasets, keeping only those columns which reflect a mean or standard deviation
4. Loads the activity and subject data for each dataset, and merges those columns with the combined training and test datasets
5. Merges the two datasets
6. Converts the `activity` and `subject` columns into factors
7. Creates a tidy dataset that consists of the average (mean) value of each variable for each subject and activity pair.

The end result is shown in the file `tidy.txt`.

The codebook, `CodeBook.md`, contains information about the source dataset as well as the variables which make up the tidy dataset.
