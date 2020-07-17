# 03-1 변하는 수, '변수' 이해하기기

a <- 1
a

b <- 2
b

c <- 3
c

d <- 3.5
d


a+b
a+b+c

4/b
5*b
# C()함수와
# c는 컴바인, 여러개 뜻함
# seq() 함수로 연속된 숫자 널기 가능

var1 <- c(1,2,5,7,8)
var1

var2 <- c(1:5)
var2

var3 <- seq(1,5)
var3

# seq()함수의 by 로 간격 지정
var4 <- seq(1,10,by=2)
var4

var5 <- seq(1,10,by=3)
var5

var1
var2
var1+var2


str1 <- "a"
str1

str2 <- "text"
str2

str3 <- "Hello World!"
str3

# c() 함수로 여러개 문자로 구성된
# 변수도 만들 수 있다.

str4 <- c("a", "b", "c")
str4

str5 <- c("Hello!", "World", "is", "good!")
str5


# 문자 변수는 연산시 에러 메시지 출력. 단어를 붙이거나 자르는 등 문자 데이터 분석을 하려면 문자 처리기능을 가진 함수를 이용해야 한다.
str1+2








# 03-2 마술 상자같은 '함수' 이해하기

# 데이터 분석은 함수로 시작해 함수로 끝난다.


# 숫자를 다루는 함수 이용하기

# 평균구하는 함수 mean()
x <- c(1,2,3)
x
# 함수 적용
mean(x)

# 최대
max(x)
#최소
min(x)


# 문자를 다루는 함수 이용하기
# 문자로 된 변수 다루려면 문자 처리 전용 함수 이용해야 한다.
# 여러 문자를 합쳐 하나로 만드는 pasts()함수.

str5
paste(str5, collapse=",") # 쉼표를 구분자로 str5의 단어들 하나로 합치기기

# 함수의 옵션:파라미터
# 위의 paste() 함수에서 collapse=","는 단어들이 쉼표로 구분되도록 설정하는 기능이였다. collapse는 단어를 구분할 문자를 지정하는 기능을 한다.
paste(str5, collapse=" ")
# 이와 같이 함수의 옵션을 설정하는 명령어를 파라미터(parameter)또는 매개변수라고 한다.



# 함수의 결과물로 새 변수 만들기
x_mean <- mean(x)
x_mean

str5_paste <- paste(str5, collapse=" ")
str5_paste






# page 77 혼자서 해보기
# Q1
# 시험점수 변수병 : score

score <- c(80, 60, 70, 50, 90)
score
# 전체 평균 구하기
avg <- mean(score)
avg




# 함수 꾸러미, 패키지 설치
# 패키지는 한번만 설치하면 되지만, 로드는 매번 해야한다!
# 내장되어 있는것은 내장패키지라 한다.이 경우 기본적으로 내장되있는 것들. 깔아서 쓰는건 외부패키지이다.앞서 사용한 mean(), pastr() 같은 함수들은 R에 기본적으로 내장된 내장함수이다.


# 설치
# install.packages("ggplot2")

# ggplot2 패키지 로드
library(ggplot2) # ggplot 라이브러리 불러 오겠다.



# 여러 문자로 구성된 변수 생성
x <- c("a", "a", "b", "c")
x

# 빈도 막대 그래프 출력
qplot(x)

# mpg로 그래프를 연습해보자!
# mpg는 미 환경 보호국에서 공개한 자료로 1999-2008 사이 미국에서 출시된 자동차 234종의 연비 관련 정보를 담고있다. (1갤런당 몇 마일가나..)
mpg

help()# help는 설명을 해준당
?mpg # help와 같은 명령
help(mpg)


View(mpg) # View 함수를 이용하면 엑셀의 형태로 데이터를 다 보여준다!


qplot(data=mpg, x=hwy)#data에 mpg, x축에 hwy변수 지정(고속도로 연비)으로 그래프 생성성

# 파라미터 바꿔가며 해보자

qplot(data=mpg, x=cty)#x축 cty, cty는 도심 연비이다.

qplot(data=mpg, x=drv, y=hwy)# x축 drv, y축 hwy
qplot(data=mpg, x=drv, y=hwy, geom="line")#선 그래프 형태태
qplot(data=mpg, x=drv, y=hwy, geom="boxplot")# 박스플롯롯
qplot(data=mpg, x=drv, y=hwy, geom="boxplot", colour=drv) # drv별 색 표현 
#본인의 번역 or 번역기(파파고로 help()주석을 변경해보기) , 예제코드 스크립트에 넣어 설행, 실행 결과를 분석하여, 주석으로 or 구글 워드에 작성성;




####20200709숙제

# 1. 본인의 번역 or 번역기(파파고)로 주석부터 변경해 보기
# 2. 예제 코드를 스크립트에 복사해서 붙여넣어서 실행해보기
# 3. 실행 결과를 분석해보기(문법, 역할) 주석 or 구글 워드에 작성
# 
# # Use data from data.frame
# qplot(mpg, wt, data = mtcars)
# qplot(mpg, wt, data = mtcars, colour = cyl)
# qplot(mpg, wt, data = mtcars, size = cyl)
# qplot(mpg, wt, data = mtcars, facets = vs ~ am)
# 
# qplot(1:10, rnorm(10), colour = runif(10))
# qplot(1:10, letters[1:10])
# mod <- lm(mpg ~ wt, data = mtcars)
# qplot(resid(mod), fitted(mod))
# 
# f <- function() {
#   a <- 1:10
#   b <- a ^ 2
#   qplot(a, b)
# }
# f()
# 
# # To set aesthetics, wrap in I()
# qplot(mpg, wt, data = mtcars, colour = I("red"))
# 
# # qplot will attempt to guess what geom you want depending on the input
# # both x and y supplied = scatterplot
# qplot(mpg, wt, data = mtcars)
# # just x supplied = histogram
# qplot(mpg, data = mtcars)
# # just y supplied = scatterplot, with x = seq_along(y)
# qplot(y = mpg, data = mtcars)
# 
# # Use different geoms
# qplot(mpg, wt, data = mtcars, geom = "path")
# qplot(factor(cyl), wt, data = mtcars, geom = c("boxplot", "jitter"))
# qplot(mpg, data = mtcars, geom = "dotplot")



