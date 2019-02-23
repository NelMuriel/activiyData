# Cleaning up
library(dplyr)

## Section 1:----
## cleaning test and train data sets
index_mean <- grep("mean", features$V2)
index_std <- grep("std", features$V2)
feature_names <- c(features$V2[c(index_mean, index_std)])

# 1. merge the data frames in each list 
# 2. select correct columns (mean and std for each measurement)
# 3. use descriptive activity names

nx <- ncol(test_dfs[["X"]])

test <- bind_cols(test_dfs) %>% 
  select(c(index_mean, index_std, nx + 1, nx + 2)) %>% 
  setNames(c(feature_names, "activity", "subject")) %>% 
  mutate(group = "test", 
         activity = activity_labels[activity, 2]) 
 
 
train <- bind_cols(train_dfs) %>% 
  select(c(index_mean, index_std, nx + 1, nx + 2)) %>% 
  setNames(c(feature_names, "activity", "subject")) %>% 
  mutate(group = "train",
         activity = activity_labels[activity, 2]) 


## Section 2: ----
## Bind both data frames and set column names to something descriptive

full_df <- bind_rows(test, train)
new_names <- strsplit(names(full_df)[-(80:82)], split = "-") %>% 
  sapply(function(x) paste(x[2], x[1], x[3], sep = "_")) %>% 
  stringr::str_replace("\\(\\)", "") %>% 
  stringr::str_replace("NA", "ANGLE")
names(full_df) <- c(new_names, "activity", "subject", "group")
  
