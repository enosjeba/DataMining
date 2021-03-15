#naivebayes classifier

#Step 1 - Installing Packages
install.packages("e1071")#for naivebayes function
install.packages("caTools")#split
install.packages("caret")#for confusion matrix

#Step 2 - Loading Packages
library(e1071)
library(caTools)
library(caret) #requies package lattice and ggplot2

iris.df<-read.csv("Iris.csv")

#Step 3 - Splitting Data into train and test data
#Step 3.1
split<-sample.split(iris,SplitRatio = 0.7)
split #view (in boolean)
#Step 3.2 #Training Data
train_cl<-subset(iris,split == "TRUE")
#step 3.3 #Test Data
test_cl<-subset(iris,split == "FALSE")

#Step 4 - Normalization
#To normalize also known as scaling
#feature scaling
train_scale<-scale(train_cl[,1:4]) #only first 4 column contains numeric values
test_scale<-scale(test_cl[,1:4])

#Step 5
#naive bayes Training
NBC<-naiveBayes(Species ~.,data = train_cl)#~. for just the species
NBC

#Step 6
#Predict 
pred <- predict(NBC, newdata = test_cl) 
pred

#Step 7
#building confusion matrix
#CONFUSION MATRIX
cm<-table(test_cl$Species,pred)
confusionMatrix(cm)