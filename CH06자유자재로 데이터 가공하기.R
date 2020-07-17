
# 06 자유자재로 데이터 가공하기
# 06-1 데이터 전처리 - 원하는 형태로 데이터 가공하기====

# 06-2 조건에 맞는 데이터만 추출하기====

library(dplyr)
exam <- read.csv("csv_exam.csv")
# D:/YDS/0_R/DoitR/Doit_R_master/Data/csv_exam.csv
exam

# exam 에서 class가 1인 경우만 추출해 출력

exam %>% filter(class ==1)
# dplyr 패키지의 filter을 이용해 추출
# dplyr 패키지는 %>%기호를 이용해 함수들을 나열하는 방식으로 코드를 작성한다. 위 코드는 exam을 출력하되 class가 1인 행만 추출하라는 조건이지정되어있다.
# filter()안의 class ==1 은 class변수의 값이 1인 행을 의미한다
# %>%의 단축키는 ctrl+shift+m이다.



# 2반인 경우에 추출
exam %>% filter(class == 2)


# 특정 값이 "아닌 경우" 추출 등호 앞에 !를 붙인다

exam %>% filter(class != 1) # 1반이 아닌 경우

exam %>% filter(class != 3) # 3반이 아닌 경우






# 초과, 미만, 이상, 이하 조건 걸기

exam %>% filter(math>50) # 수학점수 50점 초과한 놈만


exam %>% filter(math < 50) # 수학점수 50 미만인 놈

exam %>% filter(english >= 80) # 영어 점수 80점 이상.

exam %>% filter(english <= 80) # 영어 점수 80점 이하.





# 여러 조건을 충족하는 행 추출하기.
# and 또는 & 이용한다.


# 1반이면서 수학 점수가 50점 이상인 경우
exam %>% filter(class == 1 & math >= 50)


# 2반이면서 영어 점수가 80점 이상이ㄴ경우
exam %>% filter(class == 2 & english >= 80)




# 여러 조건 중 하나 이상 충족하는 행 추출하기
# or 또는 |이용한다 |는 shift+\ 누르면 입력됨

# 수학 점수가 90점 이상이거나 영어 점수가 90점 이상인 경우.
exam %>% filter(math >=90 | english >= 90)


# 영어 점수가 90점 미만이거나 과학 점수가 50점 미만인 경우
exam %>% filter(english <90 | science < 50)





# 목록에 해당하는 행 추출하기
# 변수의 값이 지정한 목록에 해당될 경우만 추출해야 할 경우가 있음, 예를 들어 1,3,5반에 속한 학생의 DATA만 추출하는 상황. 이럴 경우 앞에서 다룬 |기호를 이용, 여러 조건을 나열하면 됨.

# 1,3,5반에 해당하면 추출
exam %>% filter(class == 1 | class == 3 | class ==5)






# %in%기호를 사용하면 코드를 더 간편히 작성 가능하다. %in%기호와 c()함수를 이용해 조건 목록을 입력하면 된다. %in% 기호는 변수의 값이 지정한 조건 목록에 해당하는지 확인하는 기능을 한다.
# %in% 기호는 매치 연산자라고 읽는다.
# %in% 기호는 단축키 따로 없으므로 %>% 입력후 가운데만 in으로 바꾸장 

exam %>% filter(class %in% c(1,3,5))# 1,3,5반에 해당하면 추출





# 추출한 행으로 데이터 만들기

class1 <- exam %>% filter(class ==1)# class가 1인 행 추출, class1에 해당
class2 <- exam %>% filter(class == 2) # class가 2인 행 추출, class2에 해당

mean(class1$math) # 1반 수학 점수 평균 구하기
mean(class2$math) # 2반 수학 점수 평균 구하기



# R에서 사용하는 기호들 : 133p====
# 논리 연산자
# < 작다.
# <= 작거나 같다
# > 크다
# >= 크거나 같다
# == 같다
# != 같지 않다
# | 또는
# & 그리고
# %in% 매칭 확인
# 산술 연산자
# + 더하기
# - 빼기
# * 곱하기
# / 나누기
# *, ** 제곱
# %/% 나눗셈의 몫
# %% 나눗셈의 나머지

# 혼자서 해보기 : 133p ====



# Q1 자동차 배기량에 따라 고속도로 연비가 다른지 알아보려 한다. displ(배기량)이 4 이하인 자동차와 5이상인 자동차 중 어떤 자동차의 hwy(고속도로 연비)가 평균적으로 더 높은지 알아보자. 특정 조건에 해당하는 데이터를 추출해 평균을 구하면 해결할 수 있다. filter()을 이용해서 displ변수가 특정 값을 지닌 행을 추출해 새로운 변수에 할당 후 평균을 구해보자.
mpg = as.data.frame(ggplot::mpg)# mpg 데이터 불러오기
mpg
displun4 <- mpg %>% filter(displ <= 4) # 4이상 뽑기
displup5 <- mpg %>% filter(displ >= 5) # 5이상 뽑기

# 각각 평균구해보기
mean(displun4$hwy) # 4 이하가 더 높다.
mean(displup5$hwy)




# Q2 자동차 제조 회사에 따라 도시 연비가 다른지 알아보자 audi와 toyota 중 어느 manufacturer(자동차 제조사) 의 cty(도시연비) 가 평균적으로 더 높은지 알아보자. Q1과 동일한 절차로 진행하면 된지만, 변수의 값이 숫자가 아닌 문자라는 점이 다르다.

audi <- mpg %>% filter(manufacturer == 'audi') # audi 뽑기
# 변수명 %>%  filter(열이름, 조건)
toyota <- mpg %>% filter(manufacturer == 'toyota') # toyota 뽑기

# 각각 평균 구하기

mean(audi$cty)
mean(toyota$cty) # 토요타가 더 높다
# mean(변수명$열이름)


# Q3 chevrolet, ford, honda 자동차의 고속도로 연비 평균을 아라보려 한다. 이 회사들의 DATA를 추출 후 HWY 전체 평균을 구해보자. 여러조건 중 하나 이상 충족하면 추출하도록 filter() 함수를 구성해서 추출한 데이터로 평균을 구하면 될것이다. %in% 을 이용하면 코드를 짧게 만들 수 있을 것이다.

mpg %>% filter(manufacturer %in% c('chevrolet', 'ford', 'honda') )
# 변수명 %>% filter(열이름 %in% c(들어갈 조건1, 조건2, ...))

hwygroup <- mpg %>% filter(manufacturer %in% c('chevrolet', 'ford', 'honda')) # 회사 맞는거 뽑아다가 변수에 저장
mean(hwygroup$hwy) # 평균 구하기




# 06-3 필요한 변수만 추출하기.====
# select() 는 일부 변수만 추출할 때사용
# filter()와 마찬가지 방식으로 데이터 프레임명을 입력 후 %>% 로 select()를 연결한다.

exam %>% select(math)
exam %>% select(english)

exam %>% select(class, math, english)
# 여러 변수 동시 추출도 가능
exam %>% select(-math)
# 특정 변수 제거도 가능

# 변수 추출하기

# 여러 변수 추출하기

# 변수 제외하기




# dplyr 함수 조합하기
# dplyr 함수는 %>% 을 이용해 조합해서 사용이 가능하다.
exam %>% 
  filter(class == 1 ) %>% #class가 1인 행 추출후
  select(english)#english 추출출
# %>% 뒤에서 줄바꿈 하면 자동으로 들여쓰기가 되어,어디까지 dplyt 코드 단락인지 한눈에 파악 가능하다.

exam %>% 
  select(id, math) %>%  # id, math 추출
  head  # 앞부분 6행까지 추출출


exam %>% 
  select(id, math) %>% # id, math 추출
  head(10) # 앞부분 10행까지 추출



# 138p 혼자서 해보기====
# Q1 mpg 데이터는 11개 변수로 구성되어있다.
# 이중 일부만 추출하자
# class, cty 만 추출해 새로운 data 추출후 확인
# mpg$cty, mpg$class 도 가능하지만 select사용하자.
mpg <- as.data.frame(ggplot2::mpg)
mpg2 <- mpg %>% select(class, cty,)
head(mpg2)

# Q2 자동차 종류에 따라 도시 연비가 다른지 알아보기 위해.
# 앞에서 추출한 데이터를 이용, class가 suv인 자동차와
# compact 인 자동차 중 어떤 자동차의 cty가 더 높은지 알아보세요

suv = mpg2 %>% filter(class == 'suv')
compact = mpg2 %>% filter(class == 'compact')
mean(suv$cty)
mean(compact$cty)
# 비교 결과 suv가 상대적으로 연비가 낮다.

# 06-4 순서대로 정렬하기====

# arrange()를 이용하면 데이터를 원하는 순서로 정렬할 수 있다. 
# arrange()에 정렬 기준으로 삼을 변수명을 입력하면 된다.


exam %>% arrange(math) # math 오름차순 정렬

exam %>% arrange(desc(math))# math 내림차순 정렬

exam %>% arrange(class, math)# 정렬 변수 여러개 지정


# 혼자서해보기 141p====
# audi 에서 생산한 자동차 중 hwy 가 1~5위에 해당하는 것만 출력
audi <- mpg %>% filter(manufacturer == 'audi')
audi <- audi %>% arrange(hwy)
head(audi, 5)





# 06-5 파생변수 추가하기====


# mutate() 를 사용하면 기존 데이터에 파생변수를 만들어 추가 가능 mutate()에 새로만들 변수명과 변수를 만들때 사용할 공식을 입력하면 된다.
exam %>% 
  mutate(total = math + english + science) %>%  # 총합변수 추가
  head # 일부 추출출



# 여러 파생변수 한번에 추가, 쉼표를 이용해, 새 변수와 공식 나열

exam %>% 
  mutate(total = math + english + science,#총합변수추가
         mean = (math + english + science)/3) %>% #총평균변수추가
  head#일부추출출


# mutate() 에 ifelse() 적용하기
# mutate() 에 ifelse를 적용하면 조건에 따라 다른 값을 부여한 변수를 추가할 수 있다.
exam %>% 
  mutate(test = ifelse(science >=60, 'pass', 'fail')) %>%
  head



# 자릿수 만들기!!!
exam_mutate <- exam %>% 
  mutate(total = math + english + science,
         mean = round(((math + english + science)/3), digits = 3))
head(exam_mutate)



# 추가한 변수를 dplyr 코드에 바로 활용도 가능하다.

exam %>% 
  mutate(total = math + english + science) %>% 
  arrange(total) %>% #총합 기준 정렬
  head



# 144p 혼자서 해보기====
mpg2 <- mpg %>% 
  mutate(total = cty + hwy)# 합산 연비 변수 추가
head(mpg2)

#Q2
mpg2 <- mpg2 %>% 
  mutate(avg = total / 2)
head(mpg2)
#Q3
mpg2 <- mpg2 %>% arrange(avg)
head(mpg2, 5)


#Q4
mpg %>% mutate(total = cty + hwy,
               avg = (cty + hwy)/2) %>% 
  arrange(avg) %>% 
  head(5)



# 06-6 집단별로 요약하기====

# 집단별 평균이나 집단별 빈도처럼 각 집단을 요약한 값을 구할 떄는 group_by()와 summarise()를 사용한다.



exam %>% summarise(mean_math = mean(math))# math 평균 산출
# 집단별로 요약하기 
# group_by()에 변수를 지정하면 변수 항목별로 데이터를 분리합니다. 
# 여기에 summarise() 조합하면 집단별 요약 통계량을 산출한다.

exam %>% 
  group_by(class) %>% #class별로 분리
  summarise(mean_math = mean(math))#math 평균 산출출



# 여러 요약 통계량 한번에 산출하기
exam %>% 
  group_by(class) %>% 
  summarise(mean_math = mean(math),# 평균
            sum_math = sum(math),# 합계
            median_math = median(math), # math 중앙값
            n = n())# 학생 수, 데이터가 몇 행인지 빈도를 구하는 역할을 한다. 몇 행인지... 반별로 4명이 있다는 것을 알 수 있다.

# summarise() 에 등장하는 요약 통계량 함수
# mean() 평균
# sd() 표준편차
# sum() 합계
# median() 중앙값
# min() 최솟값
# man() 최댓값
# n() 빈도






# 각 집단별로 다시 집단 나누기

# group_by() 에 여러 변수 지정시 집단 나눈 후 다시 하위 집단으로 나눌 수 있다.

mpg %>% 
  group_by(manufacturer, drv) %>% #회시별, 구동 방식별 분리
  summarise(mean_cty = mean(cty)) %>% #cty 평균 산출
  head(10) # 일부 출력력


# dplyr 조합하기

# 회사별로 "suv" 자동차의 도시 및 고속도로 통합 연비 평균을 구해 내림차순 정렬, 1~5위까지 출력하기


# 절차를 생각하자
# 1. 회사별로 분리 group_by()
# 2. suv 추출 filter()
# 3. 통합 연비 변수 생성 mutate()
# 4. 평균 summarise()
# 5. 내림차순 arrange
# 6. 1-5위까지 출력 head()

mpg %>% 
  group_by(manufacturer) %>% # 회사별 분이
  filter(class == "suv") %>% #suv 추출
  mutate(tot = (cty + hwy)/2) %>% #통합연비 변수 생성
  summarise(mean_tot = mean(tot)) %>% #통합연비 평균 산출
  arrange(desc(mean_tot)) %>% # 내림차순
  head(5)# 1~5위





# page150 혼자서 해보기====
# 선행 작업

mpg <- as.data.frame(ggplot2::mpg)

# Q1 mpg 데이터의 class는 suv, compact 등 자동차를특징에 따라 일곱 종류로 분루한것, 어떤 차종이 연비가 높을지 class 별 cty 평균구해보자

#먼저 group_by 로 class별로 나눈 뒤 summearise()로 cty 평균 구하자

mpg %>% 
  group_by(class) %>% # clas
  summarise(mean(cty))


# Q2 앞 문제의 출력 결과는 class별 알파벳 순이다. 평균이 높은 순으로 정렬해 출력하자.
mpg %>% 
  group_by(class) %>% # class별 분류
  summarise(mean_cty = mean(cty)) %>% # 평균 산출후 저장
  arrange(desc(mean_cty))# 내림찻순

# Q3 어떤 회사 자동차의  hwy가 가장 높은지 평균이 높은 회사 세 곳 출력하라
mpg %>% 
  group_by(manufacturer) %>% #회사별 묶고
  summarise(mean_hwy = mean(hwy)) %>% # 평균 구하고
  arrange(desc(mean_hwy)) %>% # 그걸로 내림차순 정렬
  head(3)# 3개 출력

# Q4 어떤 회사에서 compact 차종을 가장 많이 생산하는지 알아보자
# 각 회사별 compact 차종 수를 내림차순으로 정렬해 출력하자

mpg %>% 
  group_by(manufacturer) %>% # 회사별 묶고
  filter(class == 'compact') %>% #compact만 추출하고
  summarise(n = n()) %>% # summarise로 요약통계량을 놓되, 빈도 구해서
  arrange(desc(n))# 그걸로 정렬



# 다만 이 경우 filter을 먼저 해야한다.
# 많아질 경우 필터링을 먼저 하는 것이
# 모든 데이터 대상으로 그루핑하는 것보다 연산 효율이 좋기 때문
mpg %>% 
  filter(class == 'compact') %>% #compact만 추출하고
  group_by(manufacturer) %>% # 회사별 묶고
  summarise(n = n()) %>% # summarise로 요약통계량을 놓되, 빈도 구해서
  arrange(desc(n))# 그걸로 정렬




# 06-7 데이터 합치기====
# 여러 데이터를 합쳐 하나의 데이터로 만든 후 분석해보자.
# 가로로 합치기는 기존 데이터에 변수(열) 추가
# 세로로 합치기는 기존 데이터에 행 추가


# 가로로 합치기, 학생 다섯명이 중간, 기말 봤다고 생각해보고 2개의 DF만들자
# 중간고사 데이터 생성
test1 <- data.frame(id = c(1, 2, 3, 4, 5),
                    midterm = c(60, 80, 70, 90, 85))

# 기말고사 데이터 생성
test2 <- data.frame(id = c(1, 2, 3, 4, 5),
                    final = c(70, 83, 65, 95, 80))
test1
test2

# dplyr 패키지의 left_join()을 이용하면 데이터를 가로로 합칠 수 있다.
# 괄호 한에 합칠 DF명 나열, 기준으로 삼을 변수를 by에 저장한다.
# by에 기준 변수를 지정시 변수명에는 따옴표를 붙여야 한다.

total <- left_join(test1, test2, by="id")# id를 기준으로 합쳐 total에 할당당
total


# 다른 데이터를 활용해 변수 추가하기
# left_join을 응용해 특정 변수의 값을 기준으로 다은 데이터 값 추가해보자. 

# 각 반 학생들의 시험 점수를 담은 exam 데이터 분석중 추가로 반별 담임교사 명단 얻었다. 먼저 명단 ㄱㄱ

exam = read.csv("D:/YDS/0_R/DoitR/csv_exam.csv")
# exam 읽어오자 먼저..
name <- data.frame(class = c(1, 2, 3, 4, 5),
                   teacher = c("kim", "lee", "park", "choi", "jung"))
name
# class 변수를 기준으로 exam에 추가하자
exam_new <- left_join(exam, name, by = 'class')
exam_new



# 세로로 합치기
# 학생 다섯 명이 시험보고 나중에 다섯 명이 따로 봤다 가정하고 2개의 DF 만들자
# 학생1~5번 시험 데이터 생성 
group_a <- data.frame(id = c(1, 2, 3, 4, 5),
                      test = c(60, 80, 70, 90, 85))
# 학생 6-10번 시허 ㅁ데이터 생성
group_b <- data.frame(id = c(6, 7, 8, 9, 10),
                      test = c(70, 83, 65, 95, 80))
group_a
group_b



#bins_rows()를 이용하면 데이터를 세로로 합칠 수 있다.
# 괄호 안에 합칠 DF명을 나열하면 된다.
group_all <- bind_rows(group_a, group_b)#DATA 합쳐서 group_all 에 할당
group_all
# 데이터를 세로로 합칠 때는 두 데이터의 변수명이 같아야 한다.
# 만약 변수명이 다르면 rename()을 이용해 동일하게 맞춘 후에 합치면 된다.





# 156p 혼자서 해보기====
# mpg 데이터의 f1 변수는 자동차에 사용하는 연료를 말한다.
# 우선 연료와 가격으로 구성된 데이터 프레임을 만들어보자
# stringAsFactor = F 는 문자를 factor 타입으로 변환하지 않도록 설정하는 파라미터다. 
# data.frame()은 변수에 문자가 들어있으면 factor 타입으로 변환하도록 기본 설정되어있다. fuel 데이터의 문자변수 f1을 mpg 데이터와 동일하게 문자타입(chr)으로 만들어야 분석 작업에서 오류가 발생하지 않기에 이 파라미터를 설정한 것.
mpg = as.data.frame(ggplot2::mpg)
fuel <- data.frame(fl = c("c", "d", "e", "p", "r"),
                   price_f1 = c(2.35, 2.38, 2.11, 2.76, 2.22),
                   stringsAsFactors = F)
fuel

head(mpg)
# Q1 mpg 데이터에 연료 가격을 추가해보자
# left_join을 이용하면 될 것

mpg_with_price <- left_join(mpg, fuel, by = 'fl')
head(mpg_with_price)

# Q2 연료 가격 변수가 잘 추가됬나 확인 위해 model, fl, pricefl 변수 추출해 앞부분 5행 출력해보자
# select()와 head() 조합한다.
mpg_with_price %>% 
  select(model, fl, price_f1) %>% 
  head(5)

# =====================정리하기======================

# 데이터 먼저 준비====
#dplyr 패키지 함수 요약해보자

# 라이브러리와, DF 불러오고 만들기!
library(dplyr)
mpg = as.data.frame(ggplot2::mpg)
exam = read.csv("D:/YDS/0_R/DoitR/csv_exam.csv")
test1 <- data.frame(id = c(1, 2, 3, 4, 5),
                    midterm = c(60, 80, 70, 90, 85))
test2 <- data.frame(id = c(1, 2, 3, 4, 5),
                    final = c(70, 83, 65, 95, 80))
group_a <- data.frame(id = c(1, 2, 3, 4, 5),
                      test = c(60, 80, 70, 90, 85))
group_b <- data.frame(id = c(6, 7, 8, 9, 10),
                      test = c(70, 83, 65, 95, 80))



# 정리하기====
# 1. 조건에 맞는 데이터만 
exam %>% filter(english >= 80)
# 여러 조건 동시 충족
exam %>% filter(class == 1 & math >=50)
# 여러 조건 중 하나 이상 충족
exam %>% filter(math >= 90 | english >=90)
exam %>% filter(class %in% c(1, 3, 5))


# 2. 필요한 변수만 추출하기
exam %>% select(math)
exam %>% select(class, math, english)


# 3. 함수 조합하기, 일부만 출력학
exam %>% 
  select(id, math) %>% 
  head(10)


# 4. 순서대로 정렬하기
exam %>% arrange(math)# 오름차순
exam %>% arrange(desc(math))# 내림차순
exam %>% arrange(class, math)# 여러 변수 기준 오름차순


# 5. 파생변수 추가
exam %>% mutate(total = math + english + science)
# 여러 파생변수 한번에 추가
exam %>% 
  mutate(total = math + english + science,
         mean = (math + english + science)/3)
# mutate()에 ifelse() 적용
exam %>% mutate(test = ifelse(science >=60, "pass", "fail"))
# 추가한 변수를 dplyr 코드에 바로 활용
exam %>% 
  mutate(total = math + english + science) %>% 
  arrange(total)


# 6. 집단별로 요약
exam %>% 
  group_by(class) %>% 
  summarise(mean_math = mean(math))
# 각 집단별로 다시 집단 나누기
mpg %>% 
  group_by(manufacturer, drv) %>% 
  summarise(mean_cty = mean(cty))


# 7. 데이터 합치기
# 가로로 합치기
total <- left_join(test1, test2, by = "id")
# 세로로 합치기
group_all <- bind_rows(group_a, group_b)








# 분석 도전 과제!====
# 분석도전! 160p

# 미국 동북중부 437개 지역의 인구통계 정보를 담고있는 midwest 데이터로 데이터 분석 문제 해결해보자
# midwest 는 ggplot2 패키지에 있다

midwest <- as.data.frame(ggplot2::midwest)#불러오기



# 문제1 popadult는 해당 지역의 성인 인구, poptotal은 전체 인구를 나타낸다. midwest 데이터에 전체인구 대비 미성년 인구 백분율 변수 추가해라

head(midwest)

midwest %>% mutate(peryouth = (poptotal - popadults)/poptotal*100)


# 문제2 미성견 인구 백분율이 가장 높은 상위 5개 county(지역)의 미성년 인구 백분율을 출력해라

midwest %>% mutate(peryouth = (poptotal - popadults)/poptotal*100) %>% 
  arrange(desc(peryouth)) %>% 
  select(county, peryouth) %>% 
  head(5)



# 문제3 분유표의 기준에 따라 미성년 비율 등급 변수를 추가하고, 각 등급에 몇 개의 지역이 있는지 알아보자. 분류와 기준은 다음과 같다.
# large:40%이상, middle:30~40%미만, small:30%미만


midwest %>% mutate(peryouth = (poptotal - popadults)/poptotal*100,
                              youthrate = ifelse(peryouth >= 40, "large", ifelse(peryouth >= 30, "middle", "small"
                              ))) %>% 
  group_by(youthrate) %>% 
  summarise(n = n())



# 문제 4. popasian은 해당 지역의 아시아인 인구다. 
# 전체 인구 대비 아시아인 인수 백분율 변수를 추가하고 하위 10개 지역의 state(주), county(지역), 아시아인 인구 백불율을 출력하라.


midwest %>% mutate(perasian = popasian/poptotal) %>% 
  arrange(desc(perasian)) %>% 
  tail(10) %>% 
  select(state, county, perasian)
