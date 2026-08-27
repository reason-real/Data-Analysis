# Pandas Day 01 — DataFrame Basics

## 학습 목표

Day01에서는 Pandas를 처음으로 실습했다.

이번 학습의 목표는 다음과 같다.

- Dictionary 데이터를 DataFrame으로 변환할 수 있다.
- DataFrame에서 원하는 컬럼을 선택할 수 있다.
- `head()`를 이용해 데이터의 앞부분을 확인할 수 있다.
- `shape`를 이용해 데이터의 행과 열 개수를 확인할 수 있다.
- `columns`를 이용해 컬럼 이름을 확인할 수 있다.
- Colab에서 직접 코드를 작성하고 실행할 수 있다.

---

## 1. Pandas란?

Pandas는 Python에서 데이터를 표 형태로 다루기 위한 대표적인 라이브러리이다.

광고 데이터 분석에서는 다음과 같은 데이터를 다루게 된다.

- 캠페인
- 세션
- 주요 이벤트
- 전환
- 매출
- CTR
- CVR
- 유입 경로

Pandas를 이용하면 이런 데이터를 표 형태로 불러오고, 필요한 데이터를 선택하거나 정제하고 분석할 수 있다.

---

## 2. DataFrame

Pandas에서 가장 중요한 자료구조 중 하나가 `DataFrame`이다.

쉽게 말하면 **행과 열로 구성된 표 형태의 데이터 구조**이다.

예를 들어 광고 데이터가 다음과 같다고 하자.

| campaign | sessions | key_events |
|---|---:|---:|
| 민사_A | 1000 | 120 |
| 민사_B | 700 | 105 |
| 민사_C | 500 | 80 |

이런 형태의 데이터를 Pandas에서는 DataFrame으로 다룰 수 있다.

---

## 3. Dictionary를 DataFrame으로 만들기

먼저 Pandas를 불러온다.

```python
import pandas as pd
```

Dictionary 데이터를 만든다.

```python
data = {
    "campaign": ["민사_A", "민사_B", "민사_C"],
    "sessions": [1000, 700, 500],
    "key_events": [120, 105, 80]
}
```

`pd.DataFrame()`을 사용하면 DataFrame으로 변환할 수 있다.

```python
df = pd.DataFrame(data)

print(df)
```

결과:

```text
  campaign  sessions  key_events
0     민사_A      1000         120
1     민사_B       700         105
2     민사_C       500          80
```

여기서 `0`, `1`, `2`는 각 행의 index이다.

---

## 4. 컬럼 하나 선택하기

특정 컬럼 하나를 선택할 때는 다음과 같이 작성한다.

```python
df["sessions"]
```

예:

```python
print(df["sessions"])
```

결과:

```text
0    1000
1     700
2     500
Name: sessions, dtype: int64
```

중요한 점은 실제 컬럼 이름과 정확히 일치해야 한다는 것이다.

```python
df["sessions"]
```

은 가능하지만,

```python
df["session"]
```

은 `session`이라는 컬럼이 없기 때문에 오류가 발생한다.

---

## 5. 여러 컬럼 선택하기

여러 컬럼을 선택할 때는 대괄호를 두 겹 사용한다.

```python
df[["campaign", "key_events"]]
```

결과:

```text
  campaign  key_events
0     민사_A         120
1     민사_B         105
2     민사_C          80
```

정리하면:

```python
df["sessions"]
```

→ 컬럼 하나 선택

```python
df[["campaign", "key_events"]]
```

→ 여러 컬럼 선택

---

## 6. head()

`head()`는 DataFrame의 앞부분을 확인할 때 사용한다.

```python
df.head()
```

기본적으로 앞의 5개 행을 보여준다.

원하는 행의 개수를 지정할 수도 있다.

```python
df.head(3)
```

실무에서는 데이터가 수천~수백만 행일 수도 있기 때문에 전체 데이터를 한 번에 출력하는 것보다 `head()`로 일부 데이터를 먼저 확인하는 것이 유용하다.

---

## 7. shape

`shape`는 DataFrame의 크기를 확인한다.

```python
df.shape
```

예를 들어:

```text
(3, 3)
```

이라면

- 행(row) = 3개
- 열(column) = 3개

라는 의미이다.

즉:

```text
(행 개수, 열 개수)
```

순서로 이해하면 된다.

---

## 8. columns

현재 DataFrame에 어떤 컬럼이 존재하는지 확인할 수 있다.

```python
df.columns
```

예:

```text
Index(['campaign', 'sessions', 'key_events'], dtype='object')
```

현재 데이터의 컬럼이

- `campaign`
- `sessions`
- `key_events`

라는 것을 확인할 수 있다.

`Index`나 `dtype`의 내부 구조까지 깊게 공부할 필요는 없으며, 현재 단계에서는 **컬럼 이름을 확인하는 기능**으로 이해하면 충분하다.

---

# Notion Problems

## Level 1 — DataFrame Basics

### 문제 1

다음 Dictionary를 DataFrame으로 만들어보자.

```python
data = {
    "campaign": ["민사_A", "민사_B", "민사_C"],
    "sessions": [1000, 700, 500],
    "key_events": [120, 105, 80]
}
```

### 정답

```python
import pandas as pd

data = {
    "campaign": ["민사_A", "민사_B", "민사_C"],
    "sessions": [1000, 700, 500],
    "key_events": [120, 105, 80]
}

df = pd.DataFrame(data)

print(df)
```

---

### 문제 2

`df`에서 `sessions` 컬럼만 출력하시오.

### 정답

```python
print(df["sessions"])
```

주의:

```python
df["session"]
```

이 아니라 정확한 컬럼명인:

```python
df["sessions"]
```

를 사용해야 한다.

---

### 문제 3

`campaign`과 `key_events` 컬럼만 출력하시오.

### 정답

```python
print(df[["campaign", "key_events"]])
```

---

## Level 2 — Data Structure Check

### 문제 4

DataFrame의 앞부분을 확인하시오.

### 정답

```python
print(df.head())
```

`head()`는 데이터 전체를 출력하지 않고 앞부분만 확인할 수 있기 때문에 대용량 데이터의 초기 구조를 확인할 때 유용하다.

---

### 문제 5

DataFrame의 크기를 확인하시오.

### 정답

```python
print(df.shape)
```

예:

```text
(3, 3)
```

→ 3행 3열

---

### 문제 6

현재 DataFrame의 컬럼 이름을 확인하시오.

### 정답

```python
print(df.columns)
```

---

# Day43 Challenge

다음 광고 데이터를 DataFrame으로 만들어보자.

```python
data = {
    "campaign": ["민사_A", "민사_B", "민사_C", "민사_D"],
    "sessions": [1000, 700, 500, 300],
    "key_events": [120, 105, 80, 20]
}
```

### 문제 7

`df`라는 DataFrame을 만들어보자.

### 정답

```python
df = pd.DataFrame(data)
```

---

### 문제 8

`campaign`과 `sessions`만 확인하시오.

### 정답

```python
print(df[["campaign", "sessions"]])
```

---

### 문제 9

데이터의 행과 열 개수를 확인하시오.

### 정답

```python
print(df.shape)
```

결과:

```text
(4, 3)
```

→ 4행 3열

---

### 문제 10 — 분석가 사고방식

처음 데이터를 받았다고 생각해보자.

왜 분석을 시작하기 전에 다음을 확인하는 것이 좋을까?

```python
df.head()
df.shape
df.columns
```

### 정답

데이터 분석을 시작하기 전에 데이터의 구조를 파악하기 위해서이다.

- `df.head()` → 실제 데이터가 어떻게 생겼는지 확인
- `df.shape` → 데이터의 크기 확인
- `df.columns` → 어떤 컬럼이 존재하는지 확인

특히 실무에서는 데이터가 매우 클 수 있기 때문에 전체 데이터를 바로 분석하기보다 먼저 구조를 확인하는 것이 중요하다.

---

# Colab Practice

## Practice 1 — Pandas Import

```python
import pandas as pd
```

---

## Practice 2 — Create DataFrame

```python
data = {
    "campaign": ["민사_A", "민사_B", "민사_C"],
    "sessions": [1000, 700, 500],
    "key_events": [120, 105, 80]
}

df = pd.DataFrame(data)

print(df)
```

---

## Practice 3 — Select One Column

```python
print(df["campaign"])
print(df["sessions"])
```

---

## Practice 4 — Select Multiple Columns

```python
print(df[["campaign", "key_events"]])
```

---

## Practice 5 — Check Data Structure

```python
print(df.head())
print(df.shape)
print(df.columns)
```

---

# Colab Final Mission

다음 데이터를 사용한다.

```python
data = {
    "campaign": ["민사_A", "민사_B", "민사_C", "민사_D"],
    "sessions": [1000, 700, 500, 300],
    "key_events": [120, 105, 80, 20]
}

df = pd.DataFrame(data)
```

다음 5가지 작업을 직접 실행한다.

1. `campaign` 컬럼 출력
2. `sessions` 컬럼 출력
3. `campaign`과 `key_events` 출력
4. DataFrame 크기 확인
5. 컬럼 이름 확인

### 최종 코드

```python
print(df["campaign"])

print(df["sessions"])

print(df[["campaign", "key_events"]])

print(df.shape)

print(df.columns)
```

---

# Day01 Learning Summary

이번 학습에서 익힌 핵심은 다음과 같다.

```text
Dictionary
↓
DataFrame 생성
↓
컬럼 선택
↓
head()
↓
shape
↓
columns
```

데이터를 받았을 때:

```text
데이터 구조 확인
↓
필요한 컬럼 선택
↓
데이터 정제
↓
지표 계산
↓
필터링 / 그룹화
↓
분석 결과 도출
```

과 같은 분석 흐름을 실제 데이터에 적용할 수 있는 능력이다.

Day01에서는 그 첫 단계인 **DataFrame의 구조를 확인하고 필요한 컬럼을 선택하는 방법**을 학습했다.

---

# Colab Completion

- [x] DataFrame 생성
- [x] 컬럼 하나 선택
- [x] 여러 컬럼 선택
- [x] `head()` 사용
- [x] `shape` 사용
- [x] `columns` 사용
- [x] Colab에서 직접 실행
- [x] Final Mission 완료