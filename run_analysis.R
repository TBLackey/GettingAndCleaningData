require(dplyr)

#read in the sets
xtest<-read.table("UCI HAR Dataset/test/X_test.txt")
ytest<-read.table("UCI HAR Dataset/test/y_test.txt")
xtrain<-read.table("UCI HAR Dataset/train/X_train.txt")
ytrain<-read.table("UCI HAR Dataset/train/y_train.txt")
subjecttest<-read.table("UCI HAR Dataset/test/subject_test.txt")
subjecttrain<-read.table("UCI HAR Dataset/train/subject_train.txt")
activitylabel<-read.table("UCI HAR Dataset/activity_labels.txt")

#in the darkness bind them...
test<-cbind(subjecttest,ytest,xtest)
train<-cbind(subjecttrain,ytrain,xtrain)
data<-rbind(test,train)

#Assign descriptive labels to data - these are labels further detailed in features_info.txt
header<-c("SubjectID","ActivityID",as.character(read.table("UCI HAR Dataset/features.txt")[[2]]))
names(data)<-header

#Assign descriptive labels to activities
data[[2]]<-cut(data[[2]],breaks = 6,labels = activitylabel[[2]])

# Filter for only the means and standard deviations
# For completeness,also included the means of the sliding windows and frequency component means
meansandstdscol<-sort(c(1,2,grep("mean",header),grep("std",header),grep("Mean",header)))
data<-data[,meansandstdscol]

# summarise the data, and write to output text file
grouped_data<-group_by(data, SubjectID,ActivityID)
answer<-summarise_each(grouped_data, funs(mean))
write.table(answer,file = "tidy_data_set.txt",row.names = FALSE)




