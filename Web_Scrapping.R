library(trims)
library(rvest)
url<-"https://priceoye.pk/mobiles/samsung"
page<-read_html(url)

#extract data from html
mobile_name<-page%>%html_nodes(".p-title.bold.h5")%>%html_text()
mobile_price<-page%>%html_nodes(".price-box.p1")%>%html_text()

#show scrap data
print(mobile_price)
print(mobile_name)

#data cleaning
clean_mobile_name<-trimws(mobile_name)
clean_mobile_price<-trimws(mobile_price)
print(clean_mobile_name)
print(clean_mobile_price)
#create Dataframe
samsungData<-data.frame(clean_mobile_name,clean_mobile_price)
samsungData
View(samsungData)


library(tidyverse)

ggplot(samsungData,aes(x=clean_mobile_name,y=clean_mobile_price))+geom_col()+theme(axis.text.x = element_text(angle=90,hjust=0.5))








