# Pandas Day12 - GroupBy Aggregation

## 학습 목표
- `groupby()`를 사용해 매체별 데이터를 집계한다.
- `sum()`과 `mean()`으로 합계와 평균을 계산한다.
- 집계한 데이터에 새로운 KPI 열을 추가한다.
- `sort_values()`로 성과가 높은 순서대로 정렬한다.

## 1. GroupBy란?

`groupby()`는 특정 기준에 따라 데이터를 그룹으로 나누고, 각 그룹의 통계를 계산하는 기능이다.

마케팅 데이터에서는 매체별 성과, 캠페인별 전환 수, 월별 광고비 등을 분석할 때 사용한다.

```python
df.groupby("platform")["sessions"].sum()
```

- `groupby("platform")`: 매체별로 그룹화한다.
- `["sessions"]`: 세션 열을 선택한다.
- `.sum()`: 각 매체의 세션 합계를 계산한다.

## 2. 여러 열 집계하기

```python
result = df.groupby("platform")[["sessions", "key_events"]].sum()
```

매체별 세션과 전환 수의 합계를 한 번에 계산할 수 있다.

평균을 계산하려면 `mean()`을 사용한다.

```python
df.groupby("platform")["sessions"].mean()
```

## 3. 집계 결과로 KPI 계산하기

집계한 DataFrame에 새로운 열을 추가할 수 있다.

```python
result["key_event_rate"] = (
    result["key_events"] / result["sessions"] * 100
)
```

전환율은 전환 수를 세션 수로 나눈 뒤 100을 곱해 계산한다.

**주의:** 매체별 전환율은 매체별 전환 수 합계를 매체별 세션 합계로 나누어 계산한다. 개별 캠페인 전환율의 단순 평균과는 다를 수 있다.

## 4. 성과순 정렬하기

```python
result = result.sort_values(
    "key_event_rate",
    ascending=False
)
```

- `key_event_rate`: 정렬 기준 열
- `ascending=False`: 내림차순, 즉 큰 값부터 작은 값 순서

## 5. 실습 코드

```python
import pandas as pd

data = {
    "platform": ["Naver", "Naver", "Google", "Google", "Kakao"],
    "campaign": ["민사_A", "민사_B", "민사_C", "민사_D", "민사_E"],
    "sessions": [1000, 700, 1200, 800, 500],
    "key_events": [120, 105, 150, 72, 60]
}

df = pd.DataFrame(data)

# 매체별 세션과 전환 수 합계
result = df.groupby("platform")[["sessions", "key_events"]].sum()

# 매체별 전환율 계산
result["key_event_rate"] = (
    result["key_events"] / result["sessions"] * 100
)

# 전환율 내림차순 정렬
result = result.sort_values(
    "key_event_rate",
    ascending=False
)

print(result.round(2))
```

## 6. 예상 결과

| platform | sessions | key_events | key_event_rate |
|---|---:|---:|---:|
| Naver | 1700 | 225 | 13.24 |
| Kakao | 500 | 60 | 12.00 |
| Google | 2000 | 222 | 11.10 |

## 7. 실무 적용
- 매체별 성과 비교
- 캠페인별 전환 수 집계
- 광고 채널별 KPI 비교
- 성과가 높은 매체 우선 확인

## 8. 체크리스트
- [ ] `groupby()`로 그룹화할 수 있다.
- [ ] `sum()`으로 여러 열을 집계할 수 있다.
- [ ] 집계 결과에 새로운 KPI 열을 추가할 수 있다.
- [ ] `sort_values()`로 내림차순 정렬할 수 있다.
- [ ] 매체별 전환율을 비교하고 결과를 해석할 수 있다.