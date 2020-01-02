library(dplyr)
library(plyr)
library(ggplot2)

adopt_107 <- fileset$`107.csv`[5][[1]]
adopt_106 <- fileset$`106.csv`[5][[1]]
adopt_105 <- fileset$`105.csv`[5][[1]]
adopt_104 <- fileset$`104.csv`[5][[1]]
adopt_103 <- fileset$`103.csv`[5][[1]]
death_107 <- fileset$`107.csv`[6][[1]]
death_106 <- fileset$`106.csv`[6][[1]]
death_105 <- fileset$`105.csv`[6][[1]]
death_104 <- fileset$`104.csv`[6][[1]]
death_103 <- fileset$`103.csv`[6][[1]]

adopt_total <- c(adopt_103[23], adopt_104[23], adopt_105[23], adopt_106[23], adopt_107[23])
death_total <-c(death_103[23], death_104[23], death_105[23], death_106[23], death_107[23])

df <- data.frame(year = c(103, 104, 105, 106, 107),
                 adopt_total, death_total)

fileset$`107.csv` <- fileset$`107.csv`[-23,]

ggplot(data = df) + 
  geom_line(aes(year, adopt_total, group = 1, colour = "認養死亡率`")) +
  geom_line(aes(year, death_total, group = 1, colour = '所內死亡率')) +
  labs(x = "年", y = "percentage")

ggplot(data = fileset$`107.csv`) + 
  geom_bar(mapping = aes(x = reorder(縣市別, -animals_per_person), y = animals_per_person),
           stat = "identity") +
  labs(x = "縣市別", y = "照顧動物數/人")

ggplot(data = fileset$`107.csv`) + 
  geom_bar(mapping = aes(x = reorder(縣市別, -在養佔可留容比例), y = 在養佔可留容比例),
           stat = "identity") +
  labs(x = "縣市別", y = "在養佔可留容比例")

ggplot(data = fileset$`107.csv`) + 
  geom_bar(mapping = aes(x = reorder(縣市別, -total), y = total),
           stat = "identity") +
  labs(x = "縣市別", y = "在養數")

ggplot(data = fileset$`107.csv`) + 
  geom_bar(mapping = aes(x = reorder(縣市別, -`reliability(%)`), y = `reliability(%)`),
           stat = "identity") +
  labs(x = "縣市別", y = "可靠度")

ggplot(data = fileset$`107.csv`) + 
  geom_line(aes(縣市別, `adopt_threat(%)`, group = 1, colour = "認養死亡率`")) +
  geom_line(aes(縣市別, `death_threat(%)`, group = 1, colour = '所內死亡率')) +
  labs(x = "縣市別", y = "percentage")