---
title: "CodeBook"
author: "Vidit"
date: "11/05/2020"
output: html_document
---
This code book describes the structure and the variables of the data set "tidy_dataset_with_avg.txt", resulting from executing the "run_analysis.R" script.

Raw data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Full description of the raw data: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

You can easily read the resulting data set using the command read.table: df<-read.table("tidy_dataset_with_avg.txt", header=TRUE)

The resulting data frame is composed of 180 observations (rows) and 88 variables (columns).

There is a total of 30 observations for each subject studied. In total, 6 subjects were observed.

Column 1 "subjectID": is a numeric identifier of the subject who performed the activity

Column 2 "activityId": is a numeric identifier of the performed activity

Column 82 "activitType": identifies the type of activity performed by the subjects. It's a factor variable and there are 6 possible levels: LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS.

Columns 3 to 81: these are all numeric variables and contains measurements on the mean and standard deviations.

FinalData.txt: Contains the data with average mean and for each variable for each activity for each subject.