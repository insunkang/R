install.packages("N2H4")
library(N2H4)
library(stringr)
library(dplyr)
url <- "https://www.clien.net/service/group/community?&od=T31&po=0"

getAllComment(url) %>% 
  select(userName, contents) ->mydata
mydata
class(mydata)
mycomment <- mydata$userName
mycomment
