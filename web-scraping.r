library(rvest)

url<-"https://www.makemytrip.com/hotels/hotels-near-me.htm"
page<-read_html(url)



#extract data from html
makemy_name<-page%>%html_nodes(".wordBreak")%>%html_text()

makemytrip_Rating<-page%>%html_nodes(".font12.blackText.appendLeft3")%>%html_text()


#show scrap data

print(makemy_name)
print(makemytrip_Rating)



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



























