load(file = "crawl_data.RData")
library(stringr)
library(dplyr)
final_data
final_data[,3]

url_list <-  final_data[,3]
class(url_list)
contentdata <- readLines(url_list[1],encoding = "UTF-8")
class(contentdata)
start = which(str_detect(contentdata,"post_content"))
end = which(str_detect(contentdata,"post_ccls"))

start
end
content_filter_data <- contentdata[start:end]
content_filter_data
#데이터 정제하기
#1. 벡터로 리턴하므로 한 개로 합치기
content_filter_data <- paste(content_filter_data,collapse = "")
content_filter_data
#2. 불필요한 기호나 태그 없애기
#태그 없애기
content_filter_data <- gsub("<.*?>","",content_filter_data)
content_filter_data
content_filter_data <- gsub("\t|&nbsp;","",content_filter_data)
content_filter_data



url_data2 <-  final_data[3,3]
myurl <- url_data2
myurl
url_data <-  readLines(myurl,encoding = "UTF-8")
url_data
filter_data <- str_extract(url_data,"(?<=<p>).*(?=</p>)")
filter_data

mysource <- na.omit(filter_data)
mysource
write.csv(mysource,"test.csv")
