# Getting and Cleaning Data Course Project

This project only contains one script, but the script defines four functions and has a goes through a few steps of tidying up to ultimately generate a data frame of averages of each activity.

## Functions

<dl>
  <dt>getFeatures()</dt>
  <dd>Returns a character vector of features that are present in each row in the data set</dd>
  <dt>getActivityLabels()</dt>
  <dd>Returns a data frame of labels to classify activities</dd>
  <dt>getActivities(set)</dt>
  <dd>Returns a factor vector of activities for each row in the given data set</dd>
  <dt>getSet(set)</dt>
  <dd>Returns a data frame for the given data set, including the row's activity</dd>
</dl>

## Cleaning

1. Get both datasets and bind them to a single data frame
2. Subset the data frame to only show columns containing "mean", "std", and "activity"
3. Split the data frame into a list of data frames based on activity
4. Get the column averages for each item in the list
5. Create a data frame of the averages

See CodeBook.md for more details on the cleaning process