# Read me 

This file explains how all scripts work and how they are connected.  The scripts can be found in the folder **R**.

## 01_ReadData.R

This script reads the data bases for each group, testing and training, and stores them into two separate lists. Each list contains three elements named "X", "y", and "subject", respectively.  The lists are named `test_dfs` and `train_dfs`.

Activity labels and features are also read from the data folder and stored into `activity_labels` and `features` respectively (both of the `data.frame` class)

## 02_CleanUp.R
This script is divided into two sections. Section 1 cleans the data for the training and testing groups.  In each case three steps are taken, namely: 

1. Merging the data frames in each list (obtained from 01_ReadData.R)
2. Selecting only those columns containing the mean and standard deviation for each measurement
3. Using descriptive activity names

The resulting data frames are stored as `test` and `train`.

In the second section the rows of the dataframes `test` and `train` are binded.  The resulting data frame is named `full_df`.  Column names of this data frame are made more readable.  For example, the column name *fBodyGyro-std()-X* is transformed into *std_fBodyGyro_X* which can be later separated into the columns `statistic`, `measurement` and `dimension`.

## 03_TidyData.R
This script uses the data frames obtained from `02_CleanUp.R` and makes them tidy.  Two problems are solved:

1. In `full_df`, columns contain variable names which is solved by gathering into the key `measurement`
2. The newly gathered column contains three variables, which are `separate`d into `statistic`, `measurement`, and `dimension`.

Finally, a summary data frame is created which contains the mean value of each measurement for each subject and activity.   

