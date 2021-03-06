# getwd() # 작업 경로 확인
# 작업경로 설정 setwd('드라이브:/경로/경로')


# 08 그래프 만들기 ====
# 데이터를 그래프로 표현하면 데이터의 특징을 쉽게 이해할 수 있다.


# 08-1 R로 만들 수 있는 그래프 살펴보기====

# 데이터를 보기 쉽게 그림으로 표현한 것을 그래프(Graph)라고 한다.
# 데이터 원자료나 통계표는 수많은 숫자와 문자로 구성되어 있어서 의미를 파악하기 어렵고, 이를 그래프로 표현하면 추세와 경향성이 드러나기에 특싱을 쉽게 이해할 수 맀다.
# 그래프를 만드는 과정에서 새로운 패턴을 발견하기도 한다. 특히 분석 결과를 발표해야 한다면 한 눈에 파악할 수있는 그래프를 만드는 것이 좋다. 
# R 그래프의 종류
# 데이터 분석가들이 R을 선호하는 이유중 하나는 우수한 그래프 기능이다. R에넌 2차원 그래프뿐이 아니라 3차원 그래프, 지도 그래프, 네트워크 그래프, 시간에 따라 변화하는 모션 차트, 마우스 소작에 반응하는 인터랙티브 그래프 등 그래프를 만들 수 있는 다양한 패키지가 있다.


# 쉽게 그래프를 만들 수 있는 ggplot2 패키지
# ggplot2 는 그래프를 만들 때 가장 많이 사용하는 패키지로, 쉽고 짧은 문법으로 아름다운 그래프를 만들 수 있다. 산점도, 막대 그래프, 선그래프, 상자그림을 만들어 보자,
#
#
#
# 08-2 산점도 - 변수 간 관계 표현하기====
# 데이터를  x축과 y축에 점으로 표현한 그래프를 산점도(scatter Plot)라고 한다. 산점도는 나이와 소득처럼 연속 값으로 된ㄷ 두 변수의 관계를 표현할 때 사용된다.
#ggplot2 레이어 구조

#ggplot2 문법은 레이어(layor) 구조로 되어있다. 배경을 만들고, 그 위에 그래프 형태 그리고, 마지막으로 색, 표식 등 설정을 추가하는 순서로 그래프를 만든다.
#1단계: 배경설정(축)
#2단계: 그래프 추가(점, 막대, 선)
#3단계: 설정 추가( 축 범위, 색, 표식)
#


# 산점도 만들기 ====
# 레이어 구조의 순서에 따라 산점도를 만들어보자.
# 먼저저ggplot() 함수와 mpg 데이터를 이용하기 위해, ggplot2패키지를 로드하자
library(ggplot2)
# mpg DATA는 ggplot2 패키지에 포함되어 있다. 따라서 ggplot2패키지를 로드하면 mpg 데이터를 사용할 수 있다.


# 1. 배경 설정하기
# 우선 그래프를 그릴 배경을 만들자. 
# data 에 그래프를 그리는 데 사용할 데이터를 지정하고, aes는 x축과y축에 사용할 변수를 지정하면 배경이 만들어진다.
# 이 코드는 mpg데이터의 displ(배기량) 변수를 x축에, hwy(고속도로 연비) 변수를 y축에 놓고 배경을 만드는 기능을 한다.
#x축은displ, y축은 hwy로 지정해 배경 생성
ggplot(data = mpg, aes(x = displ, y = hwy))



# 2. 그래프 추가하기

# 배경을 만들었으니 그 위에 그래프를 그리자
# +기호를 이용해 그래프 유형을 지정하는 함수를 추가하자.
# 여기서는 산점도를 그리는 함수 geom_point()를 추가하겠다.
# dplyt 패키지 함수들은 %>% 기호로 연결하지만 ggplot2패키지 함수들은 +기호로 연결한다.

# 배경에 산점도 추가
ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point()
# 점들이 각각의 관측치를 의미한다. 각 점이 하나의 자동차 모델, 전반적으로 배기량이 큰 자동차일수록 고속도로 연비가 낮은 경향이 있다는 것을 알 수 있다.  


#
#
# 3. 축 범위를 조정하는 설정 추가하기
# +기호를 이용해 그래프 설정을 변경하는 코드 추가가 가능하다.
# 축 범위를 설정하자면, 축은 기본적으로 최솟값에서 최댓값까지 모든 범위의 데이터가 표현되도록 설정되어 있다.
# 데이터 전체가 아닌 일부만 표현하고 싶을 때 축의 범위를 설정한다.
# 축 범위는 xlim()과 ylin()을 이용해 지정한다.
# 먼저 xlim()을 이용해 x축을 지정하자. 축이 시작되는 값과 끝나는 값을 쉼표로 나열하면 된다. 3~6 까지만 표현되도록 해보자
#축 범위 3~6으로 지정
ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point() + xlim(3, 6)
# Removed 109 rows containing missing values (geom_point). 라는 경고 메세지는 축을 변경했기에 105개 행이 그래프에 표현되지 않았음을 의미한다.


# 마찬가지로 ylim() 으로 y축 범위를 지정해보자
# x축범위 3~6, y축 범위 10~30으로 지정
ggplot(data = mpg, aes(x = displ, y = hwy)) +#데이터축
  geom_point() + #그래프 종류
  xlim(3, 6) + #세부설정
  ylim(10, 30)
  


#ggplot2 코드 가독성 높이기
# dplyr 패키지의 %>% 뒤에서 줄바꿈 한것과 마찬가지로, ggplot2 패키지에서도 +기호 뒤에서 줄을 바꾸면 가독성 있는 코드 작성이 가능.

# 그래프를 이미지 파일로 저장하기
# 플롯 창 메뉴의 Export 버튼을 클릭하면 그래프를 이미지로 저장할 수 있다. image로도, pdf로도 저장이 가능. copy to clipboard 는 메모리에 저장하는 것으로, 엑셀 PPT등 다른 프로그램에서 붙여넣기 하면 그래프가 삽입된다.



#ggplot2 vs qplot()
# 7장까지는 qplot를 사용했다. qplot는 기능이 많지 않지만, 문법이 간단해서 주로 전처리 단계에서 데이터를 빠르게 확인해보는 용도로 사용한다. 최종적으로 분석 결과를 보고하기 위해 그래프를 만들 때는 ggplot()를 사용한다. ggplot()를 사용하면 다양한 그래프를 만들 수 있고, 색, 크기, 폰트 등 세부 요소들을 자유롭게 조절할 수 있다.

# p366 혼자서 해보기 ==== 
# mpg 데이터와 mid west 데이터를 이용해 분석 문제를 해결해 보세요
# Q1. mpg데이터의 cty(도시 연비) 와 hwy(고속도로 연비) 간에 어떤 관계가 있는지 알아보려 한다. x축은 cty, y축은 hwy로 된 산점도를 만들어 보자
#geom_point()를 이용해 산점도를 만들어보자

ggplot(data = mpg, aes(x = cty, y = hwy)) +
  geom_point()




# Q2. 미국 지역별 인구통계 정보를 담은 ggplot2 패키지의midwest 데이터를 이용, 전체인구와 아시아인 인구 간에 어떤 관계가 있는지 알아보려 한다. x축은 poptotal(전체 인구), y축은 popasian(아시아인 인구)으로 된 산점도를 만들어 보세요. 전체 인구는 50만 명 이하, 아시아인 인구는 1만 명 이하인 지역만 산점도에 표시되게 설정하세요
# xlim()과 ylim()을 이용해 조건에 맞게 축을 설정하면 된다.



ggplot(data = midwest, aes(x = poptotal, y = popasian))+
  geom_point() +
  xlim(0, 500000) + 
  ylim(0, 10000)













# 08-3 막대 그래프 - 집단 간 차이 표현하기====
# 막대 그래프(Bar Chart)는 데이터의 크기를 막대의 길이로 표현한 그래프로, 성별 소득 차이처럼 집단 간 차이를 표현할 때 주로 사용된다.




# 평균 막대 그래프 만들기 ====
# 가장 많이 사용되는 막대 그래프는 각 집단의 평균값을 막대 길이로 표현한 평균 막대 그래프이다. mpg데이터를 이용해 drv(구동발식) 별 평균 hwy(고속도로 연비) 막대 그래프를 만들어보자
# 1. 집단별 평균표 만들기
# 평균 막대 그래프를 만들려면 집단별 평균표로 구성된 데이터 프레임이 필요하다.
# dplyr 패키지를 이용해 구동 방식별 평균 고속도로 연비로 구성된 데이터 프레임을 만들자.
library(dplyr)
mpg <- ggplot2::mpg
df_mpg <- mpg %>% 
  group_by(drv) %>% 
  summarise(mean_hwy = mean(hwy))
df_mpg


# 2. 그래프 생성하기
# 앞에서 만든 데이터 프레임을 이용해 막대그래프를 만들자. aex 의 x축에 범주를 나타내는 변수를 지정하고, y축에 평균값을 나타내는 변수를 지정한다 +기호로 연결해 막대 그래프를 만드는 함수 geom_col()를 추가한다.
ggplot(data = df_mpg, aes(x = drv, y = mean_hwy)) +
  geom_col()
# 3. 크기 순으로 정렬하기
# 막대는 기본적으로 범주의 알파벳 순서로 정렬된다.
# 앞에서 출력한 그래프를 보면 drv 막대가 4, f, r순으로 정렬되어 있는데, reorder() 를 사용하면 막대를 값의 크기 순으로 정렬할 수 있다.
# reorder()에 x축 변수와 정렬 기준으로 삼을 변수를 지정하면 된다. 정렬기준 변수 앞에 - 기호를 붙이면 내림차순으로 정렬한다.
# 변수의 값이 숫자와 문자로 함께 구성되면 숫자 오름차순, 알파벳 오름차순으로 정렬된다.

ggplot(data = df_mpg, aes(x = reorder(drv, -mean_hwy,), y = mean_hwy)) + # 내림차순 정렬
  geom_col()

ggplot(data = df_mpg, aes(x = reorder(drv, mean_hwy,), y = mean_hwy)) + # 오름름차순 정렬
  geom_col()


# 빈도 막대 그래프 만들기 ====
# 빈도 막대 그래프는 값의 개수(빈도) 로 막대의 길이를 표현한 그래프로, 빈도 막대 그래프를 만들려면 y축 없이 x축만 지정하고, geom_col() 대신 geom_bar()를 사용하면 됩니다.

ggplot(data = mpg, aes(x = drv)) +
  geom_bar()
# x축에 연속 변수를 지정하면 값의 분포를 파악할 수 있습니다.
ggplot(data = mpg, aes(x = hwy)) +
  geom_bar()

# geom_col() VS geom_bar()
# 평균 막대 그래프는 데이터를 요약한 평균표를 먼저 만든 후 이 평균표를 이용해 만듭니다. 반면 빈도 막대 그래프는 별도로 표를 만들지 않고 원자료를 이용해 바로 만듭니다. 
# 요약표를 이용하는지, 원자료를 이용하는지에 따라 그래프를 만드는 절차와 함수가 다름에 유의!
# 요약표는 geom_col(), 원자료는 geom_bar 를 사용해 막대 그래프를 만든다.



# p193 혼자서 해보기====
# mpg 데이터를 이용해 분석 문제를 해결해 보자
# Q1 어떤 회사에서 생산한 suv 차종의 도시 연비가 높은지 알아보려 한다. suv 차종을 대상으로 평균 cty( 도시 연비) 가 가장 높은 회사 다섯 곳을 막대 그래프로 표현해 보자. 막대는 연비가 높은 순으로 정렬해야 한다.
# 우선 그래프로 나타낼 집단별 평균표를 만들어야 한다. 
# filter()로 suv 차종만 추출 후 group_by()와 summarise()로 회사별 평균을 구하고
# arrange()와 head() 로 상위 5행을 추출하면 된다.
# 이렇게 만든 표를 geom_col()을 이용해 막대 그래프로 표현하자.
# reorder를 이용해 정렬 기준이 되는 평균 연비 변수 앞에 - 기호를 붙이면 연비가 높은 순으로 막대 정렬이 가능.

suv_top_5 <- mpg %>% filter(class == "suv") %>% 
  group_by(manufacturer) %>% 
  summarise(mean_cty = mean(cty)) %>% 
  arrange(desc(mean_cty)) %>% 
  head(5)



ggplot(data = suv_top_5, aes(x = reorder(manufacturer, -mean_cty), y = mean_cty)) +
  geom_col()

# Q2 자동차 중에서 어떤 class(자동차 종류)가 가장 많은지 알아보려 한다. 자동차 종류별 빈도를 표현한 막대 그래프를 만들어 봐라.
# 빈도막대 그래프는 요약표를 만드는 절차 없이 원자료를 이용해 만들므로 geom_col()대신 geom_bar()를 사용하면 된다.

ggplot(data = mpg, aes(x = class)) + 
  geom_bar()




# 08-4 선 그래프- 시간에 따라 달라지는 데이터 표현하기 ====
# 데이터를 선으로 표현한 그래프를 선 그래프 (Line Chart) 라고 한다. 시간에 따라 달라지는 데이터를 표현할 때는 주로 선 그래프를 이용하며, 예를 들자면 환율, 주가지수 등 경제 지표가 시간에 따라 어떻게 변하는지를 선 그래프로 표현할 수 있다.
# 일별 환율처럼, 일정 시간 간격을 두고 나열된 데이터를 시계열 데이터(Time Seried Data)라고 하고 시계열 데이터를 선으로 표현한 그래프를 시계열 그래프(Time Series Chart)라고 한다.

# 시계열 그래프 만들기 ====
# ggplot2 패키지에 들어있는 economics 데이터를 이용해 시계열 그래프를 만들어보자
# economice는 미국의 경제 지표들을 월별로 나타낸 데이터로, 이 데이터를 이용해서 시간에 따라 실업자 수가 어떻게 변하는지 나타낸 시계열 그래프를 만들자.
# x축에는 시간을 의미하는 date, y 축에는 실업자 수를 의미하는 unemploy를 지정하고, 선 그래프로 표현하기 위해 geom_line을 추가한다.
ggplot(data = economics, aes(x = date, y = unemploy)) +
  geom_line()
# 출력된 그래프를 보면, 실업자 수가 약 5년 주기로 등락을 반복하고, 2005년 이후 급격히 증가했다가 2010년 이후 다시 감소하는 추세라는 것을 알 수 있다.
# p195 혼자서 해보기 ====
# economice 데이터를 이용해 분석 문제를 해결해 보자
# Q1 psavert(개인 저축률)가 시간에 따라 어떻게 변해 왔는지 알아보려 한다. 시간에 따른 개인 저축률의 변화를 나타낸 시계열 그래프를 만들어보자.
ggplot(data = economics, aes(x = date, y = psavert)) +
  geom_line()
#
#

economics
View(economics)

?economics













# 08-5 상자 그림 - 집단 간 분포 차이 표현하기====
# 상자 그림(Box Plot)은 데이터의 분포(퍼져 있는 평태) 를 직사각형 상자 모양으로 표현한 그래프로, 상자 그림을 보면 분포를 알 수 있기 때문에 평균만 볼 때보다 데이터으ㅣ특성을 좀 더 자세히 이해할 수 있다. 
# 상자 그림 만들기 ====
# mpg 데이터의drv(구동 방식)별 hwy(고속도로 연비) 를 상자 그림으로 표현해보자. x축을 drv, y축을hwy로 지정한 후 상자 그림으로 표현하도록 geom_boxplot()를 추가하자
ggplot(data = mpg, aes(x = drv, y = hwy)) +
  geom_boxplot()
# 상자 그림은 값을 크기 순으로 나열해 4등분 했을 때 위치하는 값인 사분위수를 이용해 그려진다.

# 상자 아래 세로선 : 아랫수염 : 하위 0~25%에 해당하는 값
# 상자 밑면 :1사분위수(Q1) : 하위 25%위치 값
# 상자 내 굵은 선 : 2사분위수(Q2): 하위 50%위치 값(중앙값)
# 상자 윗변 : 3사분위수(Q2) : 하위 75%위치값
# 상자 위 세로선 : 윗수염 : 하위 75~100% 내에 해당하는 값
# 상자 밖 점 표식 : 극단치 : Q1, Q3 밖 1.5IQR을 벗어난 값
# 1.5IQR은 사분위 범위(Q1~Q3 간 거리)의 1.5배를 의미한다.
#
# 출력된 그래프를 보면, 각 구동 방식의 고속도로 연비 분포를 알 수 있다.
# 4륜구동은 17-22 사이에 대부분의 자동차가 모여있다. 중앙값이 상자 밑면에 가까운 것을 보면 낮은 값 쪽으로 치우친 형태의 분포임을 알 수 있다
# 전륜구동(f)는 26-29 사이의 좁은 범위에 자동차가 모여 있는 뾰족한 형태의 분초임을 알 수 있다. 수염의 위, 아래에 점 표식이 있는 것을 보면 연비가 극단적으로 높거나 낮은 자동차들이 존재함을 알 수 있다.
# 후륜구동(r) 은 17~24 사이의 넓은 범위에 자동차가 분포하고 있는 것을 알 수 있다. 수염이 짧고 극단치가 없는 것을 보면 대부분의 자동차가 사분위 범위에 해당함을 알 수 있다. (상자그림 상세는 174p)








# ggplot2 더 알아보기 ====
# 차트 시트
#
#
#ggplot2로 만든 다양한 그래프와 코드들
#
#
#
# 확장 패키지들


#
#
# p198 혼자서 해보기 ====
# mpg 데이터를 이용해 분석 문제를 해결해 보자
# Q1. class(자동차 종류)가 compact, subcompact, suv인 자동차의 cty(도시연비) 가 어떻게 다른지 비교해보려 한다. 세 차종의cty를 나타낸 상자 그림을 만들어보자
# 우선filter()을 이용해 비교할 세 차종을 추출해야 한다. 추출한 데이터를 이용해 geom_boxplot()으로 상자 그림을 만들자.
mpg_class <- mpg %>% filter(class == "compact" | class == "subcompact" | class == "suv")
mpg_class
ggplot(data = mpg_class, aes(x = class, y = cty)) +
  geom_boxplot()


# 정리하기 ====

# 값, 내용
# geom_point()   : 산점도
# geom_col()     : 막대 그래프 - 요약표
# geom_bar()     : 막대 그래프 - 원자료
# geom_line()    : 선 그래프
# geom_boxplot() : 상자 그림

# 1. 산점도
ggplot(data = mpg, aes(x = displ, y = hwy)) +
  geom_point()
# 축 설정 추가

ggplot(data = mpg, aes(x = displ, y = hwy)) +
  geom_point() +
  xlim(3, 6) + 
  ylim(10, 30)



# 2. 평균 막대 그래프
# 2-1 평균표 만들기
df_mpg <- mpg %>% 
  group_by(drv) %>% 
  summarise(mean_hwy = mean(hwy))
# 2-2 그래프 생성하기, 크기순 정렬하기
ggplor(data = df_mpg, aes(x= reorder(drv, -mean_hwy), y = mean_hwy)) +
  geom_col()



# 3. 빈도 막대 그래프
ggplot(data = mpg, aes(x = drv)) +
  geom_bar()


# 4. 선 그래프
ggplot(data = economics, aex(x = date, y = unemploy)) +
  geom_line()

# 5. 상자 그림
ggplot(data = mpg, aes(x = drv, y = hwy)) + geom_boxplot()