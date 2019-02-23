## Script to run the steps in the cleaning and tidying process

rm(list = ls())
source("R/01_ReadData.R") # takes a moment
source("R/02_CleanUp.R")
source("R/03_TidyData.R")
rm(list = setdiff(ls(), "tidy_df"))
    