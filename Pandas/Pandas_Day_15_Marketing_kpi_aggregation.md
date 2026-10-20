# Pandas Day15: Marketing KPI Aggregation by Platform

## 1. 학습 목표

- `groupby()`와 `agg()`를 사용해 플랫폼별 마케팅 지표 집계하기
- 핵심 이벤트율(`key_event_rate`) 계산하기
- 이벤트당 비용(`cost_per_event`) 계산하기
- 핵심 이벤트율 기준으로 결과 정렬하기

## 2. 실습 데이터

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

## 3. 플랫폼별 지표 집계

`groupby()`로 플랫폼별 데이터를 묶고, `agg()`로 각 지표의 합계를 계산한다.

```python
result = df.groupby("platform").agg({
    "sessions": "sum",
    "key_events": "sum",
    "cost": "sum"
})

print(result)
```

## 4. 핵심 KPI 계산

### 핵심 이벤트율

전체 세션 중 핵심 이벤트가 발생한 비율을 백분율로 계산한다.

```python
result["key_event_rate"] = (
    result["key_events"] / result["sessions"] * 100
)
```

### 이벤트당 비용

핵심 이벤트 1건을 얻는 데 사용한 평균 비용을 계산한다.

```python
result["cost_per_event"] = (
    result["cost"] / result["key_events"]
)
```

## 5. 핵심 이벤트율 기준 정렬 및 출력

`sort_values()`에 `ascending=False`를 지정하면 핵심 이벤트율이 높은 플랫폼부터 확인할 수 있다.

```python
result = result.sort_values(
    "key_event_rate",
    ascending=False
)

print(result.round(2))
```

## 6. 예상 결과

| platform | sessions | key_events | cost | key_event_rate | cost_per_event |
|---|---:|---:|---:|---:|---:|
| Naver | 1700 | 225 | 85000 | 13.24 | 377.78 |
| Kakao | 500 | 60 | 25000 | 12.00 | 416.67 |
| Google | 2000 | 222 | 100000 | 11.10 | 450.45 |

## 7. 실무 해석

- **Naver:** 핵심 이벤트율이 가장 높고 이벤트당 비용이 가장 낮다.
- **Kakao:** 핵심 이벤트율은 두 번째로 높지만 Naver보다 이벤트당 비용이 높다.
- **Google:** 세션 규모가 가장 크지만, 세 플랫폼 중 핵심 이벤트율이 가장 낮고 이벤트당 비용이 가장 높다.

단, 이 지표만으로 광고 예산을 바로 결정하지는 않는다. 전환의 가치, 매출, 고객 품질, 캠페인 목적 등을 함께 확인해야 한다.

## 8. 오늘의 핵심 정리

- `groupby()` : 그룹별로 데이터를 묶는다.
- `agg()` : 그룹별 합계, 평균, 최댓값 등 여러 지표를 집계한다.
- 파생 KPI : 집계된 결과를 이용해 비율과 비용 지표를 계산한다.
- `sort_values()` : 특정 지표를 기준으로 결과를 정렬한다.
- `round(2)` : 숫자를 소수점 둘째 자리까지 표시한다.

## 9. 완료 체크리스트

- [ ] 플랫폼별 세션·핵심 이벤트·비용 합계 계산
- [ ] 핵심 이벤트율 계산
- [ ] 이벤트당 비용 계산
- [ ] 핵심 이벤트율 내림차순 정렬
- [ ] 결과를 소수점 둘째 자리까지 표시
- [ ] KPI를 바탕으로 플랫폼별 차이 해석