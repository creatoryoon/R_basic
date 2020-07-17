# 데이터 프레임 만들기 p85

english <- c(90, 80, 60, 70)
math <- c(50, 60, 100, 20)
class <- c(1, 1, 2, 2)

df_midterm <- data.frame(english, math, class)
df_midterm
# 리스트 여러개 만들고 데이터 프레임으로 변환

# 4. 분석하기
mean(df_midterm$english)
# $는 열을 선택하기 위한 것
mean(df_midterm$math)

# 데이터 프레임 한번에 만들기
df_midterm <- data.frame(english = c(90,80,60,70),
                         math = c(50, 60, 100, 20), 
                         class=c(1, 1, 2, 2))
df_midterm
# 옵션에 코드- 소프트 랩 코드 체크 기능 잘 사용할것


#p88 문제 혼자서 해보기
# c(): combine,결합하다. c(값1, 값2, ) 값 여러개를 가질 수 있음(예: 파이썬 리스트)
# q1. data.frame(변수1=값 여러개, 변수2 = 값 여러개); data.frame(변수1, 변수2, ...(단, 이 경우 변수가 미리 만들어져있어야..)) 
# frame : 행, 열 엑셀 데이터 형태로 만듬
# 전체 변수명 : df_fruit
# 열 머리글 변수명: product



df_fruit <- data.frame(product= c("Apple", "StrawBerry", "WaterMelon"),
                       price = c(1800, 1500, 3000), 
                       saleVolume = c(24, 38, 13))
df_fruit


# 과일 가격 평균, 판매량 평균?
mean(df_fruit$price)
mean(df_fruit$saleVolume)
# 평균은 mean(데이터프레임 $ 컬럼명)으로 쓴다.
# 인덱스 없애려면(행 인덱스를 제품으로 지정하려면)
# install.packages("tidyverse")
library(tidyverse)
df_fruit %>% column_to_rownames(., var = "product")
df_fruit





# 04-3 외부 데이터 이용하기_축적된 시험 성적 데이터를 불러오자!

# 엑셀 파일 불러오기. 

# 엑셀 페키지 설치 
# install.packages("readxl")
# 엑셀 패키지 로드
library(readxl)

# 엑셀 파일 불러오기: read_excel() 을 이용
# 이것은 엑셀 파일을 데이터 프레임으로 만드는 기능을 한다.

df_exam <- read_excel("excel_exam.xlsx")
# 엑셀 파일 불러와 df_exam에 할당
df_exam
# 출력

# 프로젝트 폴더가 아닌경우 파일 경로 지정
df_exam <-read_excel("D:/YDS/0_R/DoitR/Doit_R_master/Data/excel_exam.xlsx")
df_exam


# 불러왔으니 이제 분석을 해보자
# mean()을 이용, 영어 점수와 과학 점수의 전체 평균을 구하자

mean(df_exam$english)
mean(df_exam$science)



# 엑셀 파일 첫 번째 행이 변수명이 아니고 데이터라면?
# read_excel()은 기본적으로 엑셀 파일의 첫 번째 행을 변수명으로 인식해 불러온다. 변수명 없이 첫 번째 행부터 바로 데이터인 경우 첫 번째 행의 DATA가 변수명으로 지정되면서 유실된다.
df_exam_novar <- read_excel("D:/YDS/0_R/DoitR/Doit_R_master/Data/excel_exam_novar.xlsx")
df_exam_novar
# 살펴보면 원본과 달리 7행까지만 존제
# 이럴 때 col_names = F 파라미터 설정하면 첫 번째 행을 변수명이 아닌 DATA로 인식해서 불러오고, 변수명은 X__숫자로 자동 지정, F는 대문자임에 유의

df_exam_novar <- read_excel("D:/YDS/0_R/DoitR/Doit_R_master/Data/excel_exam_novar.xlsx", col_names=F)
df_exam_novar
# 이 경우 열 이름을 가져올 것인가라는 질문에 F로 대답한것)


# 엑셀 파일에 시트가 여러개 있다면?
# 시트 번호 또는 시트네임으로 가져올 수 있다.

# 엑셀 파일의 세 번째 시트에 있는 데이터 불러오기
df_exam_sheet <- read_excel("D:/YDS/0_R/DoitR/Doit_R_master/Data/excel_exam_sheet.xlsx", sheet = 3)
df_exam_sheet



# csv 파일 불러오기. 첫번째 행은 header=F 파라미터를 이용해서 인덱스로 지정여부를 설정한다. read_excel()의 col_names와 read.csv()의 header은 동일한 기능을 가지고 있는 파라미터이다.
df_csv_exam <- read.csv("D:/YDS/0_R/DoitR/Doit_R_master/Data/csv_exam.csv")
df_csv_exam



# 문자가 들어있는 파일을 불러올 때는 stringsAsFactors = F()로 불러와야 factor타입이 아닌 문자 타입으로 불러오기에 오류가 발생하지 않는다.

df_csv_exam <- read.csv("D:/YDS/0_R/DoitR/Doit_R_master/Data/csv_exam.csv", stringsAsFactors = F)
df_csv_exam




# 데이터 프레임을 CSV 파일로 저장하기

# 먼저 CSV파일로 저장할 데이터 프레임 만들고, write.csv() 로 저장하자

df_midterm <- data.frame(english = c(90, 80, 60, 70), math = c(50, 60, 100, 20), class = c(1, 1, 2, 2))
df_midterm
# 내장함수인 write.csv()로 저장, 괄호안에 저장할 데이터프레임명 지정, file파라미터에 파일명 지정하면 된다.

write.csv(df_midterm, file = "df_midterm.csv")



# RData (.rda or .rdata)는 R전용 DATA 파일이다. R 전용이기에 다른 파일에 비해 R에서 읽고 쓰는 속도가 빠르고 용량이 작다는 장점이 있다. 일반적으로 R에서 분석작업을 할 때는 RData 파일 사용하고, R을 사용하지 않는 사람과 파일 주고받을때는 csv파일을 이용한다.

# save()를 이용해 DF를 rda파일로 저장한다.
# write.csv()와 마찬가지로 괄호 안에 DF명과 저장할 파일명을 지정한다.

save(df_midterm, file = "df_midterm.rda")

#RData 파일 불러오기.
# rda 파일 불러올땐 load()이용한다.
# rm을 사용하면 데이터 삭제가 가능하다.
# df_midterm부터 삭제해보자
# 삭제후에는 해당데이터 호출시 오류 발생 확인 가능
rm(df_midterm)
df_midterm

# 이제 앞에서 저장한 df_midterm.rda 파일을 load()를 이용해 불러오자. 괄호 안에 불러올 바일명 지정.

load("df_midterm.rda")
df_midterm




# read.csv()나 read_excel은 파일을 불러와 새 변수에 할당해야 활용 가능.
# 반면 load()로 rda 파일을 불러오면 저장할 때 사용한 데이터 프레임이 자동으로 만들어지기 때문에 새 변수에 할당하지 않는다.


# 엑셀 파일 불러와 df_exam에 할당

df_exam <- read_excel("D:/YDS/0_R/DoitR/Doit_R_master/Data/excel_exam.xlsx")
df_exam

# csv 파일 불러와 df_csv_exam에 할당
df_csv_exam <- read.csv("D:/YDS/0_R/DoitR/Doit_R_master/Data/csv_exam.csv")
df_csv_exam

# Rda 파일 불러오기
load("df_midterm.rda")
df_midterm



# 4장 정리

# 2. 외부 데이터 이용하기
# 엑셀 파일
library(readxl)# readxl패키지 로드
df_exam <- read_excel("D:/YDS/0_R/DoitR/Doit_R_master/Data/excel_exam.xlsx")# 엑셀 파일 불러오기

#csv 파일
df_csv_exam <- read.csv("D:/YDS/0_R/DoitR/Doit_R_master/Data/csv_exam.csv")# CSV파일 불러오기
write.csv(df_midterm, file="df_midterm.csv")
# CSV 파일로 저장하기

# Rda 파일
load("df_midterm.rda") # Rda 파일불러오기
save(df_midterm, file="df_midterm.rda") #Rda 파일로 저장하기.