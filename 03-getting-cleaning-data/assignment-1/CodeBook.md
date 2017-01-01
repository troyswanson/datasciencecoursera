# Code Book

1. Load each of the data sets (test and train) and bind them to a single data frame. For each of the data sets, the following actions occur:
  a. The list of features labels are loaded into a vector.
  b. The feature data for the specified set is loaded as a fixed width file, with each feature representing 16 characters.
  c. The labels for each activity are loaded into a data frame.
  d. The activity data for the specified set is loaded in and converted to a factor vector with labels from the previous step.
  e. The factor vector from the previous step is added to the feature data frame from step b.
  f. The final data frame is returned.
2. Subset the data frame to only include columns containing "mean", "std", and "activity".
3. Split the data frame into a list of data frames based on activity.
4. Get the column averages for each item in the list.
5. Create a data frame of the averages for tidiness.