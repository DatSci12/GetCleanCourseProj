# Getting and Cleaning Data - Course Project
# Steps to get and clean the data resulting in a tidy data set
#
# Getting the data for files Subject_
trData <- read.table("./UCIHARDataset/train/subject_train.txt")
tstData <- read.table("./UCIHARDataset/test/subject_test.txt")
subData <- rbind(trData, tstData)

# Getting the data for files X_
trData <- read.table("./UCIHARDataset/train/X_train.txt")
tstData <- read.table("./UCIHARDataset/test/X_test.txt")
xData <- rbind(trData, tstData)

# Getting the data for files Y_
trData <- read.table("./UCIHARDataset/train/Y_train.txt")
tstData <- read.table("./UCIHARDataset/test/Y_test.txt")
yData <- rbind(trData, tstData)

# Extraction of the measurements on the MEAN and STANDARD DEVIATION for each of the measurements
featuresDat <- read.table("./UCIHARDataset/features.txt")
targetFeatDat <- grep("-mean\\(\\)|-std\\(\\)", featuresDat[,2])
xData <- xData[, targetFeatDat]
names(xData) <- tolower(gsub("\\(|\\)", "", featuresDat[targetFeatDat, 2]))

# Use descriptive activity names to name each of the activities in the data set
activityNames <- read.table("./UCIHARDataset/activity_labels.txt")
activityNames[,2] = gsub("_", "", tolower(as.character(activityNames[,2]))) # remove the _ and the cap letters
yData[,1] = activityNames[yData[,1],2]
names(yData) <- "activity"

# Label the data set with descriptive activity names
colnames(subData)
names(subData) <- "subject"
InitialCleanData <- cbind(subData, yData, xData) # output the 1st Tidy Data Set

# Compile a second independent tidy data set with the average of each variable for each activity and each subject.
uniqsubData <- unique(subData)[,1] # extract unique subject values from the data set
numsubData <- length(unique(subData)[,1]) # determine the number of unique subjects
numAct <- length(activityNames[,1])  # determine the number of activities
##  determine the number of variables in the data set compiled earlier
numcols <- dim(InitialCleanData)[2]
numcols
finalTidydataset <- InitialCleanData[1:(numsubData*numAct), ]
rowcount <- 1
for (i in 1:numsubData) {
    for (j in 1:numAct) {
      finalTidydataset[rowcount, 1] <- uniqsubData[i]
      finalTidydataset[rowcount, 2] <- activityNames[j, 2]
      holding <- InitialCleanData[InitialCleanData$subject == i & InitialCleanData$activity == activityNames[j,2], ]
      finalTidydataset[rowcount, 3:numcols] <- colMeans(holding[, 3:numcols])
      rowcount <- rowcount +1 
    }
}

# Output the dataset
write.table(finalTidydataset, "TidyDataSet.txt")
write.csv(finalTidydataset, file = 'TidyDataSet.csv')

