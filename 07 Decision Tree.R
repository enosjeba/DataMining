library(datasets)
library(caTools)
library(party)
library(dplyr)
library(magrittr)

#Load iris data
iris<- read.csv("Iris.csv", stringsAsFactors = TRUE)

# Splitting dataset into train and test data
sample_data = sample.split(iris$species, SplitRatio = 0.8) 
train_data <- subset(iris, sample_data == TRUE) 
test_data <- subset(iris, sample_data == FALSE) 

#Create the decision tree model using ctree and plot the model; ctree(formula, data)
#formula describes the predictor and response variables and data is the data set used. 
#In this case species is the response variable 
#and the other predictor variables are represented by .,
model<- ctree(species ~ ., train_data)
plot(model)

# testing the species
predict_model<-predict(model, test_data) 

# creates a table to count how many are classified
m_at <- table(test_data$species, predict_model)
m_at

#Determining the accuracy of the model developed
ac_Test <- sum(diag(m_at)) / sum(m_at)
print(paste('Accuracy for test is found to be', ac_Test))