Codebook 

Background
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 
A full description is available at the site where the data was obtained:
	http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Data source
Here are the data for the project:
	https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
The original data needs be unzipped and contains the train and test folders, as well as "activity_labels.txt", "features.txt", 'features_info.txt", and "README.txt" files. The train folder contains 4 files: Inertial Signals, subject_train.txt, X_train.txt, and y_train.txt. The test folder contains 4 files: Inertial Signals, subject_test.txt, X_test.txt, and y_test.txt.


Steps involved in reading and transforming the data sets:
1. Downloading and unzipping the data set from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. Reading all files (except the inertial signals files) in the train and test sets. 
3. Reading the "activity_labels.txt", "features.txt"
4. Assigning column names
5. Mergin the data sets
6. Reading column names, and creating a vector for defining the ID, the mean and the standard deviation
7. Making second tidy data set
8. Writing second tidy data set in txt file



