#CodeBook for the tidy dataset

##Data source

The raw data for this experiment is the accelerometer data obtained from Galaxy S II smartphone. The link to the dataset is http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

##Feature Selection

The dataset is self explained in the README.txt and features.txt file present in the original dataset. I will summarize the steps and the naming conventions used by me to convert the raw data into the tidy data.

##Notations
The _XYZ- Refer to the 3-axis where the accelerometer signals have been obtained.
_mean 	- Mean value
_std 	- Standard deviation

The features that were considered for taking the measurements are explained with the raw dataset.

The features from the dataset have been normalized and bounded within [-1,1].

I followed the below steps for performing the transformation.
1. Merging the subject, signals (features), activity label for the train and test dataset.
2. Merging the train and test sets.
3. Naming the columns of the dataset with the feature names from feature.txt file.
4. Replacing the activity column with appropriate labels from the initial numeric values.
5. Extracting only the required features for the analysis
6. Modifying the column names to match Naming Convension.

The resulting dataset is tidy with respect to the following steps
1. One observation per row
2. One variable per column
3. Each table stores information about one kind of observation.
4. Meaningful column names with explanation in Cookbook.
5. Steps for reproducing the steps
6. Removal of inconsistencies.
