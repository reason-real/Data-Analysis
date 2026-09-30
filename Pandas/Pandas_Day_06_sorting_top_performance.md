# Day48 | Pandas Day06

## Topic
데이터 정렬과 상위 성과 캠페인 분석

---

## 1. 학습 목표

- `sort_values()`를 사용해 DataFrame 정렬하기
- `ascending=False`로 내림차순 정렬하기
- `head()`로 상위 N개 데이터 추출하기
- 조건 필터링 + 정렬 + TOP N 조합하기
- 마케팅 캠페인의 성과가 높은 데이터를 찾기

---

# Part 1. Notion Theory

## 2. 기본 데이터

```python
import pandas as pd

data = {
    "campaign": ["민사_A", "민사_B", "민사_C", "민사_D", "민사_E"],
    "sessions": [1000, 700, 1200, 800, 500],
    "key_events": [120, 105, 150, 72, 60]
}

df = pd.DataFrame(data)
```

---

## 3. 파생 컬럼 만들기

Key Event Rate를 계산한다.

```python
df["key_event_rate"] = df["key_events"] / df["sessions"] * 100
```

결과:

| campaign | sessions | key_events | key_event_rate |
|---|---:|---:|---:|
| 민사_A | 1000 | 120 | 12.0 |
| 민사_B | 700 | 105 | 15.0 |
| 민사_C | 1200 | 150 | 12.5 |
| 민사_D | 800 | 72 | 9.0 |
| 민사_E | 500 | 60 | 12.0 |

---

## 4. `sort_values()`

특정 컬럼을 기준으로 행을 정렬한다.

```python
df.sort_values("sessions")
```

기본값은 오름차순이다.

```text
작은 값 → 큰 값
```

---

## 5. 내림차순 정렬

높은 값부터 보고 싶다면 `ascending=False`를 사용한다.

```python
df.sort_values(
    "key_event_rate",
    ascending=False
)
```

```text
큰 값 → 작은 값
```

마케팅 분석에서는 성과가 높은 캠페인을 찾을 때 자주 사용한다.

---

## 6. 필요한 컬럼만 선택해서 정렬

```python
df[["campaign", "key_event_rate"]].sort_values(
    "key_event_rate",
    ascending=False
)
```

분석 결과에 필요한 컬럼만 선택하면 결과를 더 쉽게 확인할 수 있다.

---

## 7. `head()`와 TOP N

상위 3개 캠페인을 확인한다.

```python
df.sort_values(
    "key_event_rate",
    ascending=False
).head(3)
```

핵심 흐름:

```text
sort_values()
↓
성과가 높은 순서로 정렬
↓
head(3)
↓
상위 3개 추출
```

---

## 8. 조건 + 정렬

세션이 700 이상인 캠페인만 대상으로 전환율을 높은 순서로 정렬한다.

```python
df[
    df["sessions"] >= 700
].sort_values(
    "key_event_rate",
    ascending=False
)
```

---

## 9. 조건 + 정렬 + TOP N

세션이 700 이상인 캠페인 중 전환율 TOP 3을 찾는다.

```python
df[
    df["sessions"] >= 700
].sort_values(
    "key_event_rate",
    ascending=False
).head(3)
```

이 패턴은 실무에서 중요하다.

예:

- 전환율 TOP 3 캠페인
- 매출 TOP 5 상품
- ROAS TOP 10 광고
- CTR이 높은 상위 채널
- 구매율이 높은 고객군

---

# Part 2. Colab Practice

## 10. 전체 코드 실행

```python
import pandas as pd

data = {
    "campaign": ["민사_A", "민사_B", "민사_C", "민사_D", "민사_E"],
    "sessions": [1000, 700, 1200, 800, 500],
    "key_events": [120, 105, 150, 72, 60]
}

df = pd.DataFrame(data)

df["key_event_rate"] = df["key_events"] / df["sessions"] * 100

df
```

---

## 11. 세션 수 기준 정렬

```python
df.sort_values("sessions")
```

---

## 12. 전환율 높은 순 정렬

```python
df.sort_values(
    "key_event_rate",
    ascending=False
)
```

---

## 13. 전환율 TOP 3

```python
df.sort_values(
    "key_event_rate",
    ascending=False
).head(3)
```

---

## 14. 조건 + 정렬

```python
df[
    df["sessions"] >= 700
].sort_values(
    "key_event_rate",
    ascending=False
)
```

---

## 15. 최종 분석 코드

세션이 700 이상인 캠페인 중 전환율 TOP 2를 확인한다.

```python
df[
    df["sessions"] >= 700
].sort_values(
    "key_event_rate",
    ascending=False
).head(2)[
    ["campaign", "sessions", "key_event_rate"]
]
```

예상 결과:

```text
  campaign  sessions  key_event_rate
1     민사_B       700            15.0
2     민사_C      1200            12.5
```

---

# 16. 오늘 발생한 오류와 해결

## `KeyError`

```text
KeyError: 'key_event_rate'
```

### 원인

DataFrame에 `key_event_rate` 컬럼이 아직 생성되지 않은 상태에서 해당 컬럼으로 정렬하려고 했다.

### 해결

```python
df["key_event_rate"] = df["key_events"] / df["sessions"] * 100
```

---

## `AttributeError`

```text
AttributeError
```

### 원인

```python
sort_value()
```

라고 입력했기 때문이다.

Pandas의 정확한 메서드 이름은:

```python
sort_values()
```

### 올바른 코드

```python
df.sort_values(
    "key_event_rate",
    ascending=False
)
```

---

# 17. 오늘의 핵심 정리

### `sort_values()`

데이터를 특정 컬럼 기준으로 정렬한다.

```python
df.sort_values("sessions")
```

### `ascending=False`

내림차순으로 정렬한다.

```python
df.sort_values(
    "key_event_rate",
    ascending=False
)
```

### `head(N)`

상위 N개 데이터를 가져온다.

```python
df.head(3)
```

### 조건 + 정렬 + TOP N

```python
df[
    df["sessions"] >= 700
].sort_values(
    "key_event_rate",
    ascending=False
).head(3)
```

---

# 18. 마케팅 데이터 분석 관점

오늘 배운 문법은 단순한 Python 문법이 아니라 성과 분석에 직접 연결된다.

```text
데이터
↓
조건으로 분석 대상 선정
↓
성과 지표 기준 정렬
↓
TOP N 추출
↓
성과가 좋은 캠페인 확인
↓
왜 성과가 좋은지 추가 분석
```

예를 들어:

> "세션이 충분히 확보된 캠페인 중 Key Event Rate가 높은 캠페인은 무엇인가?"

라는 비즈니스 질문을

```python
df[
    df["sessions"] >= 700
].sort_values(
    "key_event_rate",
    ascending=False
).head(2)
```

처럼 데이터 분석 코드로 바꿀 수 있다.