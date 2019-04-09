# Getting-and-Cleaning-Data-Project

This readme file describes the steps taken in the run_Anlaysis.R script for the Getting and Cleaning Data Project.

* 1. Reads in the data for the activities and features, and trims the features data to only include measurements for the mean and standard deviation.
* 2. Reads in the test and train data and combines them into one data set.
* 3. "Melts" the train and test data into one "tidy" data set, and calculates the mean for each test by subject and activity.
* 4. Cleans up the names of the features data to make them more understandable.
* 5. Writes the output to a "tidydata.txt" file.
