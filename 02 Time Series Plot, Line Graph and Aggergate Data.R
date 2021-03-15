#timeplot
#load
ship <- read.csv("ApplianceShipments.csv",header = TRUE)
#to view
View(ship)
#summary
summary(ship)

#create timeseries 
shipment_ts=ts(ship$Shipments,start = c(1985,1),end = c(1989,4),frequency = 4)
plot(shipment_ts,xlab="Year",ylab="shipment",lwd=2,type="b",col="red")
text(x=shipment_ts,labels = shipment_ts,pos = 3, cex = 1)
summary(shipment_ts)

#draw 4 line graph
par(oma = c(0,0,0,2))
xrange <- c(1,5)
yrange <- range(shipment_ts)
plot(xrange,yrange,main="Shipment by Quarter",xlab="Year",ylab="Shipments",type="n",bty ="l")
colors<-rainbow(4)
linetype <- c(1:4)
plotchar <-c(1:4)
for (i in 1:4){
  #lines(data,type,lwd,lty,col,pch)
  current_quarter<-subset(shipment_ts,cycle(shipment_ts)==i)
  lines(current_quarter,type="b",lwd=3,lty=linetype[i],col=colors[i],pch=plotchar[i])
}
legend(4.5,4900,1:4,cex = 1,2,col = colors,pch=plotchar,lty = linetype,title = "Quarter")


#aggregate data 
yearly <- aggregate(shipment_ts,FUN = sum)
View(yearly)
plot(yearly,type="b",bty="l",lwd=2,col="green")
text(x=yearly,labels = yearly, pos = 1, cex = 0.8)

