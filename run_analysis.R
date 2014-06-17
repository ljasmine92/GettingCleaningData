

#read feature data
features<-read.table("./UCI HAR Dataset/features.txt")[,2]

#read column names
activity_labels<-read.table("./UCI HAR Dataset/activity_labels.txt")[,2]
#extract mean and standard deviation
extract_features <- grepl("mean|std", features)
#load and process test dataset
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test<-read.table("./UCI HAR Dataset/test/subject_test.txt")
names(X_test)=features
X_test = X_test[,extract_features]
y_test[,2] = activity_labels[y_test[,1]]
names(y_test) = c("Activity_ID", "Activity_Label")
names(subject_test) = "subject"
library("data.table")
test_data <- cbind(as.data.table(subject_test), y_test, X_test)

#load and process training dataset
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train<-read.table("./UCI HAR Dataset/train/subject_train.txt")
names(X_train)=features
X_train = X_train[,extract_features]
y_train[,2] = activity_labels[y_train[,1]]
names(y_train) = c("Activity_ID", "Activity_Label")
names(subject_train) = "subject"
train_data <- cbind(as.data.table(subject_train), y_train, X_train)

#merge test and training data sets to create on data set
projectdata = rbind(test_data, train_data)

library(reshape2)
#create the second data set with the average of each variable for each activity and each subject
newdataLabel1 = c("subject", "Activity_ID", "Activity_Label")
newdataLabel2 = setdiff(colnames(projectdata), newdataLabel1)
newdata   = melt(projectdata, id = newdataLabel1, measure.vars = newdataLabel2)
projectdata1 = dcast(newdata, subject + Activity_Label ~ variable, mean)
write.table(projectdata1, file = "./projectdata1.txt")
