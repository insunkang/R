test1 <- data.frame(id=c(1,2,3,4,5),
                    mid_jumsu=c(77,56,99,100,99))
test2 <- data.frame(id=c(1,2,3,4,5),
                    fianl_jumsu = c(77,56,99,100,99))
test1
test2
final_data <- left_join(test1,test2,by="id")
final_data

namedata <- data.frame(class=c(1,2,3,4,5),
                       teacher=c("kim","lee","park","jang","hong"))
str(namedata)

exam_new <- left_join(exam,namedata,by="class")
exam_new

groupA <- data.frame(id=c(1,2,3,4,5),
                    mid_jumsu=c(77,56,99,100,99))
groupB <- data.frame(id=c(6,7,8,9,10),
                    fianl_jumsu = c(77,56,99,100,99))

group_total <- bind_rows(groupA,groupB)
group_total


mpgg <- mpg %>%group_by(class=class) %>% 
          summarise(mean_cty = mean(cty))
mpgg

mpgg <- mpg %>%group_by(class=class) %>% 
      summarise(mean_cty = mean(cty)) %>% 
      arrange(desc(mean_cty))
mpgg


mpgg <- mpg %>%group_by(class=class) %>% 
      summarise(mean_hwy = mean(hwy)) %>% 
      arrange(desc(mean_hwy)) %>% head(3)
mpgg

mpgg <- mpg %>%group_by(manufacturer) %>%  
              filter(class=="compact") %>% 
                  summarise(calss="compact",count = n()) %>% 
                  arrange(desc(count))
mpgg







