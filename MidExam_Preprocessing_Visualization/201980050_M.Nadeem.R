#Paper A

#Section A

#Q1 A-MCQS
# 1-list
# 2-factor()
#Q2 A-MCQS
# 3-The values in the `C` column will be the concatenation of values from columns `A` and `B`.
#Q3 A-MCQS
# Jaccard Similarity is Null
#Q4 A-
#It produce Matrix like      
#     x  y
#[1,] 1  3
#[2,] 3  2
#[3,] 5 10
# It Convert Rows into Column.
#Q5 A-
#First it save a vector in which 'x' have 1 to 10 values. 
# it produce error like this Error in if (x > 5) { : the condition has length > 1
#Because the length of condition is Greater than one but here condition run just one time.
#When x compare with 5 at that time x has a vector so it gives a error.
x <- 1:10
class(x)
if(x > 5) {
  x <- 0
}

a<-c(1,2,3,4,5,6)
factor(a)



#Section B
#Data Visualization
library(tidyverse)
Dataset <- read.csv('Titanic.csv')
glimpse(Dataset)
#1-
ggplot(data = Dataset,mapping = aes(x=Age,y=Fare))+geom_jitter()
ggplot(data = Dataset)+geom_point(mapping = aes(x=Age,y=Fare,color=Pclass))
ggplot(data = Dataset,mapping = aes(x=Age,y=Fare))+geom_point(position="jitter")
ggplot(data = Dataset)+geom_point(mapping = aes(x=Age,y=Fare,alpha=Pclass))


#2-
ggplot(data = Dataset,mapping = aes(x=Pclass))+geom_bar()+labs(title = "Representation of Pclass Classes",x="PClass Classes",y="Counts of Pclass Classes")+theme_bw()
#According to Probability
ggplot(data = Dataset,mapping = aes(x=Pclass,y=stat(prop)))+geom_bar()+labs(title = "Representation of Pclass Classes",x="PClass Classes",y="Counts of Pclass Classes")+theme_bw()


#Section C
#Data Pre-Processing

Dataset <- read.csv('Titanic.csv')
#Check Count of Null Values
colSums(is.na(Dataset))
#Here is nothing missing value
glimpse(Dataset)
summary(Dataset)
View(Dataset)
#Encode 
Dataset$Sex <- as.integer(factor(Dataset$Sex))
glimpse(Dataset)
View(Dataset)
#Min-Max-Scalling
min_max_scaling <- function(x){
  x=x-min(x)/max(x)-min(x)
}

Dataset_Age_Scale <- ifelse(Dataset$Age,min_max_scaling(Dataset$Age),Dataset$Age)

print(Dataset_Age_Scale)


Dataset_Fare_Scale <- ifelse(Dataset$Fare,min_max_scaling(Dataset$Fare),Dataset$Fare)

print(Dataset_Fare_Scale)

#Dataset$Age<- Dataset[Dataset$Age]

#Dataset$Age <- apply(,sappply(Dataset$Age,2,min_max_scaling))

# Split Dataset into Training and Test Set.

library(caTools)


set.seed(123)

split=sample.split(Dataset,SplitRatio = 0.85)

training_set=subset(Dataset,split==TRUE)
testing_set=subset(Dataset,split==FALSE)

NROW(Dataset)

NROW(training_set)
NROW(testing_set)



# The End Paper
