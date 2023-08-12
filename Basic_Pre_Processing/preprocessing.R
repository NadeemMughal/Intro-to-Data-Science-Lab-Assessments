#install.packages(tidyverse)
library(tidyverse)
#load dataset
Dataset = read_csv('adult.csv')

#view dataset
View(Dataset)
glimpse(Dataset)
#structure of dataset
str(Dataset)

#checking null values
colSums(is.na(Dataset))

#replace ? with NA
Dataset[Dataset =='?'] <- NA

#show head

head(Dataset)

#check null
colSums(is.na(Dataset))

#encoding
Dataset$workclass <- as.numeric(factor(Dataset$workclass))
Dataset$workclass
Dataset$education <- as.numeric(factor(Dataset$education))

Dataset$'marital-status' <- as.numeric(factor(Dataset$'marital-status'))

Dataset$relationship <- as.numeric(factor(Dataset$relationship))

Dataset$race <- as.numeric(factor(Dataset$race))

Dataset$gender <- as.numeric(factor(Dataset$gender))

Dataset$'native-country' <- as.numeric(factor(Dataset$'native-country'))


#replace with mean value

Dataset$workclass<- ifelse(is.na(Dataset$workclass),mean(Dataset$workclass,na.rm = TRUE),Dataset$workclass)

Dataset$occupation<- ifelse(is.na(Dataset$occupation),mean(Dataset$occupation,na.rm = TRUE),Dataset$occupation)

Dataset$'native-country'<- ifelse(is.na(Dataset$'native-country'),mean(Dataset$'native-country',na.rm = TRUE),Dataset$'native-country')







