################################################################################
#
# FILE: run_analysis.R
#
# DESCRIPTION:
#   Personal Activity Monitoring Dataset is provided. It contains data 
#   accumulated from Accelerometers, Gyroscope present on a Samsung Galaxy Phone
#   worn by 30 subjects. 
#
#   This file contains code to-
#   1. Fetch and Load the Dataset
#   2. Merge Test and Training Datasets
#   3. Extract Measurements for Mean & Standard Deviation
#   4. Rename Colums with descriptive names
#   5. Tidy the data and write the tidy dataset to a file
#
################################################################################

# Load Libraries
library(dplyr) # For Data manipulation

# This function fetches data and extracts it
# Returns TRUE if success else FALSE for failure
GatherData <- function (url, dest.file, data.folder){
    download.file (url=url, destfile=dest.file, method="curl", quiet = TRUE)
    if (file.exists(dest.file)) {
        unzip (dest.file)
        
        if (dir.exists(data.folder))
            return(TRUE)
    }
    
    return(FALSE)
}


url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
dest.file <- "ActivityData.zip"
data.folder <- "UCI HAR Dataset"

# Check if required Dataset folder is present, else fetch it
if (!dir.exists(data.folder)){
    GatherData(url, dest.file, data.folder)
}
    
# Load Data from Dataset - Look at README.md and CodeBook.md for details
training.subjects <- read.table(file.path(data.folder, "train", "subject_train.txt"))
training.values <- read.table(file.path(data.folder, "train", "X_train.txt"))
training.activities <- read.table(file.path(data.folder, "train", "Y_train.txt"))

test.subjects <- read.table(file.path(data.folder, "test", "subject_test.txt"))
test.values <- read.table(file.path(data.folder, "test", "X_test.txt"))
test.activities <- read.table(file.path(data.folder, "test", "Y_test.txt"))

activities <- read.table(file.path(data.folder, "activity_labels.txt"))
colnames(activities) <- c("Activity", "Activity.Name")
features <- read.table(file.path(data.folder, "features.txt"), sep=" ", 
                       stringsAsFactors = FALSE)


# Merge Test and Training Sets
merged.df <- rbind(cbind(training.subjects, training.activities, training.values),
                   cbind(test.subjects, test.activities, test.values))
names <- c("Subject", "Activity", features$V2)
colnames(merged.df) <- names

# Pick only columns with mean() or std() from the merged data
required.names <- grep("Activity|Subject|mean[(][)]|std[(][)]", names, value=TRUE)
merged.df <- merged.df[,required.names]

# Rename the columns
required.names <- gsub ("BodyBody", "Body", required.names, fixed=TRUE)
required.names <- gsub("^f", "FreqDomain", required.names)
required.names <- gsub("^t", "TimeDomain", required.names)
required.names <- gsub("mean[(][)]", "Mean", required.names)
required.names <- gsub("std[(][)]", "StdDev", required.names)
required.names <- gsub("Acc", "Acceleration", required.names, fixed = TRUE)
required.names <- gsub("Gyro", "Gyroscope", required.names, fixed = TRUE)
required.names <- gsub("Mag", "Magnitude", required.names, fixed = TRUE)
required.names <- gsub("-", ".", required.names)

# Apply renamed column names
colnames(merged.df) <- required.names

# Create Summary data - Mean of all values by Subject & Activity
summary.df <- merged.df %>% group_by(Subject, Activity) %>% summarize_all(mean)

# Bring-in Activity names and and Arrange the columns appropriately
summary.df <- summary.df %>% left_join(activities, by = "Activity") %>% 
                select (Subject, Activity, Activity.Name, everything())

write.table(summary.df, file = "tidydata.txt", row.names = FALSE, quote = FALSE)
