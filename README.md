#Getting and Cleaning Data Course Project
## Introduction
This is a project repository for Coursera's Getting and Cleaning Data(getdata-015)'s course project. The purpose of this project is to clean a dataset collected from the accelerometers from the Samsung Galaxy S smartphone. The script in this project will  

The dataset includes the following files:

- README.md

- run_analysis.R:  
  An R script which creates a tidy data as instructed

- codebook.md:  
  A codebook which explains the data collection as well as the details of each variable.


## Instructions
1. Download the raw data from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
2. Extract the downloaded file into your working directory. The program expects the folder "UCI HAR Dataset" to be in the working directory. Please make sure that the extraced folder name is correct
4. Run **run_analysis.R**, you should get "output.txt" as a result

## How it works
### Step 1 - Merges the training and test sets to create one data set
The script first loads all the data we need into our workspace.
```
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
```  
After that, we will merge the training and test sets to create one data set.
This is done by using a combination of rbind and cbind to put train data and test data together.
We start from combining rows of each data set using rbind.
```
    trainAndTest <- rbind(train, test)
    subject_traintest <- rbind(subject_train, subject_test)
    activity_traintest <- rbind(trainActivity, testActivity)  
```  
Then, we'll combind all these three tables together column wise with cbind.
``` 
    mergedData <- cbind(trainAndTest, subject_traintest, activity_traintest)
```  

### Step 2 - Extracts only the measurements on the mean and standard deviation for each measurement
Looking through the "features.txt" file that comes with the original data, we will find that there is a pattern to each feature's name. Measurements on the mean and standard deviation contain "mean()" and "std()" in their names respectively. We will use this to create a regular expression to select only the features that instruction ask us to.
```  
    selectedFeatures <- features[grepl("(mean[(][)]|std[(][)])", features$V2),]
    selectedColumns <- selectedFeatures[,1]
```    
With this, we'll have a vector of selected column numbers. However, we still want to keep the last two columns of our merged dataset, which are subject id and activity columns. The number of the last two columns are 562 and 563, so we will append those numbers into our selected columns vector.

```  
  selectedColumns <- c(selectedColumns, 562, 563)
  extractedMergedData <- mergedData[, selectedColumns]
```    
At this point, we will have a dataset with the interested measurements, subject id and activity.
### Step 3 - Uses descriptive activity names to name the activities in the data set
The activity column is still represented by number and thus makes it hard to tell the actual activity. 
Our new dataset has 68 columns with the activity column as our last column. We will use that column to create a factor with appropriate labels, with the help of the data we loaded from **activity_labels.txt**
```  
  f <- factor(extractedMergedData[,68], labels=activity_labels[,2])
  extractedMergedData[,68] <- f
```    

With this, each activity will be represented with a descriptive activity name instead of a number.
### Step 4 - Appropriately labels the data set with descriptive variable names
We will use the data we load from **features.txt** to replace the column names of our data set. We can use the "selectedFeatures" we already created in Step 2. By accessing its second column, we will be able to get the names of selected features. Since this is a factor, we have to convert it to a character vector.

```  
  selectedColumnNames <- selectedFeatures[,2]
  selectedColumnNames <- as.character(selectedColumnNames)
```    
Currently, the names that are in features.txt contains non-alphaneumeric characters like "-" and "()". I personally prefer "." notation, thus I use regular expressions to replace non-alphaneumeric characters to "."

```  
  
  # Clean the feature names by replacing non-alphanumeric characters with dots, 
  # then remove the trailing dots
  selectedColumnNames <- gsub("[^a-zA-Z\\d\\s:]+", ".", selectedColumnNames)
  selectedColumnNames <- gsub("[^a-zA-Z\\d\\s:]$", "", selectedColumnNames)
```  

We still need to manually assign appropriate labels to the last two columns, which are subject id and activity columns. We will name them "SubjectId" and "Activity". We then replace the current column names with the new column names vector we just created.

```    
  selectedColumnNames <- c(selectedColumnNames, "SubjectId", "Activity")
  
  colnames(extractedMergedData) <- selectedColumnNames
```   

### Step 5 - Create a second, independent data set with the average of each variable for each activity and each subject
We will use aggregate function to apply the mean function to our data set, grouping them by Activity and SubjectId columns
```
  newTidyData <- aggregate(extractedMergedData[1:66], list(Activity=extractedMergedData$Activity, SubjectId=extractedMergedData$SubjectId),mean)
```  

I want the data set to start with SubjectId rather than Activity, so we will switch them.  
```  
  newTidyData <- newTidyData[, c(2, 1, 3:68)]
```      


At this point, we will have a tidy data with the following properties

- Each variable we measure is in one column
- Each different observation of that variable is in a different row
- Each variable has descriptive variable name
- Variable names are human readable

As a final step, we will write the new tidy dataset out as a text file, using write.table with row.names=FALSE as instructed.
```  
write.table(newTidyData, "output.txt", row.names=FALSE)
```      

## Using the Output File
The output.txt generated by **run_analysis.R** can be loaded back into R by using the following code:
```  
 data <- read.table(file_path, header = TRUE)
```  