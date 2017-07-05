# Load the data
train.data <- read.table("./train/X_train.txt", header = FALSE)
train.labels <- read.table("./train/y_train.txt", header = FALSE)
train.subject <- read.table("./train/subject_train.txt", header = FALSE)
test.data <- read.table("./test/X_test.txt", header = FALSE)
test.labels <- read.table("./test/y_test.txt", header = FALSE)
test.subject <- read.table("./test/subject_test.txt", header = FALSE)

#Merge the data
train <- cbind(train.subject, train.labels, train.data)
test <- cbind(test.subject, test.labels, test.data)
data<-rbind(train, test)

#Extracts only the measurements of the mean and standard deviation 
features <- read.table("./features.txt", header = FALSE, 
                       stringsAsFactors = FALSE)
features_extract <- features[grep("mean\\(\\)|std\\(\\)", features$V2), ]
data_extract <- data[, c(1, 2, features_extract$V1+2)]

#Name activities with descriptive activity names
labels <- read.table("./activity_labels.txt", header = FALSE)
data_extract$V1.1 <- labels[data_extract$V1.1, 2]

#Use descriptive variable names to label the data set
column_names<- c("subject", "label", features_extract$V2)
colnames(data_extract)<-column_names

#Creates a second, independent tidy data set with the average of each variable 
#for each activity and each subject.
data_extract_tidy <- aggregate(data_extract[, 3:68], 
                       by=list(label = data_extract$label, 
                               subject = data_extract$subject), mean)

#Writes a table with the tidy data
write.table(data_extract_tidy, file = "tidydata.txt",row.name=FALSE)
data_extract_tidy