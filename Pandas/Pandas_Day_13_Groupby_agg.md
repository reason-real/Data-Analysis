# Pandas Day13 - GroupBy Aggregation with agg()

## 학습 목표
- `groupby()`를 사용해 매체별 데이터를 그룹화한다.
- `agg()`로 여러 집계 함수를 한 번에 적용한다.
- 열마다 서로 다른 집계 함수를 지정한다.
- 집계 결과를 마케팅 성과 분석에 활용한다.

## 1. groupby() 복습

`groupby()`는 특정 기준에 따라 데이터를 그룹으로 나누는 기능이다.

```python
df.groupby("platform")["sessions"].sum()
```

- `groupby("platform")`: 매체별로 그룹화한다.
- `["sessions"]`: 세션 열을 선택한다.
- `sum()`: 매체별 세션 합계를 계산한다.

## 2. agg()란?

`agg()`는 하나 이상의 집계 함수를 적용하는 메서드다.

| 함수 | 의미 | 마케팅 분석 예시 |
|---|---|---|
| `sum` | 합계 | 매체별 총 세션 수 |
| `mean` | 평균 | 캠페인당 평균 세션 수 |
| `max` | 최댓값 | 매체 내 최대 캠페인 세션 수 |
| `min` | 최솟값 | 매체 내 최소 캠페인 세션 수 |
| `count` | 결측값이 아닌 값의 개수 | 기록된 캠페인 수 |

## 3. 한 열에 여러 집계 함수 적용하기

```python
df.groupby("platform")["sessions"].agg(["sum", "mean", "max"])
```

세션 열에 합계, 평균, 최댓값을 한 번에 적용한다.

예를 들어 Naver의 세션이 1,000과 700이라면 다음과 같다.

- 합계: 1,700
- 평균: 850
- 최댓값: 1,000

## 4. 여러 열에 서로 다른 집계 함수 적용하기

```python
result = df.groupby("platform").agg({
    "sessions": ["sum", "mean"],
    "key_events": ["sum", "max"]
})

print(result)
```

- `sessions`: 합계와 평균
- `key_events`: 합계와 최댓값

**핵심:** 딕셔너리의 키에는 열 이름을, 값에는 적용할 집계 함수 목록을 지정한다.

## 5. 전체 실습 코드

```python
import pandas as pd

data = {
    "platform": ["Naver", "Naver", "Google", "Google", "Kakao"],
    "campaign": ["민사_A", "민사_B", "민사_C", "민사_D", "민사_E"],
    "sessions": [1000, 700, 1200, 800, 500],
    "key_events": [120, 105, 150, 72, 60]
}

df = pd.DataFrame(data)

result = df.groupby("platform").agg({
    "sessions": ["sum", "mean"],
    "key_events": ["sum", "max"]
})

print(result)
```

## 6. 예상 결과

| platform | sessions sum | sessions mean | key_events sum | key_events max |
|---|---:|---:|---:|---:|
| Google | 2000 | 1000 | 222 | 150 |
| Kakao | 500 | 500 | 60 | 60 |
| Naver | 1700 | 850 | 225 | 120 |

## 7. 실무 적용

마케팅 데이터 분석에서는 여러 통계를 함께 확인해 매체별 성과를 비교할 수 있다.

- **합계:** 전체 유입 또는 전환 규모 파악
- **평균:** 캠페인당 일반적인 성과 수준 파악
- **최댓값:** 가장 높은 성과를 기록한 캠페인의 규모 파악

단, 최댓값만으로 성과가 좋다고 판단하면 안 된다. 광고비, 전환율, 집행 기간 등도 함께 살펴봐야 한다.

## 8. 오늘의 핵심 요약

- `groupby()`는 데이터를 그룹으로 나눈다.
- `agg()`는 여러 집계 함수를 한 번에 적용한다.
- 리스트를 사용하면 한 열에 여러 함수를 적용할 수 있다.
- 딕셔너리를 사용하면 열마다 서로 다른 함수를 지정할 수 있다.
- 집계 결과는 KPI 비교와 마케팅 성과 리포트에 활용할 수 있다.

## 9. 학습 체크리스트

- [ ] `agg()`의 역할을 설명할 수 있다.
- [ ] 한 열에 `sum`, `mean`, `max`를 함께 적용할 수 있다.
- [ ] 여러 열에 서로 다른 집계 함수를 적용할 수 있다.
- [ ] 합계, 평균, 최댓값의 의미를 구분할 수 있다.
- [ ] 매체별 집계 결과를 해석할 수 있다.