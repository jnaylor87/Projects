#Packages and Libraries
library(downloader)
library(readr)
library(tidyverse)
library(magrittr)

# Download Dataset and Unzip
url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download(url, dest="~/project.zip", mode="wb") 
unzip("project.zip")

#Read in
X_Test<-read.table("~/UCI HAR Dataset/test/X_test.txt")
y_Test<-read.table("~/UCI HAR Dataset/test/y_test.txt")
Sub_Test<-read.table("~/UCI HAR Dataset/test/subject_test.txt")
X_Train<-read.table("~/UCI HAR Dataset/train/X_train.txt")
y_Train<-read.table("~/UCI HAR Dataset/train/y_train.txt")
Sub_Train<-read.table("~/UCI HAR Dataset/train/subject_train.txt")
Act_Label<-read.table("~/UCI HAR Dataset/activity_labels.txt")
Features<-read.table("~/UCI HAR Dataset/features.txt")

#Build Tables, Add Labels, and Select Mean and STD
colnames(X_Test)<-Features$V2
X_Test<-X_Test[, grep("mean|std",colnames(X_Test))]
colnames(y_Test)<-c("Activities")
colnames(Sub_Test)<-c("Subjects")
Test_Full<- cbind(Sub_Test,y_Test,X_Test)
colnames(X_Train)<-Features$V2
X_Train<-X_Train[, grep("mean|std",colnames(X_Train))]
colnames(y_Train)<-c("Activities")
colnames(Sub_Train)<-c("Subjects")
Train_Full<- cbind(Sub_Train,y_Train,X_Train)
Full_Data<-rbind(Test_Full,Train_Full)

#Relabel Activities
colnames(Act_Label)<-c("Activities","Act_Label")
Full_Data<-left_join(Full_Data,Act_Label,by="Activities")


#Mean and Std Dev of Measurements for Each Subject and Activity
Full_Data %>%
  group_by(Subjects,Act_Label) %>%
  summarize_all(mean) -> Subject_Averages






