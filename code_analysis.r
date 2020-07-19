setwd("./")
a=read.table("train/subject_train.txt")
str(a)
b=read.table("train/X_train.txt")
str(b)
c=read.table("train/y_train.txt")
str(c)
d=read.table("features.txt")
str(d)
colnames(b)=d$V2
b$Person_Id = a
library(dplyr)
library(stringr)
acting = read.table("activity_labels.txt")
activity = inner_join(acting,c)
b$activity = activity$V2
train = b[str_detect(names(b),"mean|std"),]
train = b[,str_detect(names(b),"mean|std")]
train$activity = b$activity
train$person_id = b$Person_Id
train$person_id = as.factor(train$person_id$V1)
str(train)
a=read.table("test/subject_test.txt")
str(a)
b=read.table("test/X_test.txt")
str(b)
c=read.table("test/y_test.txt")
str(c)
colnames(b)=d$V2
b$Person_Id = a
activity = inner_join(acting,c)
b$activity = activity$V2
test = b[str_detect(names(b),"mean|std"),]
test = b[,str_detect(names(b),"mean|std")]
test$activity = b$activity
test$person_id = b$Person_Id
test$person_id = as.factor(test$person_id$V1)
str(test)
final_data=bind_rows(train,test)
str(final_data)
tidy_person = aggregate(final_data, by=list(final_data$person_id) ,FUN = "mean")
str(tidy_person)
tidy_activity = aggregate(final_data, by=list(final_data$activity) ,FUN = "mean")
str(tidy_activity)
write.table(final_data, file = "tidy.txt")
tidy=bind_rows(tidy_activity,tidy_person)
write.table(tidy, file="tidy_dataset.txt")
