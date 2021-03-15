#Read data
data<-read.csv("ToyottaCorolla.csv")
#View Data
View(data)
#dimension of data
dim(data)
#show column names
names(data)
#to display first 6 rows
head(data)
#show price (1:10 = Values of First 10)
data[1:10,1]
#view fuel (1:10 = Values of First 10)
data[1:10,4]
#5th row and 10 columns
data[5,1:10]
#view row with different parameters
data[5,c(1:2,4,8:10)]
#View using $
data$Price[1:25]
data$FuelType[1:6]

#find mean and summary
#To find mean of Price
mean(data$Price)
#To View Summary of price
summary(data$Price)
#summary for column
summary(data)

#convert categorical to binary
xtotal <- model.matrix(~ 0 + FuelType + MetColor, data = data)
xtotal <- as.data.frame(xtotal)
head(xtotal)

#Data Partiioning
set.seed(1)
# to train
train.rows <- sample(rownames(data), dim(data)[1]*0.5)
# to Validate
valid.rows <- sample((setdiff(rownames(data),dim(data)[1]*0.3)))
#test 
test.rows <- setdiff(rownames(data), union(train.rows, valid.rows))

#convert row to data
train.data <- data[train.rows, ]
valid.data <- data[valid.rows, ]
test.data <- data[test.rows, ]

View(train.data)
View(valid.data)
View(test.data)

#data visulization
#load library
library(ggplot2)
tcsub <- data[1:50,]
tcsub
#barplot
ggplot(data = tcsub, mapping = aes(x = Price)) + geom_bar()
ggplot(tcsub, aes(x= Price)) + geom_bar()
View(tcsub)

#plot v2
ggplot(data, aes(x = FuelType)) + geom_bar(fill = "blue", color = "black") +
  labs(x = "FuelType", y= "Frequency", title = "Purchases by FuelType")

#corelation between age and price
ggplot(data ,aes(x=Age,y=Price)) + geom_point(color="blue",size=2,alpha=1)

#Color data as per fuel
ggplot(data,aes(x=Age,y=Price,color=FuelType)) + geom_point(size=3)

#bestfit
ggplot(data,aes(x=Age,y=Price,color=FuelType)) + geom_point(size=3) + geom_smooth(method = "lm")

#choose color
ggplot(data,aes(x=Age,y=Price,color=FuelType)) + geom_point(size=3) + geom_smooth(method = "lm") + scale_colour_manual(values = c("red","blue","yellow"))