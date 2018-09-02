Getting And Cleaning Data
Contents
This repo contains 2 following files.

The first file is a file called run_analysis.R which was prepared in R studio and contains the script needed to download, read and transform the data related to this analysis.
The 2nd file is a file called CodeBook.md  which is a markdown file that describes the background for the project and the steps needed to transform the data.

Steps involved in reading and transforming the data sets:
1. Downloading and unzipping the data set from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. Reading all files (except the inertial signals files) in the train and test sets. 
3. Reading the "activity_labels.txt", "features.txt"
4. Assigning column names
5. Mergin the data sets
6. Reading column names, and creating a vector for defining the ID, the mean and the standard deviation
7. Making second tidy data set
8. Writing second tidy data set in txt file



