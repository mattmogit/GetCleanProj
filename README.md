# https://class.coursera.org/getdata-010/human_grading
#
#Assignment:
#You should create one R script called run_analysis.R that does the following. 
# Merges the training and the test sets to create one data set.
# Extracts only the measurements on the mean and standard deviation for each measurement. 
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive variable names. 
# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Source the file run_analysis.R to merge the train and test data from the previously downloaded and extracted data (extraced to /working/ in your Working Directory), extract the columns that contain "mean()" or "std()", apply appropriate column names, rename the activity ids to useful names, and calculate the averages of each mean and std grouped by Subject and Activity.

Other files in the directory-

Readme.md - this file

CodeBook.md - explains the data in the tiny.txt file
