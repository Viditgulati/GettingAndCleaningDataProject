library(dplyr)
xtest<-read.table("UCI HAR Dataset/test/X_test.txt",header = FALSE)
ytest<-read.table("UCI HAR Dataset/test/y_test.txt",header = FALSE)
subject_test<-read.table("UCI HAR Dataset/test/subject_test.txt",header = FALSE)
xtrain<-read.table(header = FALSE,"UCI HAR Dataset/train/X_train.txt")
ytrain<-read.table(header = FALSE,"UCI HAR Dataset/train/y_train.txt")
subject_train<-read.table(header = FALSE,"UCI HAR Dataset/train/subject_train.txt")
features<-read.table("UCI HAR Dataset/features.txt",header = FALSE)
activityLabels<-read.table("UCI HAR Dataset/activity_labels.txt",header = FALSE)
colnames(xtrain)<-features[,2]
colnames(xtest)<-features[,2]
colnames(ytrain)<-"activityId"
colnames(ytest)<-"activityId"
colnames(subject_test)<-"subjectId"
colnames(subject_train)<-"subjectId"
colnames(activityLabels)<-c("activityId","activityType")
traindata<-cbind(ytrain,subject_train,xtrain)
testdata<-cbind(ytest,subject_test,xtest)
alldata<-rbind(traindata,testdata)
colNames<-colnames(alldata)
mns<-(grepl("activityId" , colNames) | grepl("subjectId" , colNames) | grepl("mean.." , colNames) | grepl("std.." , colNames))
mnsdata<-alldata[,mns==TRUE]
mnsdata<-merge(mnsdata,activityLabels,by = "activityId",all.x=TRUE)
mnsdata%>%
  group_by(subjectId,activityId)%>%
  summarise_all(mean)%>%
  write.table("finaldata.txt",row.names = FALSE)