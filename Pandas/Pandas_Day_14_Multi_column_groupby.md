# Pandas Day14 - Multi-Column GroupBy Aggregation

## 학습 목표
- `groupby()`에 두 개 이상의 기준 열을 지정한다.
- 매체와 캠페인 조합별 데이터를 집계한다.
- `agg()`로 여러 지표의 합계를 한 번에 계산한다.
- 그룹화 기준에 따라 분석 결과가 어떻게 달라지는지 이해한다.

## 1. 단일 기준으로 그룹화하기

`groupby()`에 하나의 열을 지정하면 해당 열의 값에 따라 데이터를 그룹화한다.

```python
df.groupby("platform")["sessions"].sum()
```

- `groupby("platform")`: 매체별로 그룹화한다.
- `["sessions"]`: 세션 열을 선택한다.
- `sum()`: 매체별 세션 합계를 계산한다.

## 2. 여러 기준으로 그룹화하기

두 개 이상의 열을 기준으로 그룹화하려면 열 이름을 리스트로 전달한다.

```python
df.groupby(["platform", "campaign"])["sessions"].sum()
```

이 코드는 매체와 캠페인의 조합별 세션 합계를 계산한다.

예를 들어 Naver의 민사_A 캠페인이 여러 행에 나타나면 해당 행들의 세션이 합산된다.

## 3. 여러 열을 함께 집계하기

```python
result = df.groupby(
    ["platform", "campaign"]
).agg({
    "sessions": "sum",
    "key_events": "sum"
})

print(result)
```

- `["platform", "campaign"]`: 그룹화 기준 두 개를 지정한다.
- `"sessions": "sum"`: 그룹별 세션 합계를 계산한다.
- `"key_events": "sum"`: 그룹별 전환 수 합계를 계산한다.
- `result`: 집계 결과를 저장하는 변수다.

## 4. 실습 데이터

```python
import pandas as pd

data = {
    "platform": ["Naver", "Naver", "Naver", "Google", "Google", "Google", "Kakao"],
    "campaign": ["민사_A", "민사_A", "민사_B", "민사_C", "민사_C", "민사_D", "민사_E"],
    "sessions": [1000, 500, 700, 1200, 300, 800, 500],
    "key_events": [120, 60, 105, 150, 30, 72, 60]
}

df = pd.DataFrame(data)

result = df.groupby(
    ["platform", "campaign"]
).agg({
    "sessions": "sum",
    "key_events": "sum"
})

print(result)
```

## 5. 예상 결과

| platform | campaign | sessions | key_events |
|---|---|---:|---:|
| Google | 민사_C | 1500 | 180 |
| Google | 민사_D | 800 | 72 |
| Kakao | 민사_E | 500 | 60 |
| Naver | 민사_A | 1500 | 180 |
| Naver | 민사_B | 700 | 105 |

동일한 매체와 캠페인 조합에 속하는 여러 행이 하나의 그룹으로 합쳐진다.

## 6. 실무 적용

- 매체별 전체 성과 비교
- 캠페인별 유입 및 전환 수 집계
- 매체와 캠페인 조합별 성과 확인
- 성과가 낮은 캠페인이나 추가 분석이 필요한 영역 탐색

분석 목적에 맞는 그룹화 기준을 선택하는 것이 중요하다. 그룹 기준이 많아지면 결과는 더 세분화된다.

## 7. 오늘의 핵심 요약

- `groupby("platform")`: 매체별 그룹화
- `groupby(["platform", "campaign"])`: 매체와 캠페인 조합별 그룹화
- `agg()`를 사용하면 여러 열에 집계 함수를 적용할 수 있다.
- 동일한 그룹에 속하는 여러 행은 지정한 집계 함수에 따라 합쳐진다.

## 8. 학습 체크리스트

- [ ] `groupby()`에 여러 열을 지정할 수 있다.
- [ ] 매체와 캠페인 조합별 세션 합계를 구할 수 있다.
- [ ] `agg()`로 세션과 전환 수를 함께 집계할 수 있다.
- [ ] 단일 기준과 다중 기준 그룹화의 차이를 설명할 수 있다.