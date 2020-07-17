# 05-1 데이터 파악하기

exam <- read.csv("csv_exam.csv")

getwd() # 워킹 디렉터리 파악
exam


head(exam)
tail(exam)

head(exam, 10)

View(exam)

dim(exam)
str(exam) # 속성 파악악
summary(exam)

library(ggplot2)
help(mpg)
View(mpg)


head(mpg)
tail(mpg)
dim(mpg)
summary(mpg)




#05-2 변수명 바꾸기


#p110 우선 실습에 활용 위해 2개의 변수로 구성된 DF 생성

df_raw <- data.frame(var1 = c(1,2,1),
                     var2 = c(2,3,2))

df_raw

# rename() 을 이용하기 위해 dplyr 패키지 설치후 로드드
install.packages("dplyr") #패키지 설치
library(dplyr) # 패키지 로드



# 데이터프레임 복사본 만들기

df_new <- df_raw # 복사본 생성
df_new
df_new <- rename(df_new, v2 = var2)# var2를 v2로 수정정

df_raw
df_new


# 혼자서해보기 112p
mpg <- as.data.frame(ggplot2::mpg)
mpg
new_mpg <- mpg
head(mpg)
new_mpg <- rename(new_mpg, city = cty)
new_mpg <- rename(new_mpg, highway = hwy)
head(new_mpg)


# mpg
# cty : 도시연비
# hwy : 고속도로 연비
# 히해하기 쉬운 단어 : rename() =>library(dplyr)선행
# rename()









# 05-3 파생변수 만들기
# 변수를 조합하거나 함수를 적용해 새 변수를 만들수도 있다. 

df <- data.frame(var1 = c(4,3,8),
                 var2 = c(2,6,1))
df


# $를 붙여 새로 만들 변수명 입역

df$var_sum <- df$var1 + df$var2
df

# mean파생변수도 만들자

df$var_mean <- (df$var1 + df$var2)/2
df


mpg$total <- (mpg$cty + mpg$hwy)/2
head(mpg)
summary(mpg$total)
hist(mpg$total)

# 합격 판정 변수 만들기

ifelse(mpg$total >=20, "pass", "fail")
# 조건, 조건맞을때, 안맞을때

mpg$test <- ifelse(mpg$total >= 20, "pass", "fail")
head(mpg)



# 막대 그래프로 빈도 표현

library(ggplot2)
qplot(mpg$test)


# 중첩 조선물 활용

# 30이상 A, 29~29B, 20미만 C로 조건문 작성성

mpg$grade = ifelse(mpg$total >= 30, "A",
       ifelse(mpg$total >= 20, "B",
              "C"))
head(mpg, 20)

# 등급빈도표표
table(mpg$grade)
# 등급빈도 막대그래프
qplot(mpg$grade)


mpg$grade2 <- ifelse(mpg$total >= 30, "A",
                     ifelse(mpg$total >= 25, "B",
                            ifelse(mpg$total >= 20, "c", "D")))



head(mpg, 20)



# p123 분석도전! ggplot2 패키지의 미국 동북중부 437개 지역의 인구통계정보 담은 midwest 를 이용해 DATA분석해ㅔ보자


# 문제1 ggplot 의 midwest 데이터를 DF형태로 불러온 뒤 데이터의 특징을 파악해보자

library(ggplot2)
midwest <- as.data.frame(ggplot2::midwest) # 데이터 프레임 형식으로 불러옴
head(midwest) # 앞6개 데이터 추출(열머릿글) 
tail(midwest) # 뒤 6개 데이터 추출 (행갯수)
View(midwest) # v는 대문자, 행, 열의 엑셀 구조로 볼 수 있다.
dim(midwest) # dimension (차원 -> 1차원(벡터), 2차원(텐서))
str(midwest) # 1행: 데이터 타입, obs(행), variable(열)
             # 2행: $(열 이름) $열이름:데이터타입, 실제 데이터
summary(midwest) # 요약, character열/int, num 열 에 따라조금 달라지고
                 # character 열 : 행 갯수
                 # int,num열 : 행갯수, 최소, 최대, 평균, 중앙, 25%값, 75%값 => boxplot과 연계

help(midwest) # midwest의 정보 불러옴옴

# 문제2 poptotal 변수를 total로, popasian변수를 asian으로 수정하자
library(dplyr) # 패키지 로드
midwest <- rename(midwest, total = poptotal)
midwest <- rename(midwest, asian = popasian)
# rename의 문법구조는 rename(변수명, 바꿀 열이름 = 기존 열이름름)
# rename() 함수는 dplyr 패키지 안에 있는 함수.


head(midwest)


# 문제3 total, asian 변수를 이용해 전체 인구 대비 아시아 인구 백분율 파생변수 만들고 히스토그램 만들어 도시들이 어떻게 분포하는지 살펴보자
midwest$perasian <- (midwest$asian/midwest$total)*100

midwest$perasian

hist(midwest$perasian) # 히스토그램 : hise(), hist(변수명명)






# 문제4 아시아 인구 백분율 전체 평균을 구하고, 평균 초과시 large, 그외 small을 부여하는 파생변수를 만들어 보자
mean(midwest$perasian) # 전체 평균은 mean()으로 구한다.

ifelse(midwest$perasian > 0.4872462, 'large', 'small') 
# 부여하는 파생변수 = 위의 결괏값을 저장하는 파생변수 만들어라.
midwest$group <- ifelse(midwest$perasian > 0.4872462, 'large', 'small') 
head(midwest, 2)


# 문제5  large와 small 에 해당하는 지역이 얼마나 되는지 빈도표와 빈도 막대 그래프를 만들어 확인해 보세요.
# 얼마나 되는지 : table() , table(변수명$열이름)
# 빈도 막대 그래프 : qplot(), qplot(변수명$열이름)

table(midwest$group)
qplot(midwest$group)
