library(plyr)
library(dplyr)
library(reshape2)
setwd("C:/Users/1257256940.MIL/Desktop/Coursera/Tidy/")


###Finds Activities names and those that include only the mean and standard deviation
activityLabels<-read.table("activity_labels.txt")
features<-read.table("features.txt")
features<-features[grep(".*mean.* |.*std*.",features[,2]),]

#Reads in and combines the train dataset
train<-read.table("X_train.txt")
train<-train[features[,1]]
trainActivities<-read.table("Y_train.txt")
trainSubjects<-read.table("subject_train.txt")
train<-cbind(trainSubjects,trainActivities, train)

#Reads in and combines the test dataset
test<-read.table("X_test.txt")
test<-test[features[,1]]
testActivities<-read.table("Y_test.txt")
testSubjects<-read.table("subject_test.txt")
test<-cbind(testSubjects, testActivities, test)

#combines and names test/training data
data<-rbind(train,test)
colnames(data)<-c("subject","activity", as.character(features[,2]))
head(data)


#gives the mean per subject for each activity
data$activity <- factor(data$activity, levels = activityLabels[,1], labels = as.character(activityLabels[,2]))
data$subject <- as.factor(data$subject)
meltdata<-melt(data, id = c("subject","activity"))
head(meltdata)
datamean<-dcast(meltdata,subject+activity~variable,mean)

# write final tidy data
write.table(datamean, file = "C:/Users/1257256940.MIL/Desktop/Coursera/Tidy/tidydata.txt", row.names = FALSE, col.names = TRUE)

