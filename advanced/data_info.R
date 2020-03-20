exam <- read.csv("csv_exam.csv")
exam

#전체 레코드의 맨 위에서 부터 정의한 갯수만큼 가져오기
head(exam,n=5)
tail(exam,5) #아래쪽부터 가져오기

#실제 뷰어로 보기
View(exam)
#행의 갯수
nrow(exam)
#컬럼의 갯수
ncol(exam)
#행과 열의 갯수
dim(exam)
#타입확인
class(exam)
#구조확인
str(exam)

summary(exam)
exam


#컬럼의 이름을 변경 dplyr
install.packages("dplyr")
library("dplyr")
#rename(data, 변경할 컬러명 = 기존 컬럼명)
exam <- rename(exam, eng=english)
exam
library(ggplot2)
table(exam$eng)
qplot(exam$eng)

midwest
dfmw <- as.data.frame(midwest)
dfmw
dfmw <- rename(dfmw,total=poptotal)
dfmw <- rename(dfmw,asian=popasian)
dfmw
dfmw[,"asto"] <- as.numeric(dfmw$asian/dfmw$total)
dfmw
hist( dfmw$asto )
