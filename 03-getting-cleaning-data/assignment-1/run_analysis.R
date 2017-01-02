library(plyr)

# returns a character vector of features that are present in each row in the data set
getFeatures <- function () {
  path <- "./data/features.txt"
  names <- c("id", "feature")
  classes <- c("numeric", "character")
  
  x <- read.table(path, sep = " ", col.names = names, colClasses = classes)
  
  f <- x$feature
  
  # clean up names
  f <- gsub("[/(/)]", "", f)
  f <- gsub(",", "-", f)
  f <- sub("BodyBody", "Body", f)
  
  f
}

# returns a data frame of labels to classify activities
getActivityLabels <- function () {
  path <- "./data/activity_labels.txt"
  names <- c("id", "label")
  classes <- c("numeric", "character")
  
  x <- read.table(path, sep = " ", col.names = names, colClasses = classes)
  x
}

# returns a factor vector of activities for each row in the given data set
getActivities <- function (set) {
  path <- sprintf("./data/%s/y_%s.txt", set, set)
  names <- c("activity")
  classes <- c("numeric")
  
  f <- read.table(path, sep = " ", col.names = names, colClasses = classes)
  
  a = getActivityLabels()
  
  x <- factor(f$activity, levels = a$id, labels = a$label)
  x
}

# returns a numeric vector of subjects for each row in the given data set
getSubjects <- function (set) {
  path <- sprintf("./data/%s/subject_%s.txt", set, set)
  names <- c("subject")
  classes <- c("numeric")
  
  x <- read.table(path, sep = " ", col.names = names, colClasses = classes)
  
  x$subject
}

# returns a data frame for the given data set, including the row's activity
getSet <- function (set) {
  path <- sprintf("./data/%s/X_%s.txt", set, set)
  features <- getFeatures()
  widths <- rep.int(16, length(features))
  
  x <- read.fwf(path, widths, col.names = features, colClasses = "numeric", buffersize = 50)
  
  x$activity <- getActivities(set)
  x$subject <- getSubjects(set)
  
  x
}


# BEGIN SCRIPT #

# get both datasets and bind them to a single data frame
d <- rbind(getSet("test"), getSet("train"))

# convert the subject column into a factor
d$subject <- factor(d$subject)

# subset the data frame to only show columns containing "mean", "std", "activity", and "subject"
d <- d[, grep("([Mm]ean|std|activity|subject)", names(d))]

# get aggregate averages across subject and activity
averages <- aggregate(. ~ subject + activity, d, mean)

# order the data by subject and activity for cleanliness
averages <- averages[order(averages$subject, averages$activity), ]

# write out the result to a text file
write.table(averages, file = "averages.txt", row.name = FALSE)