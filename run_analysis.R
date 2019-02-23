## Script to run the steps in the cleaning and tidying process

rm(list = ls())
# read the README.md document to see what each scritp does
# the scripts can be found in the R directory of the project

 source("R/01_ReadData.R") # takes a moment
 source("R/02_CleanUp.R")
 source("R/03_TidyData.R")

rm(list = setdiff(ls(), "tidy_df"))
  
  