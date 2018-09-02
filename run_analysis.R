#One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are 
#racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected 
#from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
#http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
#Here are the data for the project:
#https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
#You should create one R script called run_analysis.R that does the following.
#1. Merges the training and the test sets to create one data set.
#2. Extracts only the measurements on the mean and standard deviation for each measurement.
#3. Uses descriptive activity names to name the activities in the data set
#4. Appropriately labels the data set with descriptive variable names.
#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.



#Load packages
install.packages("reshape2")
library(reshape2)
install.packages("plyr")
library(plyr)

#check first if file exists already
if(!file.exists("./data")){dir.create("./data")}

#define the URL where download files are located
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

#download the file
download.file(fileUrl,destfile = "./data/Dataset.zip")


#unzip the file that was downloaded
unzip(zipfile="./data/Dataset.zip",exdir="./data")
list.files("./data")
list.files("./data/UCI HAR Dataset")
list.files("./data/UCI HAR Dataset/test")
list.files("./data/UCI HAR Dataset/train")


#1. Merge the training and the test sets to create one data set

#read test files
X_test <-read.table("./data/UCI HAR Dataset/test/X_test.txt")
Y_test <-read.table("./data/UCI HAR Dataset/test/y_test.txt")
subject_test <-read.table("./data/UCI HAR Dataset/test/subject_test.txt")

#read train files
X_train <-read.table("./data/UCI HAR Dataset/train/X_train.txt")
Y_train <-read.table("./data/UCI HAR Dataset/train/y_train.txt")
subject_train <-read.table("./data/UCI HAR Dataset/train/subject_train.txt")

#read activity lables and features files in the dataset
activitylabels <- read.csv("./data/UCI HAR Dataset/activity_labels.txt")        # 'activity_labels.txt': Links the class labels with their activity name.
featureNames <- read.csv("./data/UCI HAR Dataset/features.txt")                      #'features.txt': List of all features.


#add column name for subject train and test files
names(subject_train) <- "subjectID"
names(subject_test) <- "subjectID"

#add column names for X_train files
featureNames <- read.table("features.txt")
names(X_train) <- featureNames$V2
names(X_test) <- featureNames$V2

# add column name for label files
names(Y_train) <- "activitylabels"
names(Y_test) <- "activitylabels"

# combine train and test files into one dataset
trainfile <- cbind(subject_train, Y_train, X_train)
testfile <- cbind(subject_test, Y_test, X_test)
combined <- rbind(trainfile, testfile)


#2. Extract only the measurements on the mean and standard deviation for each measurement.
mean_col <- grepl("mean\\(\\)", names(combined)) |
  grepl("std\\(\\)", names(combined))
mean_col[1:2] <- TRUE
combined <- combined[, mean_col]


#3. Assign descriptive activity names to name the activities in the data set
#4. Appropriately labels the data set with descriptive variable names.
combined$activity <- factor(combined$activity, 
labels=c(
"Walking",
"Walking Upstairs", 
"Walking Downstairs", 
"Sitting", 
"Standing", 
"Laying"))

#create a second, independent tidy data set with the average of each variable for each activity and each subject.
meltedata <- melt(combined, id=c("subjectID","activity"))
tidydata <- dcast(meltedata, subjectID+activity ~ variable, mean)
write.table(tidydata, "tidy.txt", row.names=FALSE)

list.files()
