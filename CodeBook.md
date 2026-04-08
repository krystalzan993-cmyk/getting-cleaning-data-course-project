Code Book

Data Description

The data come from the Human Activity Recognition Using Smartphones Dataset. The dataset includes measurements collected from accelerometers and gyroscopes on a smartphone.

Variables

The final tidy dataset contains the following variables:

subject: identifier of the subject (1 to 30)

activity: activity performed by the subject

Activities include: - WALKING - WALKING_UPSTAIRS - WALKING_DOWNSTAIRS - SITTING - STANDING - LAYING

The remaining variables are the average of measurements of mean and standard deviation for each subject and activity.

Examples of variable names: - TimeBodyAccelerationMeanX - TimeBodyAccelerationSTDY - FrequencyBodyGyroscopeMeanZ - FrequencyBodyAccelerationMagnitudeSTD

Data Transformation Steps

The following steps were performed to clean the data:

The training and test datasets were loaded

The datasets were merged into a single dataset

Only measurements containing mean() and std() were extracted

Activity IDs were replaced with descriptive activity names

Variable names were cleaned and made more descriptive:

"t" replaced with "Time"

"f" replaced with "Frequency"

"Acc" replaced with "Acceleration"

"Gyro" replaced with "Gyroscope"

"Mag" replaced with "Magnitude"

Removed special characters such as "-", "(", ")"

A second tidy dataset was created with the average of each variable for each subject and activity

Output

The final output is a tidy dataset named:

tidy_data.txt

Each row represents one subject and one activity, and each column represents the average of a measurement variable.
