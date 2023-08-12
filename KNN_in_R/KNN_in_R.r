library(tidyverse)

data <- read.csv("/kaggle/input/adult1/adult.csv")

glimpse(data)

View(data)

data.subset <- data[c('age','workclass','education','marital.status','occupation','relationship','race','gender','hours.per.week','income')]

glimpse(data.subset)

data.subset[data.subset =='?'] <- NA

colSums(is.na(data.subset))

#Encoding
data.subset$workclass <- as.numeric(factor(data.subset$workclass))

data.subset$education <- as.numeric(factor(data.subset$education))
data.subset$marital.status <- as.numeric(factor(data.subset$marital.status))
data.subset$occupation <- as.numeric(factor(data.subset$occupation))
data.subset$relationship <- as.numeric(factor(data.subset$relationship))
data.subset$race <- as.numeric(factor(data.subset$race))
data.subset$gender <- as.numeric(factor(data.subset$gender))


colSums(is.na(data.subset))

#Mean
#replace with mean value

data.subset$workclass<- ifelse(is.na(data.subset$workclass),mean(data.subset$workclass,na.rm = TRUE),data.subset$workclass)

data.subset$occupation<- ifelse(is.na(data.subset$occupation),mean(data.subset$occupation,na.rm = TRUE),data.subset$occupation)


colSums(is.na(data.subset))

# Data Normalization
# Define a function for min-max scaling
min_max_scaling <- function(x) {
  (x - min(x)) / (max(x) - min(x))
}



# Apply min-max scaling to all numeric columns in the dataset
data.subset[, sapply(data.subset, is.numeric)] <- apply(data.subset[, sapply(data.subset, is.numeric)], 2, min_max_scaling)

head(data.subset)





head(data.subset)

#Train-Test Split

# required library for data splition
library(caTools)
set.seed(123)


split = sample.split(data.subset$income, SplitRatio = 0.8)

#returns true if observation goes to the Training set and false if observation goes to the test set.

#Creating the training set and test set separately

training_set = subset(data.subset, split == TRUE)
test_set = subset(data.subset, split == FALSE)


#checking total row
NROW(data.subset)

#checking training row
NROW(training_set)

#checking training row
NROW(test_set)

glimpse(data.subset)

#Creating seperate dataframe for 'Creditability' feature which
#is our target.
train.loan_labels <- training_set[,-1]
test.loan_labels <-test_set[,-1]

NROW(train.loan_labels)
NROW(test.loan_labels)

install.packages("class")
install.packages("caret")


library(class)
library(caret)

knn.26 <- knn(train=training_set, test=test_set, cl=training_set$income, k=26)
knn.27 <- knn(train=training_set, test=test_set, cl=training_set$income, k=27)

# Set the value of k for kNN (you can choose any appropriate value)
k <- 184

# Apply kNN on the train set and predict the target for the test set
knn_predictions <- knn(training_set[,-10], test_set[,-10], training_set$income, k)

# Calculate the accuracy of the kNN model
accuracy <- sum(knn_predictions == test_set$income) / nrow(test_set)
cat("Accuracy for k = 184:", accuracy * 100, "%\n")

# Create a vector to store accuracy values for each k
accuracy_vector <- c()

# Loop through k values from 1 to 30
for (k in 1:30) {
  knn_predictions <- knn(training_set[, -10], test_set[, -10], training_set$income, k)
  accuracy <- sum(knn_predictions == test_set$income) / nrow(test_set)
  cat("Accuracy for k =", k, ":", accuracy * 100, "%\n")
  accuracy_vector <- c(accuracy_vector, accuracy)
}



# Plot the accuracy for different k values
plot(1:30, accuracy_vector, type = "b", xlab = "k", ylab = "Accuracy",
     main = "Accuracy vs. k for k-Nearest Neighbors")












































