library(plyr) # for ddply

# Project instructions did not state that the code needs to download and extract files
# I'm assuming that the dataset has been extraced into a folder named /working/ in my Working Directory
# reading text files:
train.x <- read.table("working/UCI HAR Dataset/train/X_train.txt")
train.y <- read.table("working/UCI HAR Dataset/train/y_train.txt")
train.sub <- read.table("working/UCI HAR Dataset/train/subject_train.txt")
test.x <- read.table("working/UCI HAR Dataset/test/X_test.txt")
test.y <- read.table("working/UCI HAR Dataset/test/y_test.txt")
test.sub <- read.table("working/UCI HAR Dataset/test/subject_test.txt")


#use rbind to merge the train, test, and sub files
# **This is part 1 of the assignment**
merged.x <- rbind(train.x, test.x)
merged.y <- rbind(train.y, test.y)
merged.subject <- rbind(train.sub, test.sub)


#read in the features file and grep out columns that contain "mean()" or "std()"
features <- read.table("working/UCI HAR Dataset/features.txt")
means <- grep("mean()", features[,2])
stds <- grep("std()", features[,2])
#make a list of column names to keep
rbind(features[means,], features[stds,]) -> features.keep
cols.labels <- features.keep[,2]


#extract the mean and std data columns from the merged dataset 
# **This is part 2 of the assignment **
xcols <- merged.x[cols.labels]
#label the extraced columns appropriately
# ** Part 4 of assignment **
colnames(xcols) <- cols.labels


# **Part 3 of assignment- give the activities descriptive names**
colnames(merged.y) <- "activity" # ** Also Part 4 of assignment **
merged.y$activity[merged.y$activity == 1] = "WALKING"
merged.y$activity[merged.y$activity == 2] = "WALKING_UPSTAIRS"
merged.y$activity[merged.y$activity == 3] = "WALKING_DOWNSTAIRS"
merged.y$activity[merged.y$activity == 4] = "SITTING"
merged.y$activity[merged.y$activity == 5] = "STANDING"
merged.y$activity[merged.y$activity == 6] = "LAYING"


#name the subjects column
# ** Also part 4 of assignment **
colnames(merged.subject) <- 'subjects'


# Combine the extracted columns, activity data, and subject ids
final <- cbind(xcols, merged.y, merged.subject)

# Use ddply to calculate the mean of each column, grouped by subject and activity
# This is part 5 of the assignment
tidy <- ddply(final, .(subjects, activity), numcolwise(mean)) 

# Write tidy dataset as csv, with row.names=FALSE as per project instructions 
write.table(tidy, "tidy.txt", row.names=FALSE)
