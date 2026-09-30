# Pandas Day 07: Missing Data Handling

## 1. Learning Objectives

이번 학습에서는 데이터 분석에서 자주 발생하는 결측치를 확인하고 처리하는 방법을 익힌다.

- 결측치의 의미 이해하기
- 결측치의 개수와 위치 확인하기
- 결측치가 있는 행 추출하기
- `dropna()`로 결측치가 있는 행 제거하기
- `fillna()`로 결측치 채우기
- 분석 목적에 맞게 결측치 처리 방법 선택하기

## 2. What Is Missing Data?

결측치(Missing Data)는 데이터가 비어 있거나 관측되지 않은 상태를 의미한다.

Pandas에서는 일반적으로 `NaN`으로 표시한다.

```python
import pandas as pd

data = {
    "platform": ["Naver", "Naver", "Google", "Google", "Kakao"],
    "campaign": ["민사_A", "민사_B", "민사_C", "민사_D", "민사_E"],
    "sessions": [1000, 700, None, 800, 500],
    "key_events": [120, 105, 150, None, 60]
}

df = pd.DataFrame(data)
```

`None`은 Pandas에서 숫자형 데이터의 결측치인 `NaN`으로 처리될 수 있다.

### Important: Missing Value vs. Zero

- 결측치: 값이 기록되지 않았거나 확인되지 않은 상태
- 0: 실제 값이 0인 상태

결측치를 무조건 0으로 바꾸면 실제 데이터의 의미가 달라질 수 있다.

예를 들어 세션 데이터가 누락된 경우, 해당 캠페인의 세션이 0이었다고 단정할 수 없다.

## 3. Detect Missing Values

### Check Missing Values

```python
df.isna()
```

각 셀의 결측치 여부를 확인한다. 결측치이면 `True`, 아니면 `False`가 반환된다.

### Count Missing Values in a Column

```python
df["sessions"].isna().sum()
```

`sessions` 컬럼의 결측치 개수를 확인한다.

### Count Missing Values in All Columns

```python
df.isna().sum()
```

각 컬럼에 결측치가 몇 개 있는지 확인한다.

`isnull()`도 `isna()`와 같은 목적으로 사용할 수 있다.

## 4. Select Rows with Missing Values

### Select Rows with Missing Sessions

```python
df[df["sessions"].isna()]
```

`sessions` 컬럼에 결측치가 있는 행만 추출한다.

### Select Rows without Missing Sessions

```python
df[df["sessions"].notna()]
```

`sessions` 컬럼에 결측치가 없는 행만 추출한다.

## 5. Remove Missing Values

### Remove Rows Containing Missing Values

```python
df.dropna()
```

결측치가 하나라도 있는 행을 제거한 새로운 DataFrame을 반환한다.

### Remove Rows with Missing Sessions Only

```python
df.dropna(subset=["sessions"])
```

`sessions` 컬럼에 결측치가 있는 행만 제거한다.

다른 컬럼의 결측치는 제거 기준에 포함하지 않는다.

### Save the Result

```python
df_clean = df.dropna(subset=["sessions"])
```

정리한 결과를 새로운 변수에 저장한다.

기본적으로 원본 `df` 자체가 변경되는 것은 아니다.

## 6. Fill Missing Values

### Fill with Zero

```python
df["sessions"].fillna(0)
```

`sessions` 컬럼의 결측치를 0으로 채운다.

단, 결측치가 실제로 0을 의미하는 경우에만 적절하다.

### Fill with the Mean

```python
df["sessions"].fillna(df["sessions"].mean())
```

`sessions` 컬럼의 결측치를 해당 컬럼의 평균으로 채운다.

평균 대체는 데이터 분포를 왜곡할 수 있으므로, 실제 분석에서는 대체 이유와 영향을 확인해야 한다.

### Save the Filled Values

```python
df["sessions"] = df["sessions"].fillna(0)
```

결측치를 채운 결과를 원본 DataFrame의 `sessions` 컬럼에 다시 저장한다.

이 코드는 `df`를 직접 변경한다.

## 7. Practical Analysis Workflow

마케팅 캠페인 데이터를 분석할 때는 다음 순서로 접근한다.

1. 결측치가 있는 컬럼을 확인한다.
2. 결측치가 발생한 행과 개수를 확인한다.
3. 결측치가 발생한 이유와 분석 목적을 검토한다.
4. 행 제거 또는 값 대체 여부를 결정한다.
5. 처리 후 데이터의 행 개수와 값을 확인한다.

예를 들어 세션 수가 없는 캠페인의 전환율을 계산하면 결과를 신뢰하기 어려울 수 있다. 이 경우 세션 수가 누락된 행을 분석에서 제외할지, 원본 데이터를 다시 확인할지 판단해야 한다.

## 8. Common Mistakes

- `NaN`을 무조건 0으로 바꾸기
- `dropna()`가 모든 상황에서 적절하다고 생각하기
- 특정 컬럼만 확인해야 하는데 `subset`을 사용하지 않기
- `fillna()`의 결과를 저장하지 않아 변경 사항이 반영되지 않기
- 결측치가 있는 행을 제거한 뒤 데이터가 얼마나 줄었는지 확인하지 않기

## 9. Final Mission

다음 조건에 맞게 데이터를 정리한다.

- `sessions`가 결측치인 행을 제거한다.
- 남아 있는 행의 `key_events` 결측치는 0으로 채운다.
- `campaign`, `sessions`, `key_events` 컬럼만 출력한다.
- 원본과 정리 후 데이터의 행 개수를 비교한다.

```python
result = df.dropna(subset=["sessions"]).copy()

result["key_events"] = result["key_events"].fillna(0)

print(result[["campaign", "sessions", "key_events"]])
print("원본 행 개수:", len(df))
print("정리 후 행 개수:", len(result))
```

## 10. Completion Checklist

- [ ] `isna()`와 `notna()`의 차이를 이해했다.
- [ ] `isna().sum()`으로 결측치 개수를 확인할 수 있다.
- [ ] `dropna()`와 `subset`을 활용할 수 있다.
- [ ] `fillna()`로 결측치를 채울 수 있다.
- [ ] 결측치를 0으로 채울 때 주의해야 하는 이유를 설명할 수 있다.
- [ ] 처리 전후의 행 개수를 비교할 수 있다.