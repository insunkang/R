#dataframe만들기 - 1. matrix를 dataframe으로 변환
#2. 벡터를 여러개 만들어서 dataframe을 작성
eng <- c(100,99,90)
math <- c(100,99,90)
mydf1 <- data.frame(eng,math)
mydf1
mean(mydf1$eng)
mean(mydf1$math)
#3.dataframe을 직접 정의하는 방법법
mydf2 <- data.frame(eng=c(100,100,100),
                    m =c(90,90,90))
mydf2


#생성이 완료되어 사용중인 matrix, dataframe의행과열을 변경
m <- matrix(1:15,ncol = 3,byrow = T)
m
m <- t(m)

d <- data.frame(m)
d
d <- t(d)
d
asd <- c("사과","딸기","수박")

a <- data.frame("가격"=c(1800,1500,3000),"판매량"=c(24,38,13))
a
? data.frame

rownames(a) <- c("사과","딸기","수박")


a
mean(a[,1])
mean(a[,2])
