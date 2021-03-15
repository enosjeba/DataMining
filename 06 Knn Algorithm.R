#knn algorithm

#step1 - Loading package
library(caTools) #for sample.split()
library(class) #for knn function
library(caret) #for Confusion Matrix()

#step 2 - Split data
split <-sample.split(iris,SplitRatio = 0.7)
#step 2.1
train_cl<-subset(iris,split = "TRUE")
#step 2.2
test_cl<-subset(iris,split = "FALSE")
length(test_cl)
#Step 2.3
train_scale<-scale(train_cl[,1:4])
#Step 2.4
test_scale<-scale(test_cl[,1:4])

#Step 3 - Knn
#Step 3.1 (knn = 1) 
knn_1<-knn(train = train_scale,
           test = test_scale,
           cl = train_cl$Species,
           k = 1)
knn_1
length(knn_1)

#Step 3.2 (knn = 7)
knn_7<-knn(train = train_scale,
           test = test_scale,
           cl = train_cl$Species,
           k = 7)
knn_7
length(knn_7)

#Step 3.3 (knn = 15)
knn_15<-knn(train = train_scale,
            test = test_scale,
            cl = train_cl$Species,
            k = 15)
knn_15

#Step 3.4 (knn = 19)
knn_19<-knn(train = train_scale,
            test = test_scale,
            cl = train_cl$Species,
            k = 19)
knn_19

#Step 4 - confusion matrix
#Step 4.1 (knn = 1)
cm<-table(test_cl$Species,knn_1)
confusionMatrix(cm)

#Step 4.2 (knn = 7)
cm<-table(test_cl$Species,knn_7)
confusionMatrix(cm)

#Step 4.3 (knn = 15)
cm3<-table(test_cl$Species,knn_15)
cm3

#Step 4.4 (Knn = 19)
cm4<-table(test_cl$Species, knn_19)
cm4

#Step 5 - Checking Accuracy
#Step 5.1 (Accuracy = 1)
Error1<-mean(knn_1 != test_cl$Species)
print(paste('Accuracy =', 1-Error1))

#Step 5.2 (Accuracy = 7)
Error2<-mean(knn_7 != test_cl$Species)
print(paste('Accuracy =', 1-Error2))

#Step 5.3 (Accuracy = 15)
Error3<-mean(knn_15 != test_cl$Species)
print(paste('Accuracy =', 1-Error3))

#Step 5.4 (Accuracy = 17)
Error4<-mean(knn_19 != test_cl$Species)
print(paste('Accuracy =', 1-Error4))
