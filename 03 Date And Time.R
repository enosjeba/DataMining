#exercise1
#Convert vector to dates
#input vector
datesvector<-c("2010-05-01","2004-03-15")
#convert
Ex1Dts<-as.Date(datesvector)
Ex1Dts
#check class
class(Ex1Dts)

#exercise2
#Convert vector to dates
#input vector
datesvector2<-c("07/19/98")
#convert
Ex2Dts<-as.Date(datesvector2, format = '%m/%d/%y')
Ex2Dts
#check class
class(Ex2Dts)

#exercise3
#input vector
datesvector3<-c("02/07/10","02/23/10","02/08/10","02/14/10","02/10/10")
#convert
Ex3Dts<-as.Date(datesvector2, format = '%m/%d/%y')
Ex3Dts
#check class
class(Ex3Dts)

#exercise4
mean(Ex3Dts)

#exercise5
max(Ex3Dts)

#exercise6
"28th feb 2020 and 3rd march 2020"
year1<-as.Date("28 Feb 2020",format="%d %b %Y")
year2<-as.Date("3 March 2020", format="%d %B %Y")
year1-year2

#exercise7
date_today = format(Sys.Date(),"%B %d %Y" )
date_today

#Exercise8
stime<-Sys.time()
stime
gtime<-as.POSIXct("2021-01-09 14:58:12",tz="GMT")
gtime

