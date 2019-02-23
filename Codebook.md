# Getting and Cleaning Data Course Project
## Codebook

This codebook describes the steps to tidy up the *Human Activity Recognition Using Smartphones Data Set* which was downloaded from the [Coursera archive](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)  on feb 23, 2019.
The dataset contains the records of 30 subjects performing six activities of daily living (ADL), namely:

- walking
- walking downstairs  
- walking upstairs
- sitting
- standing
- laying

The participants carried a waist-mounted smartphone (Samsung Galaxy S II) with embedded [accelerometer](https://en.wikipedia.org/wiki/Accelerometer) and [gyroscope](https://en.wikipedia.org/wiki/Gyroscope).  An updated version of the data can be found [here](http://archive.ics.uci.edu/ml/datasets/Smartphone-Based+Recognition+of+Human+Activities+and+Postural+Transitions).  For fther information on the dataset, refer to [the dataset's web page](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).  A video recording all six activities for one particular participant can be found [here](http://www.youtube.com/watch?v=XOEN9W05_4A).

## Data sets and variables

The dataset, entitled **Human Activity Recognition Using Smartphones,
Version 1.0**, and put together by Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, and Davide Anguita in November 2012, record measurements of the six ADL activities for 30 volunteers in an age range of 19 to 48 years.  After processing, the obtained dataset was partitioned, at random, into two sets: a training set, containing 70% of the observations; and a test set, with the remaining 30%.

The resulting data is contained in the directory **data**.  In this directory there are four plain text files and two further directories, **train** and **test**.  The plain files are `activity_labels.txt`, `features.txt`, `features_info.txt`, and `README.txt`.  The first of these files links the textual description of each activity (for instance *walk upstairs*) with a numeric value (identifier = 2). The `features.txt` file contains the names of all the data computed from the experimental records, further information about which can be found in the file `features_info.txt`.  Finally, the `README.txt` file, briefly explains the data set.

Each one of the two sub-directories, **train** and **test**, contains a further one named **Intertial Signals** which is of no relavance to the present project, and three plain text files: `subject_test.txt`, `X_test.txt`, and `y_test.txt`.  The first of these files contains the subject identifier for each set of measurements, and the file `y_test.txt` contains the corresponding activity number (1 to 6).    The file `X_test.txt`contains the values of all the 561 measurments.

## Data transformations and summary

The subject and activity identifiers were first binded with the measurements for both groups.  The resulting two data frames were then subset to extract only the columns which contained the mean and standard deviation of each type of measurment.  The activity column in this data frame was transformed from a numerical into a textual value which helps identify the different activities.  This operation is based in the refernece file `activity_labels.txt`.  Finally, a group called `group` was added which holds the value *train* for those subjects in the trainign group and *test* for the ones in the testing group.

Binding the rows of the two previous data frames, a final data frame, named `full_df`, was produced which contains both groups.  The names of this data frame are set with the aid of the file `features.txt` and they are then simplified to be both, more humanly readable and more ammenable to future work.  

Next, a tidy version of this data frame was created.  Two particular issues were solved at this stage, namely: 1) the column names of `full_df`, arising from `features.txt` represent variables and 2) each one of these names represents three different variables.  We solve issue (1) by gathering the data frame columns into the pair (measurment, value) and (2) is solved by separating this new column into `statistic` (with values "mean" and "sd"), `measurment` (which identifies the particular measurment being taken such as Body Acceleration in the time domain -tBodyAcc), and `dimension` (which registers the X, Y and Z dimension of a 3-dimensional record).

Finally, a summary data frame was created which shows the average value of each measurement for every activity and subject.





