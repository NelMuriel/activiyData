## Tidying up ----
# Two steps:
# 1. columns contain variable names
# 2. gathered key column contains three variables
tidy_df <- full_df %>% 
  tidyr::gather(measurement, value, 1:79) %>% 
  tidyr::separate(measurement, into = c("statistic", "measurement", "dimension")) %>% 
  tidyr::separate(measurement, into = c("domain", "measurement"), 1) %>% 
  mutate(domain = ifelse(domain == "t", "Time", "FastFourier"))


print(head(tidy_df))
message("The tidy data is now stored as tidy_df.  If you wish to see the summary, open 03_TidyData.R") 


# creating the summary data frame
tidy_df %>% 
  group_by(subject, activity, domain, dimension, measurement) %>% 
  summarise(MeanValue = mean(value))
