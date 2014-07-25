---
title: "README"
author: "David"
date: "Tuesday, July 22, 2014"
output: html_document
---
Activity measurement utilising a smartphone


##Experimental Design##

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

Further information on the data can be obtained at:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#

##Data Analysis##

The data was downloaded in .txt form from the following website:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
It was then unzipped and nine sub files read.  (See the code book for a detailed description of the data variables)

```r

if (!file.exists("data")) {
        dir.create("data")
}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./data/Dataset.zip")

unzip("./data/Dataset.zip")

xtest <- read.table( "./data/UCI HAR Dataset/X_test.txt")
xtrain <- read.table( "./data/UCI HAR Dataset/X_train.txt")
features <- read.table( "./data/UCI HAR Dataset/features.txt")
ytest <- read.table( "./data/UCI HAR Dataset/y_test.txt")
ytrain <- read.table( "./data/UCI HAR Dataset/y_train.txt")
subjecttrain <- read.table( "./data/UCI HAR Dataset/subject_train.txt")
subjecttest <- read.table( "./data/UCI HAR Dataset/subject_test.txt")
featuresinfo <- read.table( "./data/UCI HAR Dataset/features_info.txt")
activitylabels <- read.table( "./data/UCI HAR Dataset/activity_labels.txt")
```
The measurement data had been split into train data and test data at random based on a 70/30 split.  This data was recombined and column headings added.

```r

datax <- rbind(xtrain,xtest)
features1 <- as.character(features[,2])
colnames(datax) <- features1
```

All columns that did not calculate a mean or standard deviation were deleted.  Deletion included those columns which calculated a mean frequency.

```r

meanstd <- grepl("mean()|std()",colnames(datax))
data1 <- datax[,meanstd]
meanstd1 <- !grepl("meanFreq",colnames(data1))
data2 <- data1[,meanstd1]
```
The column headings were tidied up to make them clearer specifically they were all changed to lower case and "-" characters were removed

```r

names(data2) <- gsub("-","",names(data2))
names(data2) <- tolower(names(data2))
```
Similarly the data containing the activities and the subjects were combined for the train and test data
```r

activity <- rbind(ytrain,ytest)
subject <- rbind(subjecttrain,subjecttest)
```
Column names "activitynum" and "subject" were given to the two data sets and then they were combined with the measurement data
```r

colnames(activity) <- "activitynum"
colnames(activitylabels) <- c("activitynum","activity")
colnames(subject) <- "subject"

data <- cbind(subject,activity,data2)
```
The column headed activity is numeric (1 to 6).  By reference to the activitylabels data this was changed to descriptions of the activity
```r

data <- merge(activitylabels,data,by="activitynum")
data <- data[,2:69]
```
Finally the means of each combination of column variable, activity and subject were calculated and saved in a text file entitled tidydata

```r

library(plyr)
tidydata <- ddply(data,.(subject,activity), numcolwise(mean))
write.table(tidydata,file="./tidydata.txt")
```
