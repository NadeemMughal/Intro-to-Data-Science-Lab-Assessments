library(tidyverse)
data <- read.csv("Automobile_data.csv")
glimpse(data)
View(data)
data[data == "?"] <- NA
View(data)
sum(is.na(data))
colSums(is.na(data))

glimpse(data)

data$normalized.losses<-as.numeric(factor(data$normalized.losses))
data$make<-as.numeric(factor(data$make))
data$fuel.type<-as.numeric(factor(data$fuel.type))
data$aspiration<-as.numeric(factor(data$aspiration))
data$num.of.doors<-as.numeric(factor(data$num.of.doors))
data$body.style<-as.numeric(factor(data$body.style))
data$drive.wheels<-as.numeric(factor(data$drive.wheels))
data$engine.location<-as.numeric(factor(data$engine.location))
data$horsepower<-as.numeric(factor(data$horsepower))
data$peak.rpm<-as.numeric(factor(data$peak.rpm))
data$engine.type<-as.numeric(factor(data$engine.type))
data$num.of.cylinders<-as.numeric(factor(data$num.of.cylinders))
data$fuel.system<-as.numeric(factor(data$fuel.system))
data$bore<-as.numeric(factor(data$bore))
data$stroke<-as.numeric(factor(data$stroke))

glimpse(data)
# Here is Price Attribute it will take price as a character type so we need to Encode it.
data$price<-as.numeric(data$price)

glimpse(data)



data$normalized.losses<-ifelse(is.na(data$normalized.losses),mean(data$normalized.losses,na.rm = TRUE),data$normalized.losses)
glimpse(data)
colSums(is.na(data))
data$num.of.doors<-ifelse(is.na(data$num.of.doors),mean(data$num.of.doors,na.rm = TRUE),data$num.of.doors)
data$engine.location<-ifelse(is.na(data$engine.location),mean(data$engine.location,na.rm = TRUE),data$engine.location)


data$bore<-ifelse(is.na(data$bore),mean(data$bore,na.rm = TRUE),data$bore)
data$horsepower<-ifelse(is.na(data$horsepower),mean(data$horsepower,na.rm = TRUE),data$horsepower)
data$stroke<-ifelse(is.na(data$stroke),mean(data$stroke,na.rm = TRUE),data$stroke)
data$peak.rpm<-ifelse(is.na(data$peak.rpm),mean(data$peak.rpm,na.rm = TRUE),data$peak.rpm)

data$peak.rpm<-ifelse(is.na(data$peak.rpm),mean(data$peak.rpm,na.rm = TRUE),data$peak.rpm)
data$price<-ifelse(is.na(data$price),mean(data$price,na.rm = TRUE),data$price)



glimpse(data)
colSums(is.na(data))

min_max_scalling <- function(x){
  return (x-min(x)/max(x-min(x)))
} 

numeric_columns <- names(data)[sapply(data, is.numeric)]

# Exclude the last column (Price) from the list of numeric columns
numeric_columns <- numeric_columns[numeric_columns != "Price"]

# Perform min-max scaling on the selected numeric columns
data[, numeric_columns] <- apply(data[, numeric_columns], 2,min_max_scalling)

View(data)


glimpse(data)




library(class)
library(caret)
library(caTools)

set.seed(123)
#Train Test Split
split <- sample.split(data,SplitRatio=0.75)
train <- subset(data,split==TRUE)
test <- subset(data,split==FALSE)

NROW(data)
NROW(train)
NROW(test)


# Implement Regression model. 

        
lm.fit1 <- lm(price~.+length,data=train)
#lm(dependentvariable~.-removethose who are independent, then give train data)
summary(lm.fit1)

# Fitting Linear regression
# . is used to fit predictor using all independent variables
lm.fit1 <- lm(price~.,data=train)
#lm(dependentvariable~.-removethose who are independent, then give train data)
summary(lm.fit1)


# Fitting Linear regression
# . is used to fit predictor using some independent variables
lm.fit2 <- lm(price~.-length-bore,data=train)
#lm(dependentvariable~.-removethose who are independent, then give train data)
summary(lm.fit2)


# . is used to fit predictor using some independent variables
lm.fit2 <- lm(price~.+length+bore,data=train)
#lm(dependentvariable~.-removethose who are independent, then give train data)
summary(lm.fit2)

