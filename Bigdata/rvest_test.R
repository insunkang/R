#css의 선택자를 활용할 수 있는 방법 = rvest
install.packages("rvest")
library(rvest)
url <- "https://www.clien.net/service/group/community?&od=T31&po=0"
readPage <- read_html(url)

#html_nodes(선택자) : 일치하는 모든 태그를 추출
#html_node(선택자) : 일치하는 태그 한개
#html_text() : 텍스트를 추출
#html_name() : attribute의 이름 추출
#html_children() : 하위 노드 추출
#html_name() : 하위노드의 이름 추출
#html_attr() : attribute의 추출


readPage %>% 
  html_nodes("span.subject_fixed") -> title_data
title_data


url <- "https://www.clien.net/service/group/community?&od=T31&po=0"
readPage <- read_html(url)