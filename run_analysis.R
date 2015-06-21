  # Read in all the data we need
  # -- Train Data
  train <- read.table("UCI HAR Dataset/train/X_train.txt")
  subject_train = read.table("UCI HAR Dataset/train/subject_train.txt")  
  trainActivity = read.table("UCI HAR Dataset/train/Y_train.txt")
  
  # -- Test Data
  test <- read.table("UCI HAR Dataset/test/X_test.txt")
  subject_test = read.table("UCI HAR Dataset/test/subject_test.txt")
  testActivity = read.table("UCI HAR Dataset/test/Y_test.txt")
  
  # -- References Data
  features <- read.table("UCI HAR Dataset/features.txt")
  activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")  
  
  # ------------------------------------------------------------------------
  # 1.) Merges the training and test sets to create one data set
  # ------------------------------------------------------------------------
  # 1.1) Start from combining rows of each train and test data set together
  trainAndTest <- rbind(train, test)
  subject_traintest <- rbind(subject_train, subject_test)
  activity_traintest <- rbind(trainActivity, testActivity)
  
  # 1.2) Then, we'll combind all these three tables together column wise. 
  mergedData <- cbind(trainAndTest, subject_traintest, activity_traintest)
  
  # ------------------------------------------------------------------------
  # 2.) Extracts only the measurements on the mean and standard deviation for each measurement
  # ------------------------------------------------------------------------
  # 2.1) Create a vector of features we want to extract
  selectedFeatures <- features[grepl("(mean[(][)]|std[(][)])", features$V2),]
  
  # 2.2) We only want the column ids of selected features
  selectedColumns <- selectedFeatures[,1]
  
  # 2.3) Add column 562 and 563 to the selectedColumns for subject and activity columns
  selectedColumns <- c(selectedColumns, 562, 563)
  
  # 2.4) Subset the merged data set so we only select the selected measurements & subject & activity columns
  extractedMergedData <- mergedData[, selectedColumns]
  
  # ------------------------------------------------------------------------
  # 3.) Uses descriptive activity names to name the activities in the data set
  # ------------------------------------------------------------------------
  # 3.1) Create a factor using information in activity_labels as labels
  f <- factor(extractedMergedData[,68], labels=activity_labels[,2])
  
  # 3.2) Replace the activity column with activity labels
  extractedMergedData[,68] <- f
  
  # ------------------------------------------------------------------------
  # 4.) Appropriately labels the data set with descriptive variable names. 
  # ------------------------------------------------------------------------
  # 4.1) Create a vector of feature names
  selectedColumnNames <- selectedFeatures[,2]
  
  # 4.2) Convert it from factors to characters
  selectedColumnNames <- as.character(selectedColumnNames)
  # Clean the feature names by replacing non-alphanumeric characters with dots, 
  # then remove the trailing dots
  selectedColumnNames <- gsub("[^a-zA-Z\\d\\s:]+", ".", selectedColumnNames)
  selectedColumnNames <- gsub("[^a-zA-Z\\d\\s:]$", "", selectedColumnNames)
  
  # 4.3) Append the feature names with names for our last two columns, 
  # which are SubjectId and Activity
  selectedColumnNames <- c(selectedColumnNames, "SubjectId", "Activity")
  
  # 4.4) Replace the current column names with the new vector we just created
  colnames(extractedMergedData) <- selectedColumnNames
  
  # ------------------------------------------------------------------------
  # 5.) From the data set in step 4, creates a second, independent tidy data set with 
  # the average of each variable for each activity and each subject.
  # ------------------------------------------------------------------------
  # 5.1) Use aggregate to apply the mean function to column 1 - 66, grouping them by Activity and by SubjectId
  newTidyData <- aggregate(extractedMergedData[1:66], list(Activity=extractedMergedData$Activity, SubjectId=extractedMergedData$SubjectId),mean)
  
  # 5.2) Swap column 1 and 2 (Activity & Subject Id) so that the SubjectId comes first.
  newTidyData <- newTidyData[, c(2, 1, 3:68)]
  
  write.table(newTidyData, "output.txt", row.names=FALSE)