# returns a character vector of features that are present in each row in the data set
getFeatures <- function () {
  path <- "./data/features.txt"
  names <- c("id", "feature")
  classes <- c("numeric", "character")
  
  x <- read.table(path, sep = " ", col.names = names, colClasses = classes)
  
  x$feature
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

# returns a data frame for the given data set, including the row's activity
getSet <- function (set) {
  path <- sprintf("./data/%s/X_%s.txt", set, set)
  features <- getFeatures()
  widths <- rep.int(16, length(features))
  
  x <- read.fwf(path, widths, col.names = features, colClasses = "numeric", buffersize = 50)
  x$activity <- getActivities(set)
  
  x
}

# get both datasets and bind them to a single data frame
d <- rbind(getSet("test"), getSet("train"))

# subset the data frame to only show columns containing "mean", "std", and "activity"
d <- d[, grep("([Mm]ean|std|activity)", names(d))]

# split the data frame into a list of data frames based on activity
s <- split(d, d$activity)

# get the column averages for each item in the list
averages <- lapply(s, function(x) colMeans(x[, grep("[^activity]", names(x))]))

# create a data frame of the averages for tidiness
averages <- as.data.frame(do.call(rbind, averages))
