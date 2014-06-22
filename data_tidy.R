## Reading in the Train data (subject data, x or attributes and y label)
subject_train <- read.table("train/subject_train.txt")
x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")

## Reading in the Test data (subject data, x or attributes and y label)
subject_test <- read.table("test/subject_test.txt")
x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")

## Joining the individual parts to form a complete dataset
train_df <- cbind(subject_train, x_train, y_train)
test_df <- cbind(subject_test, x_test, y_test)
comb_df <- rbind(train_df,test_df)

## Reading in the features and assigning the column names for the dataset
features <- read.table("features.txt")
feat <- as.character(features[,2])
names(comb_df) <- c("subject",feat,"activity")

## Reading the activity labels and assigning them to the label column of the dataset.
activity_labels <- read.table("activity_labels.txt")
comb_df[,563] <- factor(comb_df[,563])
levels(comb_df[,563]) <- as.character(activity_labels[,2])

## Creating vectors to identify the required mean and std columns
vec1 <- grep("-mean()",names(comb_df))
vec1 <- vec1 - 1
vec2 <- grep("-meanFreq()",names(comb_df))
vec2 <- vec2 - 1
vec3 <- setdiff(vec1,vec2)
vec4 <- grep("-std()",names(comb_df))
vec4 <- vec4 - 1
vec5 <- union(vec3,vec4)
vec6 <- vec5 + 1

## Applying the vector to form the refined dataset
comb_df[,1] <- factor(comb_df[,1])
refined_df <- comb_df[,c(1,sort(vec6),563)]

## Creating a new column to represent the subject-activity pairs
refined_df$subject.activity <- with(refined_df,interaction(subject,activity))

## Melting and recasting the dataset to contain the mean for each subject-activity pair
refined_df_melt <- melt(refined_df,id=c("subject.activity"),measure.vars=c(2:67))
refined_df_cast <- dcast(refined_df_melt,subject.activity~variable,mean)

## Modifying the names of the columns for matching format and better readability.
names(refined_df_cast) <- gsub("-","_",names(refined_df_cast),fixed=TRUE)
names(refined_df_cast) <- gsub("()","",names(refined_df_cast),fixed=TRUE)

## Writing the tidy data to the output file
write.table(refined_df_cast,file="../refined_dataset.txt",row.names=FALSE,quote=FALSE)
