# run_analysis.R

# 1. Read files
# 2. Merge training and test sets
# 3. Extract mean and standard deviation measurements
# 4. Use descriptive activity names
# 5. Label the data set with descriptive variable names
# 6. Create a second tidy data set with the average of each variable
# 7. Write the tidy data set to a txt file

features <- read.table("UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", stringsAsFactors = FALSE)

x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

colnames(x_train) <- features[, 2]
colnames(x_test) <- features[, 2]

colnames(y_train) <- "activity"
colnames(y_test) <- "activity"

colnames(subject_train) <- "subject"
colnames(subject_test) <- "subject"

x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)

merged_data <- cbind(subject_data, y_data, x_data)

mean_std_features <- grep("mean\\(\\)|std\\(\\)", features[, 2])
selected_data <- merged_data[, c(1, 2, mean_std_features + 2)]

selected_data$activity <- factor(
  selected_data$activity,
  levels = activity_labels[, 1],
  labels = activity_labels[, 2]
)

names(selected_data) <- gsub("^t", "Time", names(selected_data))
names(selected_data) <- gsub("^f", "Frequency", names(selected_data))
names(selected_data) <- gsub("Acc", "Acceleration", names(selected_data))
names(selected_data) <- gsub("Gyro", "Gyroscope", names(selected_data))
names(selected_data) <- gsub("Mag", "Magnitude", names(selected_data))
names(selected_data) <- gsub("BodyBody", "Body", names(selected_data))
names(selected_data) <- gsub("-mean\\(\\)", "Mean", names(selected_data))
names(selected_data) <- gsub("-std\\(\\)", "STD", names(selected_data))
names(selected_data) <- gsub("-", "", names(selected_data))
names(selected_data) <- gsub("\\(\\)", "", names(selected_data))

tidy_data <- aggregate(. ~ subject + activity, data = selected_data, mean)

tidy_data <- tidy_data[order(tidy_data$subject, tidy_data$activity), ]

write.table(tidy_data, file = "tidy_data.txt", row.names = FALSE)





