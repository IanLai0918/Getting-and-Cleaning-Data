# Getting-and-Cleaning-Data
week 4 assignment- Getting and Cleaning Data

## Downloading the dataset

#STEP 1: Check if the directory ("/Assignment_week4") is already exist if not create a new directory called ("/Assignment_week4")

#STEP 2: Downloading dataset from the URL ("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip")

#STEP 3: Unzip the dataset to the working directory.


## PART 1:Merges the training and the test sets to create one data set.
  (Here the data has been already divided into 2 groups, train data = 70% of the full dataset, test data = 30% of the full dataset)


#STEP 4: Reading train data in table format from 
         #1. "./Assignment_week4/UCI HAR Dataset/train/X_train.txt"
		 #2. "./Assignment_week4/UCI HAR Dataset/train/Y_train.txt"
		 #3. "./Assignment_week4/UCI HAR Dataset/train/subject_train.txt"
		 
#STEP 5: Reading test data in table format from 
         #1. "./Assignment_week4/UCI HAR Dataset/train/X_test.txt"
		 #2. "./Assignment_week4/UCI HAR Dataset/train/Y_test.txt"
		 #3. "./Assignment_week4/UCI HAR Dataset/train/subject_test.txt"
		 
#STEP 6: Reading Feature vector in table format from
		#1. "./Assignment_week4/UCI HAR Dataset/features.txt"
	
#STEP 7: Reading Activity labels in table format from
		#1. "./Assignment_week4/UCI HAR Dataset/activity_labels.txt"

#Now, lets give a name to all the columns and put together the data into one table


#STEP 8: Assigning column names to dataset

#STEP 9: Merging Test and Train dataset to "Full_dataset" table 


##  PART 2:Extracts only the measurements on the mean and standard deviation for each measurement.


#STEP 10: Reading column names from "Full_dataset" 

#STEP 11: Getting subset of all the mean and standard deviation for each activity and subject


## PART 3 & 4: Uses descriptive activity names to name the activities in the data set and Appropriately labels the data set with descriptive variable names.


#STEP 12: creating subset for mean and standard deviation

#STEP 13: creating subset for activity names and merging with subset of mean and standard deviation

#############################################################################################################

## PART 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#############################################################################################################

#STEP 14: creating second tidy data set

#STEP 15: writing tidy data into txt file "./Assignment_week4/TidyDataset.txt"
