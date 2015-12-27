## Part 1: make single dataframe

# load files
subjectTest <- read.table("fitnessData/test/subject_test.txt")
subjectTrain <- read.table("fitnessData/train/subject_train.txt")
XTest <- read.table("fitnessData/test/X_test.txt")
XTrain <- read.table("fitnessData/train/X_train.txt")
YTest <- read.table("fitnessData/test/Y_test.txt")
YTrain <- read.table("fitnessData/train/Y_train.txt")
features <- read.table("fitnessData/features.txt")

# column labels
colnames(subjectTest) <- c("subject")
colnames(subjectTrain) <- c("subject")
colnames(XTest) <- features$V2
colnames(XTrain) <- features$V2
colnames(YTest) <- c("activity")
colnames(YTrain) <- c("activity")

# column to tag "test" and "train" sets
subjectTest$dataGroup <- factor("test")
subjectTrain$dataGroup <- factor("train")

# bind together all data for test and for train (by columns), then combine rows for single file
testDF <- cbind(subjectTest, YTest, XTest)
trainDF <- cbind(subjectTrain, YTrain, XTrain)
mergedDF <- rbind(testDF, trainDF)

## Part 2: Extract only the measurements on the mean and standard deviation for each measurement

# create logical vector to reflect which column names contain "mean()" or "std()", also keep first three columns 
meanColLogical <- grepl("mean()", colnames(mergedDF))
stdColLogical <- grepl ("std()", colnames(mergedDF))
colToKeepLogical <- (meanColLogical | stdColLogical)
colToKeepLogical[1] = TRUE
colToKeepLogical[2] = TRUE
colToKeepLogical[3] = TRUE

# keep only selected columns of full dataframe
subsetDF <- mergedDF[ ,colToKeepLogical]

## Part 3: Replace activity number codes with labels

subsetDF$activity <- as.factor(subsetDF$activity)
levels(subsetDF$activity) <- c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")

## Part 4: Improve variable names (I am just removing the "()", will explain names in codebook)

nameVec <- colnames(subsetDF)
nameVecClean <- gsub("\\(\\)", "", nameVec)
colnames(subsetDF) <- nameVecClean

## Part 5: Create a new dataframe with average of each variable (feature) for each subject and each activity

# reshape to long format

library(reshape2)
meltDF <- melt(subsetDF, id.vars=c("subject", "activity"), measure.vars = colnames(subsetDF[4:82]))
library(dplyr)
meltDF <- rename(meltDF, feature = variable)

# replace individual values with mean

library(plyr)
meansDF <- ddply(meltDF, .(subject, activity, feature), summarize, mean=mean(value))

write.table(meansDF, file="course_project_final_file.txt", row.name=FALSE)