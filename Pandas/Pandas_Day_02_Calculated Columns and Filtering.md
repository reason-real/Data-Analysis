# Pandas Day 02 — Calculated Columns and Filtering

## 학습 목표

Day01에서는 Pandas DataFrame을 활용하여 광고 데이터를 분석하는 기본 흐름을 실습했다.

- DataFrame에서 새로운 계산 컬럼 만들기
- 컬럼 데이터 활용하기
- 조건을 이용한 데이터 필터링
- 필요한 컬럼만 선택하기
- 광고 데이터에서 주요 이벤트율 계산하기

---

# 📝 Notion — 이론 및 문제

## 🟢 Level 1 — 계산 컬럼 만들기

### 문제 1. 다음 광고 데이터를 DataFrame으로 만들어보자.

```python
data = {
    "campaign": ["민사_A", "민사_B", "민사_C", "민사_D"],
    "sessions": [1000, 700, 500, 300],
    "key_events": [120, 105, 80, 20]
}

df = pd.DataFrame(data)
```

### 문제 2. 주요 이벤트율 컬럼을 만들어보자.

공식:

> 주요 이벤트율 = 주요 이벤트 / 세션 × 100

```python
df["key_event_rate"] = df["key_events"] / df["sessions"] * 100
```

예상 결과:

```text
  campaign  sessions  key_events  key_event_rate
0    민사_A      1000         120       12.000000
1    민사_B       700         105       15.000000
2    민사_C       500          80       16.000000
3    민사_D       300          20        6.666667
```

### 문제 3. `key_event_rate` 컬럼만 출력하시오.

```python
df["key_event_rate"]
```

---

## 🟡 Level 2 — 조건으로 데이터 필터링하기

### 문제 4. 주요 이벤트율이 10% 이상인 캠페인만 선택하시오.

```python
filtered_df = df[df["key_event_rate"] >= 10]

print(filtered_df)
```

예상 결과:

```text
  campaign  sessions  key_events  key_event_rate
0    민사_A      1000         120           12.0
1    민사_B       700         105           15.0
2    민사_C       500          80           16.0
```

### 문제 5. 주요 이벤트율이 15% 이상인 캠페인만 선택하시오.

```python
filtered_df = df[df["key_event_rate"] >= 15]

print(filtered_df)
```

예상 결과:

```text
  campaign  sessions  key_events  key_event_rate
1    민사_B       700         105           15.0
2    민사_C       500          80           16.0
```

### 문제 6. 조건에 맞는 데이터에서 필요한 컬럼만 선택하시오.

10% 이상인 캠페인의 `campaign`과 `key_event_rate`만 확인한다.

```python
filtered_df = df[df["key_event_rate"] >= 10][
    ["campaign", "key_event_rate"]
]

print(filtered_df)
```

예상 결과:

```text
  campaign  key_event_rate
0    민사_A           12.0
1    민사_B           15.0
2    민사_C           16.0
```

---

# 🏆 Day02 Challenge — 광고 데이터 분석가 관점

다음 광고 데이터를 분석하자.

```python
data = {
    "campaign": ["민사_A", "민사_B", "민사_C", "민사_D"],
    "sessions": [1000, 700, 500, 300],
    "key_events": [120, 105, 80, 20]
}
```

### 문제 7

이 데이터를 `df`라는 DataFrame으로 만들어보자.

### 문제 8

각 캠페인의 주요 이벤트율을 계산하여 `key_event_rate` 컬럼을 추가하자.

### 문제 9

주요 이벤트율이 10% 이상인 캠페인만 선택하자.

### 문제 10

최종적으로 `campaign`과 `key_event_rate`만 출력하자.

목표:

```text
  campaign  key_event_rate
0    민사_A           12.0
1    민사_B           15.0
2    민사_C           16.0
```

---

# 📌 Notion 핵심 이론 정리

## 1. 계산 컬럼

Pandas에서는 기존 컬럼을 이용해 새로운 컬럼을 만들 수 있다.

```python
df["key_event_rate"] = df["key_events"] / df["sessions"] * 100
```

즉,

```text
기존 데이터
sessions
key_events
     ↓
계산
     ↓
새로운 데이터
key_event_rate
```

---

## 2. 조건 필터링

다음과 같이 조건을 사용하여 원하는 행만 선택할 수 있다.

```python
df[df["key_event_rate"] >= 10]
```

의미:

> `key_event_rate`가 10 이상인 행만 선택한다.

---

## 3. 여러 컬럼 선택

컬럼 하나를 선택할 때:

```python
df["campaign"]
```

여러 컬럼을 선택할 때:

```python
df[["campaign", "key_event_rate"]]
```

여기서 중요한 점은 `df`가 앞에 있어야 한다는 것이다.

```python
["campaign", "key_event_rate"]
```

는 단순한 Python 리스트이고,

```python
df[["campaign", "key_event_rate"]]
```

는 DataFrame에서 해당 컬럼을 선택하는 것이다.

---

## 4. 조건 + 컬럼 선택

두 가지를 결합할 수도 있다.

```python
df[df["key_event_rate"] >= 10][
    ["campaign", "key_event_rate"]
]
```

의미:

> 주요 이벤트율이 10% 이상인 캠페인 중에서 캠페인명과 주요 이벤트율만 보여준다.

---

# 💻 Colab — 실제 코드 실습

## 1. Pandas 불러오기

```python
import pandas as pd
```

## 2. 데이터 준비

```python
data = {
    "campaign": ["민사_A", "민사_B", "민사_C", "민사_D"],
    "sessions": [1000, 700, 500, 300],
    "key_events": [120, 105, 80, 20]
}
```

## 3. DataFrame 만들기

```python
df = pd.DataFrame(data)

print(df)
```

## 4. 주요 이벤트율 컬럼 만들기

```python
df["key_event_rate"] = df["key_events"] / df["sessions"] * 100

print(df)
```

결과:

```text
  campaign  sessions  key_events  key_event_rate
0    민사_A      1000         120       12.000000
1    민사_B       700         105       15.000000
2    민사_C       500          80       16.000000
3    민사_D       300          20        6.666667
```

## 5. 10% 이상 캠페인 필터링

```python
filtered_df = df[df["key_event_rate"] >= 10]

print(filtered_df)
```

결과:

```text
  campaign  sessions  key_events  key_event_rate
0    민사_A      1000         120           12.0
1    민사_B       700         105           15.0
2    민사_C       500          80           16.0
```

## 6. 필요한 컬럼만 선택

```python
filtered_df = filtered_df[
    ["campaign", "key_event_rate"]
]

print(filtered_df)
```

결과:

```text
  campaign  key_event_rate
0    민사_A           12.0
1    민사_B           15.0
2    민사_C           16.0
```

---

# 🎯 Day02 Colab Mission

다음 전체 과정을 직접 작성하여 실행한다.

```python
import pandas as pd

data = {
    "campaign": ["민사_A", "민사_B", "민사_C", "민사_D"],
    "sessions": [1000, 700, 500, 300],
    "key_events": [120, 105, 80, 20]
}

df = pd.DataFrame(data)

df["key_event_rate"] = df["key_events"] / df["sessions"] * 100

filtered_df = df[df["key_event_rate"] >= 10]

filtered_df = filtered_df[
    ["campaign", "key_event_rate"]
]

print(filtered_df)
```

최종 결과:

```text
  campaign  key_event_rate
0    민사_A           12.0
1    민사_B           15.0
2    민사_C           16.0
```

---

# 📚 Day02 학습 흐름 정리

```text
Dictionary
    ↓
DataFrame 생성
    ↓
기존 컬럼 활용
    ↓
계산 컬럼 생성
    ↓
조건 필터링
    ↓
필요한 컬럼 선택
    ↓
분석 결과 확인
```

Day44에서는 단순히 데이터를 출력하는 것이 아니라,

> **광고 데이터에서 필요한 지표를 계산하고 조건에 맞는 데이터만 추출하는 과정**

을 Pandas로 구현하는 것을 목표로 한다.

---

# ✅ Day02 완료 체크

- [x] DataFrame 생성
- [x] 계산 컬럼 생성
- [x] 조건 필터링
- [x] 컬럼 선택
- [x] 광고 데이터 분석 흐름 이해
- [x] Colab 직접 실습
- [x] 최종 Mission 완료

---