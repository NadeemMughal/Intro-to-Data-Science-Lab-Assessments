#Q1 

library(tidyverse)
library(caTools)
library(caret)




# a)
data <- read.csv('mtcars.csv')

# b)
missing_values <- sum(is.na(mtcars))
if (missing_values > 0) {

  mtcars <- na.omit(mtcars)
}


# c)
mtcars$mpg <- scale(mtcars$mpg)
mtcars$hp <- scale(mtcars$hp)
#Another way is 

min_max_scalling <- function(x){
  return (x-min(x)/max(x)-min(x))
}

data.subset_n<-mtcars[c('mpg','hp')]



dataset_n <- as.data.frame(lapply(data.subset_n,min_max_scalling))
View(dataset_n)

# d)

#Encoding

dataset$cyl<-as.numeric(factor(mtcars$cyl))

View(mtcars)

# e)
boxplot(mtcars[, -grep("cyl", colnames(mtcars))], main="Boxplot of mtcars Variables")

# f)
set.seed(123)

split<-sample.split(mtcars,SplitRatio=0.80)
train_80 <- subset(mtcars$vs,split==TRUE)
test_20 <- subset(mtcars,split==FALSE)
NROW(mtcars)
NROW(train_80)
NROW(test_20)


#Q2 

# d)
set.seed(123)
split<-sample.split(mtcars,SplitRatio=0.80)
train_80 <- subset(mtcars$vs,split==TRUE)
test_20 <- subset(mtcars,split==FALSE)
NROW(mtcars)
NROW(train_80)
NROW(test_20)

# e)
library(class)

features <- c("mpg", "hp", "qsec")
target <- "vs"
knn_model <- knn(train = train_80[, features], test = test_20[, features], cl = train_20[, target], k = 5)

# f)
accuracy <- sum(knn_model == test_set$vs) / length(test_set$vs)
cat("Accuracy:", accuracy, "\n")

# g)


for(k in 1:30){
  
  knn_model <- knn(train = train_80[, features], test = test_20[, features], cl = train_20[, target], k = k)
  
  accuracy <- sum(knn_model == test_20$vs) / length(test_20$vs)
  cat("Accuracy:", accuracy, "\n")
  
  
}




###### Q3 ######
# a)
features <- c("hp", "wt", "qsec")
target <- "mpg"
#Q3


lm_model <- lm(vs~.,data=train_80)  

summary(lm_model)
# b)
predictions <- predict(lm_model, newdata = test_20)
rmse <- sqrt(mean((test_20$mpg - predictions)^2))
cat("Error:", rmse, "\n")

# c)
summary(lm_model)
