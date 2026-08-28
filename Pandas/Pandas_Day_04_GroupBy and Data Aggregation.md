# Pandas Day 04 — GroupBy and Data Aggregation

> **학습 회차:** Day46 | Pandas Day04  
> **주제:** DataFrame 그룹화와 집계

---

## 1. 오늘의 학습 목표

오늘은 광고 데이터를 플랫폼별로 묶어서 성과를 비교하는 방법을 학습했다.

핵심 흐름은 다음과 같다.

```text
광고 데이터
↓
DataFrame 생성
↓
파생 지표 생성
↓
groupby()로 데이터 그룹화
↓
sum() / mean() / agg()로 집계
↓
플랫폼별 성과 비교
```

---

# 2. Notion 학습 내용

## 2-1. `groupby()`의 개념

`groupby()`는 특정 컬럼을 기준으로 데이터를 그룹화할 때 사용하는 Pandas 메서드다.

예를 들어 플랫폼별로 데이터를 묶을 수 있다.

```python
df.groupby("platform")
```

이는 다음과 같이 이해할 수 있다.

```text
platform이 같은 데이터끼리 묶기
```

---

## 2-2. `sum()`을 이용한 그룹별 합계

플랫폼별 총 세션을 구할 수 있다.

```python
df.groupby("platform")["sessions"].sum()
```

의미:

```text
platform 기준으로 그룹화
↓
sessions 컬럼 선택
↓
그룹별 합계 계산
```

---

## 2-3. `key_events` 합계 계산

플랫폼별 주요 이벤트 합계도 같은 방식으로 구할 수 있다.

```python
df.groupby("platform")["key_events"].sum()
```

---

## 2-4. `mean()`을 이용한 평균

플랫폼별 평균 주요 이벤트율을 계산할 수 있다.

```python
df.groupby("platform")["key_event_rate"].mean()
```

`sum()`과 `mean()`의 차이:

```text
sum()
→ 합계

mean()
→ 평균
```

---

## 2-5. `agg()`를 이용한 여러 지표 집계

`agg()`는 Pandas에서 제공하는 실제 메서드이며, `aggregate`의 줄임말이다.

여러 컬럼에 서로 다른 집계 함수를 한 번에 적용할 수 있다.

```python
df.groupby("platform").agg({
    "sessions": "sum",
    "key_events": "sum",
    "key_event_rate": "mean"
})
```

의미:

```text
플랫폼별로 그룹화한 후

sessions
→ 합계

key_events
→ 합계

key_event_rate
→ 평균
```

즉, 여러 분석 지표를 한 번에 집계할 수 있다.

---

# 3. 중요한 개념 정리

## `agg`는 지어낸 이름이 아니다

`agg()`는 Pandas에 실제로 존재하는 메서드다.

```text
agg
→ aggregate
→ 집계
```

따라서 다음과 같이 이해한다.

```python
df.groupby("platform").agg({
    "sessions": "sum"
})
```

```text
플랫폼별로 묶고
→ sessions를
→ 합계로 집계
```

---

## `df`는 공식 이름이 아니다

`df`는 DataFrame을 담기 위해 사용하는 변수 이름이다.

예를 들어 다음은 모두 가능하다.

```python
df = pd.DataFrame(data)
```

```python
campaign_df = pd.DataFrame(data)
```

```python
result = pd.DataFrame(data)
```

`df`가 많이 사용되는 이유는 `DataFrame`을 의미하는 관습적인 변수 이름이기 때문이다.

---

## `data` 역시 변수 이름이다

다음에서 `data`도 우리가 정한 변수 이름이다.

```python
data = {
    "campaign": ["민사_A", "민사_B"],
    "sessions": [1000, 700]
}
```

다음과 같이 이름을 변경해도 된다.

```python
advertising_data = {
    "campaign": ["민사_A", "민사_B"],
    "sessions": [1000, 700]
}
```

---

## `pd`는 Pandas의 관습적인 별칭이다

```python
import pandas as pd
```

여기서 `pd`는 Pandas를 사용하기 위해 붙인 별칭이다.

실무와 학습에서 매우 일반적으로 사용되기 때문에 `pd`를 그대로 사용하는 것이 좋다.

---

# 4. Colab 실습

## 4-1. 광고 데이터 DataFrame 생성

```python
import pandas as pd

data = {
    "platform": ["Naver", "Naver", "Google", "Google", "Kakao"],
    "campaign": ["민사_A", "민사_B", "민사_C", "민사_D", "민사_E"],
    "sessions": [1000, 700, 1200, 800, 500],
    "key_events": [120, 105, 150, 72, 60]
}

df = pd.DataFrame(data)

df
```

---

## 4-2. 주요 이벤트율 계산

주요 이벤트율은 다음과 같이 계산했다.

```text
주요 이벤트율
= 주요 이벤트 / 세션 × 100
```

```python
df["key_event_rate"] = df["key_events"] / df["sessions"] * 100

df
```

결과:

```text
민사_A → 12.0
민사_B → 15.0
민사_C → 12.5
민사_D → 9.0
민사_E → 12.0
```

---

## 4-3. 플랫폼별 총 세션

```python
df.groupby("platform")["sessions"].sum()
```

예상 결과:

```text
Google    2000
Kakao      500
Naver     1700
```

---

## 4-4. 플랫폼별 주요 이벤트 합계

```python
df.groupby("platform")["key_events"].sum()
```

예상 결과:

```text
Google    222
Kakao      60
Naver     225
```

---

## 4-5. 플랫폼별 평균 주요 이벤트율

```python
df.groupby("platform")["key_event_rate"].mean()
```

예상 결과:

```text
Google    10.75
Kakao     12.00
Naver     13.50
```

---

## 4-6. 여러 지표를 한 번에 집계

```python
df.groupby("platform").agg({
    "sessions": "sum",
    "key_events": "sum",
    "key_event_rate": "mean"
})
```

결과:

| 플랫폼 | 총 세션 | 총 주요 이벤트 | 평균 주요 이벤트율 |
|---|---:|---:|---:|
| Google | 2,000 | 222 | 10.75 |
| Kakao | 500 | 60 | 12.00 |
| Naver | 1,700 | 225 | 13.50 |

---

# 5. 실무형 분석

이번 실습에서는 단순히 코드를 작성하는 것에서 끝내지 않고 플랫폼별 성과를 비교했다.

### 총 세션

```text
Google → 2,000
Naver → 1,700
Kakao → 500
```

총 세션이 가장 많은 플랫폼은 **Google**이다.

### 주요 이벤트 합계

```text
Naver → 225
Google → 222
Kakao → 60
```

주요 이벤트 합계가 가장 많은 플랫폼은 **Naver**이다.

### 평균 주요 이벤트율

```text
Naver → 13.50%
Kakao → 12.00%
Google → 10.75%
```

평균 주요 이벤트율이 가장 높은 플랫폼은 **Naver**이다.

---

# 6. 오늘 배운 핵심

```text
groupby()
→ 특정 기준으로 데이터를 그룹화

sum()
→ 합계

mean()
→ 평균

agg()
→ 여러 집계 작업을 한 번에 적용
```

그리고 중요한 분석 관점:

> **트래픽 규모가 가장 큰 플랫폼이 반드시 효율이 가장 좋은 플랫폼은 아니다.**

이번 데이터에서는 Google의 세션 규모가 가장 컸지만, 평균 주요 이벤트율은 Naver가 가장 높았다.

따라서 데이터 분석에서는 **규모와 효율을 구분해서 보는 것**이 중요하다.

---

# 7. 코드 이름과 Pandas 기능 구분

| 코드 | 의미 |
|---|---|
| `data` | 직접 정한 변수 이름 |
| `df` | 직접 정한 변수 이름, DataFrame에 관습적으로 사용 |
| `pd` | Pandas의 관습적인 별칭 |
| `platform` | 데이터의 컬럼 이름 |
| `sessions` | 데이터의 컬럼 이름 |
| `key_events` | 데이터의 컬럼 이름 |
| `groupby()` | Pandas가 제공하는 메서드 |
| `sum()` | 합계를 구하는 메서드 |
| `mean()` | 평균을 구하는 메서드 |
| `agg()` | 여러 집계를 적용하는 Pandas 메서드 |

---

# 8. Day46 학습 완료 기준

- [x] DataFrame 생성
- [x] 파생 컬럼 `key_event_rate` 생성
- [x] `groupby()` 이해
- [x] `sum()` 사용
- [x] `mean()` 사용
- [x] `agg()` 이해
- [x] 플랫폼별 광고 데이터 집계
- [x] 플랫폼별 성과 비교
- [x] `df`, `data`, `pd`, `agg()`의 역할 구분

---

# 9. 한 줄 정리

> **Day46에서는 Pandas의 `groupby()`를 이용해 광고 데이터를 기준별로 묶고, `sum()`, `mean()`, `agg()`를 이용해 플랫폼별 성과를 집계하고 비교하는 방법을 학습했다.**

---