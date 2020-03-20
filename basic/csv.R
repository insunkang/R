#csv는 기본 패키지로 사용 가능
#csv를 읽기
mdf <-  read.csv("csv_exam.csv")
mdf
mdf[,2]
#dataframe에서 조건에 만족하는 데이터를 조회
m <- matrix(1:20,ncol = 4)
m
d <- data.frame(m)
d
myresult <- d[d$X3>=13,]
myresult
#조건에 만족하는 데이터를 result.csv파일로 저장
write.csv(myresult,file="result.csv")
mdf
sc <- data.frame(mdf)
sc
exam <- sc[sc$science>=80,]
exam
myavg <- c(mean(exam),"null",mean(exam$math),mean(exam$english),mean(exam$science))
myavg
mytotal <- c("null","null",sum(exam$math),sum(exam$english),sum(exam$science))
mytotal
exam$mytotal <- sum (exam$math,exam$english,exam$science) 
exam

dfdf <-  sum( c[exam$math,exam$english,exam$science] )
mytotal <- c(sum(exam[1,3:5]),sum(exam[2,3:5]),sum(exam[3,3:5]),sum(exam[4,3:5]))



myavg <-  c(mean(as.integer(exam[1,3:5])),mean(as.integer(exam[2,3:5])),mean(as.integer(exam[3,3:5])),mean(as.integer(exam[4,3:5])))


exam$mytotal <- mytotal
exam$myavg <- myavg
exam
exam <- cbind(exam,c(1,11,111,1111))


write.csv(exam,file="csv_exam_result.csv")
