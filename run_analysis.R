
##load dplyr package

library(dplyr)

##check if dataset exists, and if not download it
UCIdataFile<- "UCI HAR Dataset.zip"
UCIzipURL<- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

if (!file.exists(UCIdataFile)) {
  download.file(UCIzipURL, UCIdataFile, method = "curl")
}

##Unzip file if data does not already exist
fileLocation<- "UCI HAR Dataset"
if(!file.exists(fileLocation)) {
  unzip(UCIdataFile)
}

##read data and save them as objects

features<- read.table(file.path(fileLocation, "features.txt"), as.is = TRUE)

activity<- read.table(file.path(fileLocation, "activity_labels.txt"),
                                col.names = c("activityId", "activityLabel"))

testsubjects<- read.table(file.path(fileLocation, "test", "subject_test.txt"),
                                    col.names= "subjectId")
testActivity<- read.table(file.path(fileLocation, "test", "y_test.txt"),
                          col.names = "activityId")
testData<- read.table(file.path(fileLocation, "test", "X_test.txt"),
                      col.names = features$V2)

trainsubjects<- read.table(file.path(fileLocation, "train", "subject_train.txt"),
                           col.names = "subjectId")
trainActivity<- read.table(file.path(fileLocation, "train", "y_train.txt"),
                           col.names = "activityId")
trainData<- read.table(file.path(fileLocation, "train", "X_train.txt"),
                       col.names = features$V2)

## Merge train and test data sets together

datasets<- rbind(trainData,testData)
activitysets<- rbind(trainActivity,testActivity)
subjectSets<- rbind(trainsubjects, testsubjects)
mergedData<- cbind(subjectSets, activitysets,datasets)

## isolate only the variables that contrain mean or standard deviation measurements

selectedData<- mergedData %>% select(subjectId, activityId, contains("mean"), contains("Std"))

## use names to describe the activity

selectedData$activityId<- activity[selectedData$activityId, 2]

##label the variables with descriptive labels by replacing the coded variables

selectedDataCols<- colnames(selectedData)

selectedDataCols<- selectedDataCols 

selectedDataCols<- gsub("gravity", "Gravity", selectedDataCols)
selectedDataCols<- gsub("angle", "Angle", selectedDataCols)
selectedDataCols<- gsub("Acc", "Accelerometer", selectedDataCols)
selectedDataCols<- gsub("BodyBody", "Body", selectedDataCols)
selectedDataCols<- gsub("Mag", "Magnitude", selectedDataCols)
selectedDataCols<- gsub("^t", "Time", selectedDataCols)
selectedDataCols<- gsub("^f", "Frequency", selectedDataCols)
selectedDataCols<- gsub("tBody", "TimeBody", selectedDataCols)
selectedDataCols<- gsub("-mean()", "Mean", selectedDataCols, ignore.case = T)
selectedDataCols<- gsub("-std()", "StandardDeviation", selectedDataCols, ignore.case = T)
selectedDataCols<- gsub("-freq()", "Frequency", selectedDataCols, ignore.case = T)

colnames(selectedData)<- selectedDataCols

## create second independent data set with the average of each variable

CompleteDataSet<- selectedData %>%
  group_by(subjectId, activityId) %>%
  summarise_all(mean)
write.table(CompleteDataSet, "CompleteDataSet.txt", row.names = F)

