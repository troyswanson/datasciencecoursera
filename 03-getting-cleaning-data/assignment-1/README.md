# Getting and Cleaning Data Course Project

This project only contains one script, but the script defines several functions and goes through a few steps of data tidying to ultimately generate a data frame containing averages aggragated across subject and activity.

## Cleaning

1. Get both datasets and bind them to a single data frame
2. Convert the subject column into a factor
3. Subset the data frame to only show columns containing "mean", "std", "activity", and "subject"
4. Get aggregate averages across subject and activity
5. Order the data by subject and activity for cleanliness
6. Write out the result to a text file