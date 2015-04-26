## Load the Raw Data, if not exist, try to download and unzip
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipfn <- "getdata-projectfiles-UCI HAR Dataset.zip"
destdir <- "UCI HAR Dataset"
if (!file.exists(destdir)) {
  if(!file.exists(zipfn)) {
    ## Download the data file
    download.file(fileURL, destfile=zipfn)
  }
  ## Unzip the data file
  unzip(zipfn)
}

# Read input files
# Read the activity labels
labels <- read.table( "./UCI HAR Dataset/activity_labels.txt", sep="")
features <- read.table("./UCI HAR Dataset/features.txt", sep="")

# Read Test
test_subject <- read.table( "./UCI HAR Dataset/test/subject_test.txt", sep="", col.names=c("Subject"))
test_x <- read.table("./UCI HAR Dataset/test/X_test.txt", sep="")
test_y <- read.table("./UCI HAR Dataset/test/y_test.txt", sep="", col.names=c("Activity"))
dim(test_subject)
dim(test_x)
dim(test_y)

# Read training
train_subject <- read.table("./UCI HAR Dataset/train/subject_train.txt", sep="", col.names=c("Subject"))
train_x <- read.table("./UCI HAR Dataset/train/X_train.txt", sep="")
train_y <- read.table("./UCI HAR Dataset/train/y_train.txt", sep="", col.names=c("Activity"))
dim(train_subject); dim(train_x); dim(train_y)

############# Data Merge #################################
# Combine test subject, y & x
test <- cbind(test_subject, test_y, test_x)

# Combine train subject, y & x
train <- cbind(train_subject, train_y, train_x)

# Merge the training and the test sets to create one data set
all_data <- rbind(test, train)
dim(test);dim(train);dim(all_data)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement

library(dplyr)
activity <- tbl_df(all_data)

# mean() and std() column list, need to add up 2 (Subject, Activity)
collist <- grep("[Mm]ean\\()|[Ss]td\\()", features$V2)
colnames <- grep("[Mm]ean\\()|[Ss]td\\()", features$V2, value=TRUE)

collist <- collist + 2
collist <- c(1, 2, collist)
colnames <- c("Subject", "Activity", colnames)

### Select columns
activity <- activity[, c(collist)]

# 3. Uses descriptive activity names to name the activities in the data set

activity$Activity <- as.character(activity$Activity)
labels$V1 <- as.character(labels$V1)
labels$V2 <- as.character(labels$V2)
for( i in 1:nrow(labels) ) {
  activity$Activity <- gsub(labels[i,1], labels[i,2], activity$Activity)
}

# 4. Appropriately labels the data set with descriptive variable names.
names(activity) <- colnames

tidy.data <- group_by(activity, Subject, Activity) %>%
  summarise_each(funs(mean))
names(tidy.data) <- colnames

# 5. From the data set in step 4, creates a second, independent tidy data set 
#    with the average of each variable for each activity and each subject.
write.table(tidy.data, "./tidydata.txt", row.name=FALSE)
