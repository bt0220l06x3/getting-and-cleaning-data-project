
# Load needed libraries
library(reshape2)

# Data Set Configuration Variables
dataURL = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
dataSetArchive = "UCI HAR Dataset.zip"
dataSetDirectory = "UCI HAR Dataset"

# Download the Data Set if it has not be retireved already
if (!file.exists(dataSetArchive)) {
  download.file(dataURL, dataSetArchive)
}

# Extract the Data Set archive if the directory dataSetDirectory does not exit
if (!file.exists(dataSetDirectory)) {
  unzip(dataSetArchive)
}

loadTableFromFile <- function(file_name) {
  dataFile <- paste(dataSetDirectory, file_name, sep = "/")
  if (file.exists(dataFile)) {
    return(read.table(dataFile))
  }
}

# Load activity labels
activityLabelsFile <- "activity_labels.txt"
activityLabels <- loadTableFromFile(activityLabelsFile)
activityLabels[,2] <- as.character(activityLabels[,2])

# Load features
featuresFile <- "features.txt"
features <- loadTableFromFile(featuresFile)
features[,2] <- as.character(features[,2])

# Identify the required features for mean and standard deviation
features$required <- grepl(".*mean.*|.*std.*", features[,2])

# Tidy up the feature names to be more descriptive
features$tidy.name <- features[,2]
features$tidy.name <- gsub("-mean", "Mean", features$tidy.name)
features$tidy.name <- gsub("-std", "Std", features$tidy.name)
features$tidy.name <- gsub("[-()]", "", features$tidy.name)
features$tidy.name <- gsub("^t", "time", features$tidy.name)
features$tidy.name <- gsub("^f", "freq", features$tidy.name)


# loadDataSet is a convience function to load all the elements of
# the identified data set and return it as a signle data frame
loadDataSet <- function(dataSetName, featureSet) {
  baseDataFile <- paste(dataSetName,
                        paste("X_", dataSetName, ".txt", sep = ""),
                        sep = "/")
  baseData <- loadTableFromFile(baseDataFile)[featureSet]

  activityDataFile <- paste(dataSetName,
                        paste("y_", dataSetName, ".txt", sep = ""),
                        sep = "/")
  activityData <- loadTableFromFile(activityDataFile)
  
  subjectDataFile <- paste(dataSetName,
                            paste("subject_", dataSetName, ".txt", sep = ""),
                            sep = "/")
  subjectData <- loadTableFromFile(subjectDataFile)
  
  return(cbind(subjectData, activityData, baseData))
}

# Load train data set
#train <- loadDataSet("train", featureList)
train <- loadDataSet("train", features[features$required,1])

# Load test data set
#test <- loadDataSet("test", featureList)
test <- loadDataSet("test", features[features$required,1])

# Merge the data sets
allData <- rbind(train, test)

# Name the columns of allData
colnames(allData) <- c("subject", "activity", features[features$required,"tidy.name"])

# Convert subject and activity into factors
allData$subject <- as.factor(allData$subject)
allData$activity <- factor(allData$activity,
                           levels = activityLabels[,1],
                           labels = activityLabels[,2])

# Change the data set into long format using subject and activity as IDs
allDataMelted <- melt(allData, id.vars = c("subject", "activity"),
                      variable.name = "feature", value.name = "measured_value")

allDataMean <- dcast(allDataMelted, subject + activity ~ feature,
                     mean, value.var = "measured_value")

write.table(allDataMean, "tidy.txt", quote = FALSE, row.names = FALSE)



