---
title: "Code Book"
author: "David"
date: "Tuesday, July 22, 2014"
output: html_document
---

##Data Collection##

Human Activity Recognition Using Smartphones Data Set 
Download: Data Folder, Data Set Description

Abstract: Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.

Data Set Characteristics:  

Multivariate, Time-Series

Number of Instances:

10299

Area:

Computer

Attribute Characteristics:

N/A

Number of Attributes:

561

Date Donated

2012-12-10

Associated Tasks:

Classification, Clustering

Missing Values?

N/A

Number of Web Hits:

99332


Source:

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto. 
Smartlab - Non Linear Complex Systems Laboratory 
DITEN - Universit�  degli Studi di Genova, Genoa I-16145, Italy. 
activityrecognition '@' smartlab.ws 
www.smartlab.ws 



##Data Set Information:##

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

Check the README.txt file for further details about how the tidydata file was created.


##Attribute Information:##

For each record the following measurements were taken: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

##The Raw Data##

###The dataset includes the following files:###

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

###Notes:### 

- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

##tidydataset variables##

The file tidydata.txt has 180 rows being seqmented by subject (1-30) and by activity (1-6).  The activiies are: 
1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

From the raw data only those measures that calculate the mean or standard deviation of the measurement have been retained.

 [3]   "tbodyaccmean()x"           
 [4] "tbodyaccmean()y"            "tbodyaccmean()z"            "tbodyaccstd()x"            
 [7] "tbodyaccstd()y"             "tbodyaccstd()z"             "tgravityaccmean()x"        
[10] "tgravityaccmean()y"         "tgravityaccmean()z"         "tgravityaccstd()x"         
[13] "tgravityaccstd()y"          "tgravityaccstd()z"          "tbodyaccjerkmean()x"       
[16] "tbodyaccjerkmean()y"        "tbodyaccjerkmean()z"        "tbodyaccjerkstd()x"        
[19] "tbodyaccjerkstd()y"         "tbodyaccjerkstd()z"         "tbodygyromean()x"          
[22] "tbodygyromean()y"           "tbodygyromean()z"           "tbodygyrostd()x"           
[25] "tbodygyrostd()y"            "tbodygyrostd()z"            "tbodygyrojerkmean()x"      
[28] "tbodygyrojerkmean()y"       "tbodygyrojerkmean()z"       "tbodygyrojerkstd()x"       
[31] "tbodygyrojerkstd()y"        "tbodygyrojerkstd()z"        "tbodyaccmagmean()"         
[34] "tbodyaccmagstd()"           "tgravityaccmagmean()"       "tgravityaccmagstd()"       
[37] "tbodyaccjerkmagmean()"      "tbodyaccjerkmagstd()"       "tbodygyromagmean()"        
[40] "tbodygyromagstd()"          "tbodygyrojerkmagmean()"     "tbodygyrojerkmagstd()"     
[43] "fbodyaccmean()x"            "fbodyaccmean()y"            "fbodyaccmean()z"           
[46] "fbodyaccstd()x"             "fbodyaccstd()y"             "fbodyaccstd()z"            
[49] "fbodyaccjerkmean()x"        "fbodyaccjerkmean()y"        "fbodyaccjerkmean()z"       
[52] "fbodyaccjerkstd()x"         "fbodyaccjerkstd()y"         "fbodyaccjerkstd()z"        
[55] "fbodygyromean()x"           "fbodygyromean()y"           "fbodygyromean()z"          
[58] "fbodygyrostd()x"            "fbodygyrostd()y"            "fbodygyrostd()z"           
[61] "fbodyaccmagmean()"          "fbodyaccmagstd()"           "fbodybodyaccjerkmagmean()" 
[64] "fbodybodyaccjerkmagstd()"   "fbodybodygyromagmean()"     "fbodybodygyromagstd()"     
[67] "fbodybodygyrojerkmagmean()" "fbodybodygyrojerkmagstd()" 