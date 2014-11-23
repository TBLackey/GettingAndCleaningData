---
title: "Readme"
output: html_document
---

-------------------OVERVIEW----------------------------------------

This is the Readme file I have submitted for the Getting and Clean Data course project.

Running the "run_analysis.R"" script performs the five required steps to produce the tidy data set output text file:

1. Merges the training and the test sets to create one data set.
2. Drop all but the measurements on the mean and standard deviation for each measurement. (For completness this INCLUDES means of the sliding windows and frequency component means)
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The script requires the dplyr package installed in your version of R.

The script requires the "UCI HAR Dataset" folder and associated files provided to be in your working directory.

-------------REVIEWING THE TEXT FILE-------------------------------

The output file is "tidy_data_set.txt" - the same text file I submitted.

The best way to read the text file into R, to review my work is with the following line:

check_answer<-read.table("tidy_data_set.txt",header=TRUE)


-------------------------VARIABLES IN THE SCRIPT--------------------
The following variables are used in the script "run_analysis.R". 

See codebook.md for a description of the variables in output file "tidy_data_set.txt"

xtest: data frame read in from X_test.txt
ytest:data frame read in from  y_test.txt
xtrain:data frame read in from X_train.txt
ytrain:data frame read in from y_train.txt
subjecttest:data frame read in fromsubject_test.txt
subjecttrain:data frame read in from subject_train.txt
activitylabel:data frame read in from activity_labels.txt

test: combines subjecttest, ytest and xtest in a single data frame
train: combines subjecttrain, ytrain and xtrain in a single data frame
data: combines test and train in a single data frame, later the non-mean and non-standard deviation columns in the script are removed

header: names are the different measurement names read in from features.txt. This is used to give descriptive column names to data

meansandstdscol: a vector of the columns in data related to mean measurements and standard deviation measurements.

grouped_data: The data variable, grouped by the SubjectID and ActivityID columns
answer: data frame of the final processed result, ready for output to a file
