####모두의 광장의 1페이지 : 10페이지의 모든 게시글 크롤링######
#1. 모든 페이지의 title, hit,url, content 추출
#2. crawl_result.csv, crawl_result.RData저장
#3. mongodb저장 (300개 저장)
#4. for, if문을 활용

install.packages("mongolite")
library("stringr")
library("mongolite")


#mongodb에 저장하기 위해서는 크롤링 해야한다.
con <- mongo(collection = "crawl",
             db = "bigdata",
             url = "mongodb://127.0.0.1")

#0번부터 9번 페이지까지 반복 작업
final_data_list=NULL
for (i in 0:9) {
  myurl <- paste0("https://www.clien.net/service/group/community?&od=T31&po=",i)
  url_data <-  readLines(myurl,encoding = "UTF-8")
  ####title추출####
  final_filter_data <- url_data[str_detect(url_data,"subject_fixed")]
  title <- 　str_extract(final_filter_data,"(?<=\">).*(?=</span>)")
  ####hit추출####
  hit_data <- url_data[str_detect(url_data,"<span class=\"hit\">")]
  hit <- str_extract(hit_data,"(?<=\">).*(?=</span>)")[-1]
  hit
  ####url추출####
  myurl <- url_data[((which(str_detect(url_data,"subject_fixed")))-3)]
  myurl
  url_val <- str_extract(myurl,"(?<=href=\").*(?=data-role)")
  url_val <- str_sub(url_val,end = -3)
  url_val <- paste0("https://www.clien.net/",url_val)
  url_val
  ############################url을 이용해서 content 항목 추출 ###############
  contentlist=NULL #최초 변수 선언시 null로 초기화
      for(page in 1:length(url_val)){
        
        contentdata <- readLines(url_val[page],encoding = "UTF-8")
        contentdata
        
        start = which(str_detect(contentdata,"post_content"))
        start
        end = which(str_detect(contentdata,"post_ccls"))
        end
        content_filter_data <- contentdata[start:end]
        content_filter_data <- paste(content_filter_data,collapse = "")
        content_filter_data <- gsub("<.*?>","",content_filter_data)
        content_filter_data <- gsub("\t|&nbsp;","",content_filter_data)
        
        #기존에 저장되어 있는 contentlist의 내용에 추가
        contentlist <- c(contentlist,content_filter_data)
        cat("\n",page)
      }
    
      final_data <- cbind(title,hit,url_val,contentlist)
      final_data_list <- rbind(final_data_list,final_data)
      cat("\n",i)
  
  
  }



####csv파일로 생성####


write.csv(final_data,"crawl_data.csv")
save(final_data,file="crawl_data.RData")

#############mongodb에 저장하기####
if (con$count()>0) {
  con$drop()
}

final_mongo_data <- data.frame(final_data_list)

con$insert(final_mongo_data)





