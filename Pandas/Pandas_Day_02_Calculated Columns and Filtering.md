# Pandas Day 02 — Calculated Columns and Filtering

## 학습 목표

Day01에서는 Pandas DataFrame을 활용하여 광고 데이터를 분석하는 기본 흐름을 실습했다.

- DataFrame에서 새로운 계산 컬럼 만들기
- 컬럼 데이터 활용하기
- 조건을 이용한 데이터 필터링
- 필요한 컬럼만 선택하기
- 광고 데이터에서 주요 이벤트율 계산하기

---

## 1. 실습 환경 준비

```python
import pandas as pd
```

---

## 2. 광고 데이터 DataFrame 만들기

```python
data = {
    "campaign": ["민사_A", "민사_B", "민사_C", "민사_D"],
    "sessions": [1000, 700, 500, 300],
    "key_events": [120, 105, 80, 20]
}

df = pd.DataFrame(data)

print(df)
```

DataFrame을 생성하고 데이터를 확인했다.

---

## 3. 주요 이벤트율 컬럼 만들기

주요 이벤트율 공식:

> 주요 이벤트율 = 주요 이벤트 / 세션 × 100

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

Pandas에서는 각 행의 데이터를 직접 반복하지 않아도 컬럼 단위로 계산할 수 있다.

---

## 4. 특정 컬럼 확인하기

주요 이벤트율 컬럼만 확인:

```python
print(df["key_event_rate"])
```

캠페인과 주요 이벤트율만 확인:

```python
print(df[["campaign", "key_event_rate"]])
```

---

## 5. 조건을 이용한 데이터 필터링

주요 이벤트율이 10% 이상인 캠페인만 선택했다.

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

10% 미만인 민사_D는 필터링되어 제외된다.

---

## 6. 15% 이상인 캠페인 찾기

```python
filtered_df = df[df["key_event_rate"] >= 15]

print(filtered_df)
```

결과:

```text
  campaign  sessions  key_events  key_event_rate
1    민사_B       700         105           15.0
2    민사_C       500          80           16.0
```

---

## 7. 조건 + 필요한 컬럼 선택

10% 이상인 캠페인을 선택한 후 `campaign`, `key_event_rate` 컬럼만 확인했다.

```python
filtered_df = df[df["key_event_rate"] >= 10][
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

### 중요한 문법 차이

다음 코드는 단순히 Python 리스트를 만드는 것이다.

```python
["campaign", "key_event_rate"]
```

반면 다음 코드는 DataFrame에서 해당 컬럼을 선택한다.

```python
df[["campaign", "key_event_rate"]]
```

즉, `df`가 앞에 있어야 DataFrame의 컬럼 선택이 된다.

---

## 8. 최종 Mission

광고 데이터를 DataFrame으로 만들고 주요 이벤트율을 계산한 뒤, 주요 이벤트율이 10% 이상인 캠페인만 선택하고 필요한 컬럼만 출력했다.

```python
data = {
    "campaign": ["민사_A", "민사_B", "민사_C", "민사_D"],
    "sessions": [1000, 700, 500, 300],
    "key_events": [120, 105, 80, 20]
}

df = pd.DataFrame(data)

df["key_event_rate"] = df["key_events"] / df["sessions"] * 100

filtered_df = df[df["key_event_rate"] >= 10][
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

## 9. Day02 핵심 정리

이번 회차에서는 다음과 같은 Pandas 분석 흐름을 익혔다.

```text
DataFrame 생성
    ↓
계산 컬럼 생성
    ↓
조건으로 행 필터링
    ↓
필요한 컬럼 선택
    ↓
분석 결과 확인
```

특히 다음 문법을 익히는 것이 중요하다.

```python
df["새로운_컬럼"] = 계산식
```

```python
df[df["컬럼"] >= 조건]
```

```python
df[["컬럼1", "컬럼2"]]
```

그리고 이 세 가지를 결합하면 실제 데이터 분석에서 필요한 데이터를 빠르게 추출할 수 있다.

---

## 10. Colab 실습 결과

Colab에서 직접 코드를 작성하고 실행했다.

### 확인한 내용

- DataFrame 생성 성공
- `key_event_rate` 계산 성공
- 10% 이상 데이터 필터링 성공
- 필요한 컬럼 선택 과정에서 한 차례 문법 실수 경험
- `["campaign", "key_event_rate"]`와 `df[["campaign", "key_event_rate"]]`의 차이 이해
- 최종 Mission 성공

---