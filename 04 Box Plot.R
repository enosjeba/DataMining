#Boxplot
Ls<-read.csv("LaptopSalesJanuary2008.csv", header = TRUE)
View(Ls)

library(ggplot2)
ggplot(Ls)+geom_bar(aes(Store.Postcode,Retail.Price),stat="summary",fun="mean",fill="grey",color="black")
agg_data<-aggregate(data=Ls,Retail.Price~Store.Postcode,mean)
agg_data[order(agg_data$Retail.Price),]

#Part B
ggplot(Ls)+ geom_boxplot(aes(Store.Postcode,Retail.Price))
x<-subset(Ls,Store.Postcode %in% c("W4 3PH","N17 6QA"))
x
ggplot(x)+ geom_boxplot(aes(Store.Postcode,Retail.Price))