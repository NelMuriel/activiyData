# Reading the data

read_sets <- function(group = c("test", "train")){
  x <- paste("X_", group, ".txt", sep = "")
  y <- paste("y_", group, ".txt", sep = "")
  subs <- paste("subject_", group, ".txt", sep = "")
  x_path <- file.path("data", group, x)
  y_path <- file.path("data", group, y)
  s_path <- file.path("data", group, subs)
  res <- lapply(c(x_path, y_path, s_path), read.table)
  names(res) <- c("X", "y", "subject")
  res
}

test_dfs <- read_sets("test")
train_dfs <- read_sets("train")

act_labels <- read.table("data/activity_labels.txt", stringsAsFactors = FALSE)
features <- read.table("data/features.txt", stringsAsFactors = FALSE)
