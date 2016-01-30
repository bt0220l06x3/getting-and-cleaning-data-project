
# Getting and Cleaning Data 

NOTE: Much content from here was taken from the sources at [1] and [2]

## Course Project

Human Activity Recognition Using Smartphones Dataset [1]

## Source Experiment & Data Set

The source data set represents data collected from the accelerometers from the Samsung Galaxy S smartphone. The data set archive can be downloaded from:

Data Set URL: [UCI HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "Download UCI HAR Dataset ZIP Archive")

One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. 

The data is made available by Reyes-Ortiz, Anguita, Ghio, and Oneto from the
Smartlab Non Linear Complex Systems Laboratory in Genoa, Italy.

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

Use of this dataset in publications must be acknowledged by referencing the following publication [1].

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L.  Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

For more information please visit [2]

## Source Files

The source files we use to create the tidy data set from the extrated data archive are:

* `features_info.txt`: Shows information about the variables used on the feature vector.
* `features.txt`: List of all features.
* `activity_labels.txt`: Links the class labels with their activity name.
* `train/X_train.txt`: Training set.
* `train/y_train.txt`: Training labels.
* `test/X_test.txt`: Test set.
* `test/y_test.txt`: Test labels.

The following files are available for the train and test data. Their descriptions are equivalent.

* `train/subject_train.txt`: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

NOTE: We do not use the Inertial Signals from the source dataset to produce this tidy data set.

### Variables

Variables within the tidy data set are examined as follows (taken from [1]).

#### Identifiers

'subject' consists of the subjects who carried out the experiment are represented as a number from 1 to 30. This field is 

'activity' consists of the activities identified when measurements were observed with the following labels:

* `WALKING` (value `1`): Subject was walking during the test
* `WALKING_UPSTAIRS` (value `2`): Subject was walking up a staircase during the test
* `WALKING_DOWNSTAIRS` (value `3`): Subject was walking down a staircase during the test
* `SITTING` (value `4`): Subject was sitting during the test
* `STANDING` (value `5`): Subject was standing during the test
* `LAYING` (value `6`): Subject was laying down during the test

#### Features

The features selected for this dataset come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 'time' to denote time in the source dataset) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (timeBodyAcc-XYZ and timeGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (timeBodyAccJerk-XYZ and timeBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (timeBodyAccMag, timeGravityAccMag, timeBodyAccJerkMag, timeBodyGyroMag, tBodyGyroJerkMag).

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing freqBodyAcc-XYZ, freqBodyAccJerk-XYZ, freqBodyGyro-XYZ, freqBodyAccJerkMag, freqBodyGyroMag, freqBodyGyroJerkMag. (Note the 'freq' to indicate frequency domain signals).

Signals were used to estimate variables of the feature vector for each pattern: '*_[XYZ]$' is used to denote 3-axial signals in the X, Y and Z directions.

For each measurement the mean has been calculated.

* `timeBodyAccMeanX`
* `timeBodyAccMeanY`
* `timeBodyAccMeanZ`
* `timeBodyAccStdX`
* `timeBodyAccStdY`
* `timeBodyAccStdZ`
* `timeGravityAccMeanX`
* `timeGravityAccMeanY`
* `timeGravityAccMeanZ`
* `timeGravityAccStdX`
* `timeGravityAccStdY`
* `timeGravityAccStdZ`
* `timeBodyAccJerkMeanX`
* `timeBodyAccJerkMeanY`
* `timeBodyAccJerkMeanZ`
* `timeBodyAccJerkStdX`
* `timeBodyAccJerkStdY`
* `timeBodyAccJerkStdZ`
* `timeBodyGyroMeanX`
* `timeBodyGyroMeanY`
* `timeBodyGyroMeanZ`
* `timeBodyGyroStdX`
* `timeBodyGyroStdY`
* `timeBodyGyroStdZ`
* `timeBodyGyroJerkMeanX`
* `timeBodyGyroJerkMeanY`
* `timeBodyGyroJerkMeanZ`
* `timeBodyGyroJerkStdX`
* `timeBodyGyroJerkStdY`
* `timeBodyGyroJerkStdZ`
* `timeBodyAccMagMean`
* `timeBodyAccMagStd`
* `timeGravityAccMagMean`
* `timeGravityAccMagStd`
* `timeBodyAccJerkMagMean`
* `timeBodyAccJerkMagStd`
* `timeBodyGyroMagMean`
* `timeBodyGyroMagStd`
* `timeBodyGyroJerkMagMean`
* `timeBodyGyroJerkMagStd`
* `freqBodyAccMeanX`
* `freqBodyAccMeanY`
* `freqBodyAccMeanZ`
* `freqBodyAccStdX`
* `freqBodyAccStdY`
* `freqBodyAccStdZ`
* `freqBodyAccMeanFreqX`
* `freqBodyAccMeanFreqY`
* `freqBodyAccMeanFreqZ`
* `freqBodyAccJerkMeanX`
* `freqBodyAccJerkMeanY`
* `freqBodyAccJerkMeanZ`
* `freqBodyAccJerkStdX`
* `freqBodyAccJerkStdY`
* `freqBodyAccJerkStdZ`
* `freqBodyAccJerkMeanFreqX`
* `freqBodyAccJerkMeanFreqY`
* `freqBodyAccJerkMeanFreqZ`
* `freqBodyGyroMeanX`
* `freqBodyGyroMeanY`
* `freqBodyGyroMeanZ`
* `freqBodyGyroStdX`
* `freqBodyGyroStdY`
* `freqBodyGyroStdZ`
* `freqBodyGyroMeanFreqX`
* `freqBodyGyroMeanFreqY`
* `freqBodyGyroMeanFreqZ`
* `freqBodyAccMagMean`
* `freqBodyAccMagStd`
* `freqBodyAccMagMeanFreq`
* `freqBodyBodyAccJerkMagMean`
* `freqBodyBodyAccJerkMagStd`
* `freqBodyBodyAccJerkMagMeanFreq`
* `freqBodyBodyGyroMagMean`
* `freqBodyBodyGyroMagStd`
* `freqBodyBodyGyroMagMeanFreq`
* `freqBodyBodyGyroJerkMagMean`
* `freqBodyBodyGyroJerkMagStd`
* `freqBodyBodyGyroJerkMagMeanFreq`

### Transformations

The source dataset was transformed in the following ways:

* Training and test data set rows were appended and then a unified data set created from the source files.
* Mean and standard deviation extracted for each measurement.
* Variable/Column names were labeled with cleaner and more descriptive names.
* For each measurement the mean has been calculated over each pair of subject and activity.

Results were output as an indepenent tidy data set at ./tidy.txt

### References

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

[2] http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


