# Pandas Day16: Merging Marketing Data with Pandas

## 1. 학습 목표

- `pd.merge()`를 사용해 서로 다른 DataFrame 결합하기
- `on`으로 공통 기준 열 지정하기
- `how`로 결합 방식 선택하기
- 결합한 데이터로 마케팅 KPI 계산하기
- 결측값이 발생하는 이유 이해하기

## 2. 실습 데이터

광고 성과와 광고비가 별도의 DataFrame에 저장되어 있다고 가정한다.

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
```

- `performance`: 캠페인별 세션과 핵심 이벤트 데이터
- `cost_data`: 캠페인별 광고비 데이터
- `campaign`: 두 DataFrame을 연결하는 공통 기준 열

## 3. `merge()` 기본 구조

```python
pd.merge(
    left,
    right,
    on="campaign",
    how="inner"
)
```

| 인자 | 의미 |
|---|---|
| `left` | 왼쪽 DataFrame |
| `right` | 오른쪽 DataFrame |
| `on` | 두 DataFrame의 공통 기준 열 |
| `how` | 결합 후 유지할 행을 결정하는 방식 |

## 4. 결합 방식 비교

### 4-1. `inner`: 양쪽에 모두 존재하는 캠페인

```python
inner_result = pd.merge(
    performance,
    cost_data,
    on="campaign",
    how="inner"
)
```

- 양쪽에 모두 존재하는 캠페인만 유지한다.
- 결과에는 `민사_A`, `민사_B`가 남는다.
- 한쪽에만 있는 캠페인은 제외된다.

### 4-2. `left`: 왼쪽 DataFrame의 모든 캠페인 유지

```python
left_merged = pd.merge(
    performance,
    cost_data,
    on="campaign",
    how="left"
)
```

- 왼쪽 DataFrame인 `performance`의 모든 캠페인을 유지한다.
- `민사_C`는 남지만, 대응하는 광고비가 없어 `cost`가 `NaN`으로 표시된다.

### 4-3. `right`: 오른쪽 DataFrame의 모든 캠페인 유지

```python
right_result = pd.merge(
    performance,
    cost_data,
    on="campaign",
    how="right"
)
```

- 오른쪽 DataFrame인 `cost_data`의 모든 캠페인을 유지한다.
- `민사_D`도 결과에 포함되지만 성과 데이터는 결측값으로 표시된다.

### 4-4. `outer`: 양쪽의 모든 캠페인 유지

```python
outer_result = pd.merge(
    performance,
    cost_data,
    on="campaign",
    how="outer"
)
```

- 어느 한쪽에만 존재하는 캠페인도 유지한다.
- `민사_A`, `민사_B`, `민사_C`, `민사_D`가 모두 포함된다.
- 대응하는 데이터가 없는 열에는 `NaN`이 생긴다.

## 5. 결합 데이터로 KPI 계산하기

### 5-1. 핵심 이벤트율

전체 세션 중 핵심 이벤트가 발생한 비율을 백분율로 계산한다.

```python
left_merged["key_event_rate"] = (
    left_merged["key_events"]
    / left_merged["sessions"] * 100
)
```

### 5-2. 이벤트당 비용

핵심 이벤트 1건당 사용한 비용을 계산한다.

```python
left_merged["cost_per_event"] = (
    left_merged["cost"]
    / left_merged["key_events"]
)
```

### 5-3. 필요한 열만 출력하기

```python
print(
    left_merged[
        [
            "campaign",
            "sessions",
            "key_events",
            "cost",
            "key_event_rate",
            "cost_per_event"
        ]
    ].round(2)
)
```

## 6. 예상 결과

| campaign | sessions | key_events | cost | key_event_rate | cost_per_event |
|---|---:|---:|---:|---:|---:|
| 민사_A | 1000 | 120 | 50000 | 12.00 | 416.67 |
| 민사_B | 700 | 105 | 35000 | 15.00 | 333.33 |
| 민사_C | 1200 | 150 | NaN | 12.50 | NaN |

`민사_C`의 광고비가 없으므로 이벤트당 비용도 계산할 수 없다.

## 7. 실무에서 주의할 점

- **결합 기준 확인:** 캠페인 이름에 공백이나 표기 차이가 있으면 데이터가 매칭되지 않을 수 있다.
- **중복 키 확인:** 양쪽 DataFrame에 같은 캠페인이 여러 번 등장하면 결합 결과의 행 수가 늘어날 수 있다.
- **결측값 구분:** `NaN`은 데이터가 없다는 뜻이며, 실제 비용이 0이라는 뜻은 아니다.
- **결합 방식 선택:** 분석 목적에 따라 `inner`, `left`, `right`, `outer` 중 적절한 방식을 선택한다.
- **KPI 해석:** 이벤트당 비용이 낮거나 이벤트율이 높다는 이유만으로 캠페인의 전체 성과가 좋다고 단정하지 않는다. 매출, 전환 가치, 고객 품질 등도 함께 고려한다.

## 8. 오늘의 핵심 정리

- `pd.merge()`는 공통 기준을 이용해 DataFrame을 결합한다.
- `on="campaign"`은 결합 기준 열을 지정한다.
- `how="left"`는 왼쪽 DataFrame의 모든 행을 유지한다.
- 결합 후에는 KPI를 계산해 캠페인별 성과를 비교할 수 있다.
- 결측값은 원인을 확인한 뒤 적절하게 처리해야 한다.

## 9. 완료 체크리스트

- [ ] `pd.merge()`의 기본 구조 이해
- [ ] `on`과 `how`의 역할 이해
- [ ] `inner`, `left`, `right`, `outer`의 차이 이해
- [ ] `left` 방식으로 성과 데이터와 광고비 데이터 결합
- [ ] 핵심 이벤트율과 이벤트당 비용 계산
- [ ] 결측값의 의미 확인
- [ ] 필요한 열만 선택해 결과 출력
