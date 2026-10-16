# Pandas Day 10: DateTime Handling

## 1. 학습 목표

이번 학습에서는 Pandas에서 날짜 데이터를 처리하고, 날짜를 기준으로 마케팅 성과를 분석하는 방법을 익혔다.

- `pd.to_datetime()`으로 날짜 문자열 변환하기
- `.dt.year`, `.dt.month`, `.dt.day`로 날짜 요소 추출하기
- 날짜 조건을 활용해 특정 기간의 데이터 필터링하기
- `groupby()`와 `sum()`으로 월별 성과 집계하기
- `errors="coerce"`로 잘못된 날짜 처리하기

## 2. 날짜 데이터의 중요성

마케팅 데이터에는 날짜별 세션, 클릭, 전환 등 시간에 따라 변하는 지표가 포함된다.

날짜 데이터를 올바르게 처리하면 다음과 같은 분석을 수행할 수 있다.

- 날짜별 캠페인 성과 비교
- 특정 기간의 데이터 추출
- 월별 세션과 핵심 이벤트 집계
- 요일별 마케팅 성과 비교

## 3. 실습 데이터 만들기

```python
import pandas as pd

data = {
    "date": [
        "2026-10-01",
        "2026-10-02",
        "2026-10-03",
        "2026-11-01",
        "2026-11-02",
        "날짜 미상"
    ],
    "campaign": [
        "민사_A",
        "민사_A",
        "민사_B",
        "민사_A",
        "민사_B",
        "민사_C"
    ],
    "sessions": [1000, 1200, 900, 1500, 1100, 500],
    "key_events": [120, 144, 99, 180, 121, 50]
}

df = pd.DataFrame(data)

df
```

`date` 컬럼에는 날짜 문자열과 날짜로 변환할 수 없는 문자열이 함께 포함되어 있다.

## 4. 날짜 타입으로 변환하기

### 날짜 변환하기

```python
df["date"] = pd.to_datetime(
    df["date"],
    errors="coerce"
)
```

`pd.to_datetime()`은 날짜 문자열을 Pandas의 날짜·시간 타입으로 변환한다.

`errors="coerce"`를 사용하면 날짜로 변환할 수 없는 값은 `NaT`로 처리된다.

### 데이터 타입 확인하기

```python
df.dtypes
```

정상적으로 변환되었다면 `date` 컬럼은 일반적으로 `datetime64[ns]` 타입으로 표시된다.

### 날짜 변환이 되지 않을 때 확인할 사항

```python
print(df["date"].dtype)
print(df["date"])
```

- 날짜 변환 셀을 먼저 실행했는지 확인한다.
- `df["date"]`를 문자열로 다시 덮어쓰지 않았는지 확인한다.
- `date` 컬럼이 실제 날짜 타입인지 확인한다.

날짜 요소를 추출하기 전에 날짜 변환이 완료되어야 한다.

## 5. 날짜에서 연도·월·일 추출하기

날짜 타입으로 변환한 컬럼에는 `.dt` 접근자를 사용할 수 있다.

```python
df["year"] = df["date"].dt.year
df["month"] = df["date"].dt.month
df["day"] = df["date"].dt.day

df[["date", "year", "month", "day"]]
```

| 코드 | 의미 |
|---|---|
| `df["date"].dt.year` | 연도 추출 |
| `df["date"].dt.month` | 월 추출 |
| `df["date"].dt.day` | 일 추출 |
| `df["date"].dt.dayofweek` | 요일 추출 |

요일은 월요일이 `0`, 일요일이 `6`으로 표시된다.

날짜가 `NaT`인 행은 연도·월·일도 결측치로 표시된다.

## 6. 특정 기간의 데이터 필터링하기

### 2026년 10월 데이터 추출하기

```python
october_df = df[
    (df["date"] >= "2026-10-01")
    & (df["date"] < "2026-11-01")
]

october_df[
    ["date", "campaign", "sessions", "key_events"]
]
```

이 코드는 2026년 10월 1일부터 10월 31일까지의 데이터를 추출한다.

종료일을 다음 달 1일 미만으로 지정하면 월별 기간을 구분하기 편리하다.

## 7. 월별 마케팅 성과 집계하기

### 월 컬럼 만들기

```python
df["month"] = df["date"].dt.month
```

### 월별 세션 합계

```python
monthly_sessions = (
    df.dropna(subset=["date"])
      .groupby("month")["sessions"]
      .sum()
)

monthly_sessions
```

예상 결과:

```text
month
10    3100
11    2600
Name: sessions, dtype: int64
```

`dropna(subset=["date"])`는 날짜가 없는 행을 월별 집계에서 제외한다.

### 월별 세션과 핵심 이벤트 합계

```python
monthly_performance = (
    df.dropna(subset=["date"])
      .groupby("month")[["sessions", "key_events"]]
      .sum()
)

monthly_performance
```

예상 결과:

| month | sessions | key_events |
|---:|---:|---:|
| 10 | 3100 | 363 |
| 11 | 2600 | 301 |

월별로 세션과 핵심 이벤트 규모를 비교할 수 있다.

## 8. 날짜 변환 오류 처리하기

```python
dates = pd.Series([
    "2026-10-01",
    "2026-10-02",
    "날짜 미상"
])

converted_dates = pd.to_datetime(
    dates,
    errors="coerce"
)

converted_dates
```

숫자형 데이터의 결측치는 일반적으로 `NaN`, 날짜·시간 데이터의 결측치는 `NaT`로 표시된다.

변환 후 결측치 개수도 확인할 수 있다.

```python
converted_dates.isna().sum()
```

## 9. 최종 미션

### 미션 목표

- `date`를 날짜 타입으로 변환한다.
- 변환할 수 없는 날짜는 `NaT`로 처리한다.
- `month` 컬럼을 만든다.
- 날짜가 없는 행을 제외한다.
- 월별 `sessions`와 `key_events` 합계를 계산한다.

### 최종 코드

```python
df["date"] = pd.to_datetime(
    df["date"],
    errors="coerce"
)

df["month"] = df["date"].dt.month

monthly_performance = (
    df.dropna(subset=["date"])
      .groupby("month")[["sessions", "key_events"]]
      .sum()
)

print(monthly_performance)
```

## 10. 자주 하는 실수

- 날짜 문자열을 변환하지 않고 `.dt`를 사용하기
- 날짜 변환 셀을 실행하기 전에 날짜 요소를 추출하기
- `df["date"]`를 문자열로 다시 덮어쓰기
- 기간 필터링에서 `&`를 사용할 때 괄호를 빠뜨리기
- 날짜가 없는 행을 월별 집계에 포함하려고 하기
- 날짜 변환 후 데이터 타입을 확인하지 않기

## 11. 완료 체크리스트

- [ ] `pd.to_datetime()`으로 날짜를 변환할 수 있다.
- [ ] `.dt.year`, `.dt.month`, `.dt.day`를 사용할 수 있다.
- [ ] 날짜 조건으로 특정 기간의 데이터를 필터링할 수 있다.
- [ ] `groupby()`와 `sum()`으로 월별 성과를 집계할 수 있다.
- [ ] `errors="coerce"`와 `NaT`의 의미를 설명할 수 있다.
- [ ] 날짜 변환 오류가 발생했을 때 데이터 타입과 실행 순서를 확인할 수 있다.