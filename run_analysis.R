## Ruchi Patel
## Gettign and Cleaning Data
## Programming Assignment week 4


############################################################################################################

##Downloading dataset

############################################################################################################

# checking if the directory is exist ornot -- if not create new directory
if (!file.exists("./Assignment_week4")){dir.create("./Assignment_week4")}

# downloading dataset
url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, destfile = "./Assignment_week4/Dataset.zip")

# unzip dataset
unzip(zipfile = "./Assignment_week4/Dataset.zip" , exdir = "./Assignment_week4")


#############################################################################################################

##  PART 1:Merges the training and the test sets to create one data set.

#############################################################################################################

# Reading train data in tables

x_train <-read.table("./Assignment_week4/UCI HAR Dataset/train/X_train.txt")
y_train <-read.table("./Assignment_week4/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./Assignment_week4/UCI HAR Dataset/train/subject_train.txt")



# Reading test data in tables

x_test <-read.table("./Assignment_week4/UCI HAR Dataset/test/X_test.txt")
y_test <-read.table("./Assignment_week4/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./Assignment_week4/UCI HAR Dataset/test/subject_test.txt")


# Reading Feature column in tables

features <- read.table('./Assignment_week4/UCI HAR Dataset/features.txt')


# Reading activity labels in table

activityLabels = read.table('./Assignment_week4/UCI HAR Dataset/activity_labels.txt')
 

# Now, assigning column names to dataset

colnames(x_train) <- features[,2] 
colnames(y_train) <-"activity"
colnames(subject_train) <- "subject"

colnames(x_test) <- features[,2] 
colnames(y_test) <- "activity"
colnames(subject_test) <- "subject"

colnames(activityLabels) <- c('activity','activityType')
 
# Merging datasets

train_data <- cbind(y_train,subject_train,x_train)
test_data <- cbind(y_test,subject_test,x_test)
Full_data <- rbind(train_data,test_data)


#############################################################################################################

##  PART 2:Extracts only the measurements on the mean and standard deviation for each measurement.

#############################################################################################################

# reading column names

col_names<-colnames(Full_data)

# getting subset of all the mean and standard deviation for each activity and subject

all_mean_std = (grepl("activity",col_names) | grepl("subject",col_names) | grepl("mean..",col_names) | grepl("std..",col_names))



#############################################################################################################

## PART 3 & 4: Uses descriptive activity names to name the activities in the data set and 
##             Appropriately labels the data set with descriptive variable names.

#############################################################################################################

# creating subset for mean and standard deviation

sub_mean_std <- Full_data[ , all_mean_std == TRUE]

# creating subset for activity names and merging with subset of mean and standard deviation

sub_activity_mena_std <- merge(sub_mean_std , activityLabels , by="activity" , all.x = TRUE)


#############################################################################################################

## PART 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#############################################################################################################

# creating second tidy data set

second_tidyDataset <- aggregate(. ~subject +activity, sub_activity_mena_std, mean)
second_tidyDataset <- second_tidyDataset[order(second_tidyDataset$subject, second_tidyDataset$activity),]

# writing tidy data into txt file
print(row(second_tidyDataset,as.factor = FALSE))

##write.table(second_tidyDataset, "./Assignment_week4/TidyDataset.txt", row.name=FALSE)
