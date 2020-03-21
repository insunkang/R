##ggplot2패키지에서 제공되는 mpg데이터를 분석
####step1. mpg를 dataframe로 변경####
####step2. mpg의 정보를 출력####
# 행 갯수, 열의 갯수, 위에서 10개, 끝에서 10개출력
dfmpg <- as.data.frame(mpg)
dfmpg
head(dfmpg,10)
tail(dfmpg,10)
head(dfmpg[,1:10])
tail(dfmpg[,1:10])
head(dfmpg[,1:10],10)
tail(dfmpg[,1:10],10)
####step3. mpg의 컬럼명을 변경####
# cty => city, hwy => highway
install.packages("dplyr")
library("dplyr")
colmpg <- rename(dfmpg,city=cty,highway=hwy)
colmpg
####step4. 파생변수 생성하기####
#total컬럼을 추가 => cty와 hwy의 합
#avg컬럼을 추가 => cty와 hwy의 평균
dfmpg$ctyhwytl <-  as.numeric(dfmpg$cty+mpg$hwy)
dfmpg$ctyhwyavg <- as.numeric(dfmpg$ctyhwytl/2)
dfmpg
####step5. 요약정보확인####
summary(mpg)
####step6. info컬럼 추가 ####
#total값을 이용해서 평가 - 30이상이면 pass, fail
dfmpg[,"info"] <- ifelse(test = dfmpg$ctyhwytl>=30,
                     yes = "pass",
                     no = "fail")
dfmpg

####step6. grade컬럼 추가 ####
#total값을 이용해서 평가 - 30이상이면 A, 25이상이면 B, 20이상이면 C 나머지 D


dfmpg[,"grad"] <- ifelse(test = dfmpg$ctyhwytl>=30,
                         yes = "A",
                         no = ifelse(test=dfmpg$ctyhwytl>=25,yes = "B",
                                     no=ifelse(test=dfmpg$ctyhwytl,yes = "C",no = "D")))
dfmpg








