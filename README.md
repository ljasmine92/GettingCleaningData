Getting and Cleaning Data
Course Project

The script run_analysis.R does the following:

    1. Merges the training and the test sets to create one data set.
    2. Extracts only the measurements on the mean and standard deviation for each measurement.
    3. Uses descriptive activity names to name the activities in the data set
    4. Appropriately labels the data set with descriptive activity names.
    5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Steps:

    1. Download the data source and save in a folder on your local drive. You'll have a UCI HAR Dataset folder after you unzip the source file.
    2. Install reshape2 and data.table packages.
    2. Save run_analysis.R in the parent folder of UCI HAR Dataset, set it as your working directory using setwd() function in RStudio.
    3. Run run_analysis.R from the working directory. A new file named "projectdata1.txt" will be generated in your working directory.

 