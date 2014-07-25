#Download the file and unzip

if (!file.exists("data")) {
        dir.create("data")
}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./data/Dataset.zip")
unzip("./data/Dataset.zip")

#Read the relevant tables
xtest <- read.table( "./data/UCI HAR Dataset/X_test.txt")
xtrain <- read.table( "./data/UCI HAR Dataset/X_train.txt")
features <- read.table( "./data/UCI HAR Dataset/features.txt")
ytest <- read.table( "./data/UCI HAR Dataset/y_test.txt")
ytrain <- read.table( "./data/UCI HAR Dataset/y_train.txt")
subjecttrain <- read.table( "./data/UCI HAR Dataset/subject_train.txt")
subjecttest <- read.table( "./data/UCI HAR Dataset/subject_test.txt")
featuresinfo <- read.table( "./data/UCI HAR Dataset/features_info.txt")
activitylabels <- read.table( "./data/UCI HAR Dataset/activity_labels.txt")

# Combine the x data and add the column names
datax <- rbind(xtrain,xtest)
features1 <- as.character(features[,2])
colnames(datax) <- features1

#Retain only columns with mean() or std())
meanstd <- grepl("mean()|std()",colnames(datax))
data1 <- datax[,meanstd]
meanstd1 <- !grepl("meanFreq",colnames(data1))
data2 <- data1[,meanstd1]

#Remove - in names and change to lower case
names(data2) <- gsub("-","",names(data2))
names(data2) <- tolower(names(data2))

# Combine test and train activity data and the subject data
activity <- rbind(ytrain,ytest)
subject <- rbind(subjecttrain,subjecttest)

#Give column names to activity, subject and activitylabels data
colnames(activity) <- "activitynum"
colnames(activitylabels) <- c("activitynum","activity")
colnames(subject) <- "subject"

# Combine the subject,activity and the x data
data <- cbind(subject,activity,data2)

#Replace numeric activity data with descriptive data
data <- merge(activitylabels,data,by="activitynum")
data <- data[,2:69]

#Create a tidy data set and save
library(plyr)
tidydata <- ddply(data,.(subject,activity),numcolwise(mean))
write.table(tidydata,file="./tidydata.txt")
