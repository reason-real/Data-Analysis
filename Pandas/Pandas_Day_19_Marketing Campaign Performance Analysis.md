# Pandas Day19: Marketing Campaign Performance Analysis

## 1. 학습 목표

- 플랫폼별 마케팅 성과를 집계한다.
- `groupby()`와 `agg()`를 활용한다.
- 전환율과 이벤트당 비용을 계산한다.
- KPI를 기준으로 플랫폼 성과를 비교한다.
- 분석 결과를 마케팅 인사이트로 연결한다.

## 2. 데이터 준비

```python
import pandas as pd

data = {
    "platform": ["Naver", "Naver", "Google", "Google", "Kakao"],
    "campaign": ["민사_A", "민사_B", "민사_C", "민사_D", "민사_E"],
    "sessions": [1000, 700, 1200, 800, 500],
    "key_events": [120, 105, 150, 72, 60],
    "cost": [50000, 35000, 60000, 40000, 25000]
}

df = pd.DataFrame(data)
```

## 3. 플랫폼별 성과 집계

`groupby()`로 플랫폼별 데이터를 그룹화하고 `agg()`로 주요 지표를 합산한다.

```python
platform_result = df.groupby("platform").agg({
    "sessions": "sum",
    "key_events": "sum",
    "cost": "sum"
})

print(platform_result)
```

### 집계 결과

| 플랫폼 | 세션 | 핵심 이벤트 | 광고비 |
|---|---:|---:|---:|
| Google | 2,000 | 222 | 100,000 |
| Kakao | 500 | 60 | 25,000 |
| Naver | 1,700 | 225 | 85,000 |

## 4. 마케팅 KPI 계산

### 4-1. 핵심 이벤트 전환율

전체 세션 중 핵심 이벤트가 발생한 비율이다.

전환율(%) = 핵심 이벤트 수 / 세션 수 × 100

### 4-2. 이벤트당 비용

핵심 이벤트 한 건을 확보하는 데 사용한 광고비다.

이벤트당 비용 = 광고비 / 핵심 이벤트 수

### 4-3. KPI 계산 코드

```python
platform_result["key_event_rate"] = (
    platform_result["key_events"]
    / platform_result["sessions"] * 100
)

platform_result["cost_per_event"] = (
    platform_result["cost"]
    / platform_result["key_events"]
)

print(platform_result)
```

## 5. 플랫폼별 성과 정렬

전환율이 높은 순서대로 정렬한다.

```python
platform_result = platform_result.sort_values(
    "key_event_rate",
    ascending=False
)

print(platform_result)
```

### 최종 분석 결과

| 플랫폼 | 전환율 | 이벤트당 비용 |
|---|---:|---:|
| Naver | 13.24% | 377.78원 |
| Kakao | 12.00% | 416.67원 |
| Google | 11.10% | 450.45원 |

## 6. 분석 결과 해석

- **Naver:** 전환율이 가장 높고 이벤트당 비용이 가장 낮아 현재 데이터에서 가장 효율적인 플랫폼으로 나타났다.
- **Kakao:** 전환율과 이벤트당 비용 모두 중간 수준이다.
- **Google:** 세션 규모는 가장 크지만 전환율은 가장 낮다. 유입 이후의 전환 과정을 추가로 분석할 필요가 있다.

단, 전환율과 이벤트당 비용만으로 최종 예산을 결정하지 않는다. 매출, 고객 획득 비용(CAC), 고객 생애 가치(LTV), 전환 품질 등도 함께 고려해야 한다.

## 7. 실무 적용 포인트

- 플랫폼별 성과와 캠페인별 성과를 구분해서 분석한다.
- 유입 규모와 전환 효율을 함께 살펴본다.
- 전환율이 높더라도 광고비가 과도하게 높을 수 있으므로 비용 지표를 함께 확인한다.
- 분석 결과를 단순한 숫자 나열이 아닌 의사결정에 활용할 수 있는 문장으로 정리한다.

## 8. 복습 체크리스트

- [ ] `groupby()`로 플랫폼별 데이터를 그룹화할 수 있다.
- [ ] `agg()`로 여러 지표를 동시에 집계할 수 있다.
- [ ] 전환율을 계산할 수 있다.
- [ ] 이벤트당 비용을 계산할 수 있다.
- [ ] `sort_values()`로 성과를 정렬할 수 있다.
- [ ] 분석 결과를 마케팅 관점에서 해석할 수 있다.