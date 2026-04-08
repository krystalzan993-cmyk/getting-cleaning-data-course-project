Getting and Cleaning Data Course Project

Project Description

The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

The data used in this project come from the Human Activity Recognition Using Smartphones Dataset.

Files included

run_analysis.R: script used to clean and prepare the data

CodeBook.md: describes the variables, the data, and the transformations performed

tidy_data.txt: the final tidy data set

How the script works

The script performs the following steps:

Reads the training and test data sets

Merges the training and test data into one data set

Extracts only the measurements on the mean and standard deviation

Uses descriptive activity names to label the activities

Labels the data set with descriptive variable names

Creates a second tidy data set with the average of each variable for each activity and each subject

Writes the final tidy data set to a file called tidy_data.txt

How to run the script

Set the working directory to the folder containing the dataset

Place the dataset files (train, test, features.txt, activity_labels.txt) in the working directory

Run the script: ```r source("run_analysis.R")
