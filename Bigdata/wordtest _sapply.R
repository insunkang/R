####모두의 광장의 1페이지 : 10페이지의 모든 게시글 크롤링######
#1. 모든 페이지의 title, hit,url, content 추출
#2. crawl_result.csv, crawl_result.RData저장
#3. mongodb저장 (300개 저장)
#4. for, if문을 활용
url <- "https://www.clien.net/service/group/community?&od=T31&po="

a <- matrix(0:9,ncol = 1)
a



for (i in c(0:10)) {
 eachurl[i] <- url
}
test <- cbind(eachurl,a)
test
testset <- rbind(test[1,1],test[1,2])

for (i in c(0:10)) {
  testset <- r
}

testset1 <- paste(testset,collapse = "")
testset1
