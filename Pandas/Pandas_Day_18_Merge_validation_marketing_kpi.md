# Pandas Day18: Merging Validation and Marketing KPI Analysis

## 1. 학습 목표

- `pd.merge()`로 성과 데이터와 비용 데이터를 병합한다.
- `indicator=True`로 병합 상태를 확인한다.
- `validate="one_to_one"`으로 병합 키의 고유성을 검증한다.
- 전환율과 이벤트당 비용을 계산한다.
- KPI를 기준으로 캠페인 성과를 비교한다.

## 2. 데이터 병합

마케팅 성과 데이터와 광고비 데이터는 별도로 관리될 수 있다. 캠페인 이름을 기준으로 두 데이터를 병합하면 성과와 비용을 함께 분석할 수 있다.

```python
import pandas as pd

performance = pd.DataFrame({
    "campaign": ["민사_A", "민사_B", "민사_C"],
    "sessions": [1000, 700, 1200],
    "key_events": [120, 105, 150]
})

cost_data = pd.DataFrame({
    "campaign": ["민사_A", "민사_B", "민사_D"],
    "cost": [50000, 35000, 40000]
})

kpi = pd.merge(
    performance,
    cost_data,
    on="campaign",
    how="inner"
)

print(kpi)
```

### 병합 방식

| 방식 | 의미 |
|---|---|
| `inner` | 양쪽에 모두 존재하는 캠페인만 유지 |
| `left` | 왼쪽 데이터의 캠페인을 모두 유지 |
| `right` | 오른쪽 데이터의 캠페인을 모두 유지 |
| `outer` | 양쪽 데이터의 모든 캠페인을 유지 |

이번 KPI 분석에서는 비용과 성과가 모두 있는 캠페인만 비교하기 위해 `inner`를 사용한다.

## 3. 병합 결과 검증

### 3-1. 병합 상태 확인

`indicator=True`를 사용하면 각 행이 어느 데이터에서 왔는지 확인할 수 있다.

```python
merged = pd.merge(
    performance,
    cost_data,
    on="campaign",
    how="outer",
    indicator=True
)

print("행 개수:", len(merged))
print(merged["_merge"].value_counts())
```

- `both`: 양쪽 데이터에 모두 존재
- `left_only`: 왼쪽 데이터에만 존재
- `right_only`: 오른쪽 데이터에만 존재

이 기능은 누락된 캠페인이나 예상하지 못한 병합 결과를 확인할 때 유용하다.

### 3-2. 병합 키 검증

```python
validated = pd.merge(
    performance,
    cost_data,
    on="campaign",
    how="inner",
    validate="one_to_one"
)

print(validated)
```

`validate="one_to_one"`은 양쪽 데이터에서 병합 키가 각각 고유한지 검증한다. 중복 키가 발견되면 오류가 발생한다.

## 4. 마케팅 KPI 계산

### 4-1. 핵심 이벤트 전환율

전환율은 전체 세션 중 핵심 이벤트가 발생한 비율을 의미한다.

공식:

전환율(%) = 핵심 이벤트 수 / 세션 수 × 100

### 4-2. 이벤트당 비용

이벤트당 비용은 핵심 이벤트 한 건을 확보하는 데 지출한 비용이다.

공식:

이벤트당 비용 = 광고비 / 핵심 이벤트 수

### 4-3. KPI 계산 코드

```python
kpi = pd.merge(
    performance,
    cost_data,
    on="campaign",
    how="inner",
    validate="one_to_one"
)

kpi["key_event_rate"] = (
    kpi["key_events"] / kpi["sessions"] * 100
)

kpi["cost_per_event"] = (
    kpi["cost"] / kpi["key_events"]
)

kpi = kpi.sort_values(
    "key_event_rate",
    ascending=False
)

print(kpi)
```

## 5. 분석 결과

| 캠페인 | 세션 | 핵심 이벤트 | 광고비 | 전환율 | 이벤트당 비용 |
|---|---:|---:|---:|---:|---:|
| 민사_B | 700 | 105 | 35,000원 | 15% | 333.33원 |
| 민사_A | 1,000 | 120 | 50,000원 | 12% | 416.67원 |

### 결과 해석

- 민사_B는 민사_A보다 전환율이 높다.
- 민사_B는 이벤트당 비용도 낮다.
- 따라서 현재 데이터에서는 민사_B의 효율이 더 높게 나타난다.

단, 실제 예산 배분을 결정할 때는 전환의 품질, 매출, 고객 가치 등도 함께 고려해야 한다.

## 6. 실무 적용 포인트

- 병합 전후 행 개수와 중복 키를 확인한다.
- 비용 데이터가 없는 캠페인을 성과가 나쁜 캠페인으로 오해하지 않는다.
- 핵심 이벤트 수가 0이면 이벤트당 비용이 계산되지 않도록 처리한다.
- 전환율과 이벤트당 비용을 함께 살펴 성과를 판단한다.
- 분석 결과를 해석할 때 데이터의 한계와 추가 확인 사항을 함께 기록한다.

## 7. 복습 체크리스트

- [ ] `pd.merge()`의 주요 병합 방식을 이해한다.
- [ ] `indicator=True`로 병합 상태를 확인할 수 있다.
- [ ] `validate="one_to_one"`의 목적을 설명할 수 있다.
- [ ] 전환율을 계산할 수 있다.
- [ ] 이벤트당 비용을 계산할 수 있다.
- [ ] KPI 기준으로 캠페인을 정렬하고 결과를 해석할 수 있다.