# Pandas Day17: Missing Data Handling and Safe KPI Calculation

## 1. 학습 목표

- `isna()`로 결측값 확인하기
- `isna().sum()`으로 열별 결측값 개수 확인하기
- 결측값이 있는 행만 필터링하기
- `where()`를 활용해 0으로 나누는 상황 방지하기
- 결측값을 고려해 마케팅 KPI 해석하기

## 2. 실습 데이터 준비

```python
import pandas as pd

performance = pd.DataFrame({
    "campaign": ["민사_A", "민사_B", "민사_C", "민사_D"],
    "sessions": [1000, 700, 1200, 500],
    "key_events": [120, 105, 150, 0]
})

cost_data = pd.DataFrame({
    "campaign": ["민사_A", "민사_B", "민사_D"],
    "cost": [50000, 35000, 20000]
})

left_merged = pd.merge(
    performance,
    cost_data,
    on="campaign",
    how="left"
)

print(left_merged)
```

## 3. 결측값 확인하기

### 3-1. `isna()`

각 셀이 결측값인지 `True` 또는 `False`로 표시한다.

```python
print(left_merged.isna())
```

### 3-2. `isna().sum()`

각 열에 결측값이 몇 개 있는지 계산한다.

```python
print(left_merged.isna().sum())
```

예상 결과:

```text
campaign      0
sessions      0
key_events    0
cost          1
dtype: int64
```

`cost` 열에 결측값이 1개 있다는 의미다. `민사_C`가 성과 데이터에는 있지만 광고비 데이터에는 없기 때문이다.

## 4. 결측값이 있는 행만 추출하기

`isna()`를 조건으로 사용하면 특정 열에 결측값이 있는 행만 필터링할 수 있다.

```python
missing_cost = left_merged[
    left_merged["cost"].isna()
]

print(missing_cost)
```

예상 결과:

| campaign | sessions | key_events | cost |
|---|---:|---:|---:|
| 민사_C | 1200 | 150 | NaN |

## 5. 핵심 KPI 계산하기

### 5-1. 핵심 이벤트율

전체 세션 중 핵심 이벤트가 발생한 비율을 백분율로 계산한다.

```python
left_merged["key_event_rate"] = (
    left_merged["key_events"]
    / left_merged["sessions"] * 100
)
```

### 5-2. 이벤트당 비용

핵심 이벤트 수가 0보다 클 때만 분모로 사용한다. 이벤트가 0건이면 이벤트당 비용을 계산할 수 없으므로 `NaN`으로 처리한다.

```python
left_merged["cost_per_event"] = (
    left_merged["cost"]
    / left_merged["key_events"].where(
        left_merged["key_events"] > 0
    )
)
```

### 5-3. 필요한 열만 출력하기

```python
print(
    left_merged[
        [
            "campaign",
            "cost",
            "key_event_rate",
            "cost_per_event"
        ]
    ].round(2)
)
```

## 6. 예상 결과

| campaign | cost | key_event_rate | cost_per_event |
|---|---:|---:|---:|
| 민사_A | 50000 | 12.00 | 416.67 |
| 민사_B | 35000 | 15.00 | 333.33 |
| 민사_C | NaN | 12.50 | NaN |
| 민사_D | 20000 | 0.00 | NaN |

- `민사_C`: 광고비 데이터가 없어서 이벤트당 비용을 계산할 수 없다.
- `민사_D`: 핵심 이벤트가 0건이므로 이벤트당 비용을 계산할 수 없다.

## 7. 실무에서 주의할 점

- **결측값과 0은 다르다.** `NaN`은 데이터가 없거나 확인되지 않았다는 의미이고, 0은 값이 실제로 0이라는 의미다.
- **결측값을 무조건 0으로 채우지 않는다.** 실제로 비용이 0원인지, 데이터가 누락된 것인지 먼저 확인해야 한다.
- **분모가 0인지 확인한다.** 이벤트 수가 0이면 이벤트당 비용을 계산할 수 없다.
- **KPI의 의미를 고려한다.** 계산할 수 없는 지표를 임의의 숫자로 채우면 분석 결과가 왜곡될 수 있다.

## 8. 오늘의 핵심 정리

- `isna()` : 셀별 결측값 확인
- `isna().sum()` : 열별 결측값 개수 계산
- `df[df["열"].isna()]` : 특정 열에 결측값이 있는 행 추출
- `where()` : 조건을 만족하는 값만 계산에 사용
- `round(2)` : 소수점 둘째 자리까지 반올림해 표시

## 9. 완료 체크리스트

- [ ] `isna()`로 결측값 확인
- [ ] `isna().sum()`으로 열별 결측값 개수 확인
- [ ] `cost`가 결측값인 행을 `missing_cost`에 저장
- [ ] 핵심 이벤트율 계산
- [ ] 이벤트가 0건인 경우를 고려해 이벤트당 비용 계산
- [ ] 필요한 열만 선택해 결과 출력
- [ ] 결측값과 실제 0의 차이 이해