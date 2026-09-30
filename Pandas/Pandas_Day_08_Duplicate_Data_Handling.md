# Pandas Day08 — Duplicate Data Handling

## 1. Learning Objectives

이번 학습에서는 Pandas를 활용해 중복 데이터를 확인하고 처리하는 방법을 익힌다.

- `duplicated()`로 중복 행 확인하기
- `duplicated().sum()`으로 중복 행 개수 확인하기
- `drop_duplicates()`로 중복 행 제거하기
- `subset`으로 특정 컬럼을 기준으로 중복 판단하기
- 마케팅 데이터에서 중복 제거 시 주의할 점 이해하기

## 2. What Is Duplicate Data?

중복 데이터란 동일한 데이터가 두 번 이상 기록된 상태를 의미한다.

예를 들어 다음 데이터에서 첫 번째 행과 네 번째 행은 모든 컬럼의 값이 동일하다.

```python
import pandas as pd

data = {
    "platform": ["Naver", "Naver", "Google", "Naver", "Kakao"],
    "campaign": ["민사_A", "민사_B", "민사_C", "민사_A", "민사_E"],
    "sessions": [1000, 700, 1200, 1000, 500],
    "key_events": [120, 105, 150, 120, 60]
}

df = pd.DataFrame(data)
df
```

중복 데이터가 잘못 포함되면 캠페인 성과나 이벤트 수가 실제보다 크게 계산될 수 있다.

단, 값이 같다는 이유만으로 항상 중복이라고 단정해서는 안 된다. 날짜나 데이터 집계 기준이 다르면 유효한 별도 기록일 수 있다.

## 3. Detect Duplicate Rows

### 3.1 Using `duplicated()`

`duplicated()`는 중복 여부를 `True` 또는 `False`로 반환한다.

```python
df.duplicated()
```

- `False`: 기본 설정에서 중복으로 표시되지 않은 행
- `True`: 앞에서 등장한 행과 중복되는 행

기본적으로 모든 컬럼의 값이 같은지 비교하며, 먼저 등장한 행은 중복으로 표시하지 않는다.

### 3.2 Count Duplicate Rows

```python
df.duplicated().sum()
```

결과:

```text
1
```

중복으로 표시된 행이 1개라는 의미다.

### 3.3 Display Duplicate Rows

```python
df[df.duplicated()]
```

중복으로 표시된 행만 확인할 수 있다.

## 4. Remove Duplicate Rows

### 4.1 Using `drop_duplicates()`

```python
df.drop_duplicates()
```

중복 행을 제거한 DataFrame을 반환한다. 기본 설정에서는 먼저 등장한 행을 유지한다.

원본 데이터를 유지하면서 결과를 별도 변수에 저장할 수 있다.

```python
clean_df = df.drop_duplicates()
```

### 4.2 Compare Row Counts

```python
print("Original rows:", len(df))
print("Cleaned rows:", len(clean_df))
```

예상 결과:

```text
Original rows: 5
Cleaned rows: 4
```

`df.drop_duplicates()`는 기본적으로 원본 `df` 자체를 변경하지 않는다. 따라서 정리한 결과를 계속 사용하려면 변수에 저장해야 한다.

## 5. Detect Duplicates Based on Specific Columns

### 5.1 Single Column

캠페인 이름을 기준으로 중복 여부를 확인할 수 있다.

```python
df.duplicated(subset=["campaign"])
```

특정 컬럼을 기준으로 중복 행을 확인한다.

```python
df[df.duplicated(subset=["campaign"])]
```

### 5.2 Multiple Columns

플랫폼과 캠페인의 조합을 기준으로 중복 여부를 확인할 수 있다.

```python
df.duplicated(subset=["platform", "campaign"])
```

`subset`에 지정한 컬럼들의 조합이 이전 행과 같으면 중복으로 표시한다.

### 5.3 Remove Duplicates Based on Specific Columns

```python
campaign_clean = df.drop_duplicates(subset=["campaign"])
```

캠페인 이름이 같은 행 중 먼저 등장한 행을 유지한다.

주의: 캠페인 이름이 같아도 날짜, 매체, 집계 기준이 다르면 서로 다른 데이터일 수 있다. 실제 업무에서는 데이터의 고유 기준을 먼저 확인해야 한다.

## 6. The `keep` Parameter

`duplicated()`와 `drop_duplicates()`에는 `keep` 옵션이 있다.

| 옵션 | 의미 |
|---|---|
| `"first"` | 첫 번째 행을 유지하거나 중복으로 표시하지 않음 |
| `"last"` | 마지막 행을 유지하거나 중복으로 표시하지 않음 |
| `False` | 중복 그룹에 속한 모든 행을 중복으로 표시하거나 제거 |

예시:

```python
df.duplicated(keep=False)
```

중복 그룹에 속한 첫 번째 행과 반복된 행을 모두 `True`로 표시한다.

```python
df.drop_duplicates(keep=False)
```

중복 그룹에 속한 행을 모두 제거한다.

## 7. Practical Considerations for Marketing Data

중복 데이터를 발견했다고 무조건 삭제해서는 안 된다.

예를 들어 다음 데이터는 캠페인과 세션 수가 같지만 날짜가 다르다.

| date | campaign | sessions |
|---|---|---:|
| 2026-09-28 | 민사_A | 1000 |
| 2026-09-29 | 민사_A | 1000 |

날짜별 데이터라면 두 행 모두 유효할 수 있다.

중복 제거 전 다음 항목을 확인한다.

- 행 하나가 무엇을 의미하는가?
- 어떤 컬럼의 조합이 고유해야 하는가?
- 중복이 수집 과정에서 발생했는가?
- 제거하면 유효한 기록까지 사라지지 않는가?

핵심은 **중복 여부를 확인하는 것과 실제로 제거하는 것은 별개의 판단**이라는 점이다.

## 8. Colab Practice

### Step 1. Import Pandas and Create DataFrame

```python
import pandas as pd

data = {
    "platform": ["Naver", "Naver", "Google", "Naver", "Kakao"],
    "campaign": ["민사_A", "민사_B", "민사_C", "민사_A", "민사_E"],
    "sessions": [1000, 700, 1200, 1000, 500],
    "key_events": [120, 105, 150, 120, 60]
}

df = pd.DataFrame(data)

df
```

### Step 2. Detect Duplicates

```python
df.duplicated()
```

### Step 3. Count Duplicates

```python
df.duplicated().sum()
```

### Step 4. Display Duplicate Rows

```python
df[df.duplicated()]
```

### Step 5. Remove Duplicates

```python
clean_df = df.drop_duplicates()

clean_df
```

### Step 6. Compare Row Counts

```python
print("Original rows:", len(df))
print("Cleaned rows:", len(clean_df))
```

### Step 7. Use `subset`

```python
df.duplicated(subset=["campaign"])
```

```python
df.duplicated(subset=["platform", "campaign"])
```

## 9. Final Mission

### Mission

마케팅 데이터에서 중복 기록을 확인하고 정리한다.

1. 전체 데이터의 중복 행 개수를 확인한다.
2. 중복 행을 제거하고 `clean_df`에 저장한다.
3. 정리된 데이터에서 `platform`, `campaign`, `sessions` 컬럼만 출력한다.
4. 원본과 정리 후 행 개수를 비교한다.

### Solution

```python
duplicate_count = df.duplicated().sum()

clean_df = df.drop_duplicates()

print(clean_df[["platform", "campaign", "sessions"]])

print("Duplicate rows:", duplicate_count)
print("Original rows:", len(df))
print("Cleaned rows:", len(clean_df))
```

예상 결과:

```text
Duplicate rows: 1
Original rows: 5
Cleaned rows: 4
```

## 10. Common Mistakes

### Mistake 1. Using the wrong method name

```python
df.duplicate()
```

위 코드는 올바른 메서드명이 아니다.

```python
df.duplicated()
```

### Mistake 2. Expecting the original DataFrame to change

```python
df.drop_duplicates()
```

이 코드는 결과를 반환하지만 기본적으로 원본 `df`를 변경하지 않는다.

```python
clean_df = df.drop_duplicates()
```

결과를 별도 변수에 저장하면 이후 분석에 사용할 수 있다.

### Mistake 3. Removing duplicates using an inappropriate key

```python
df.drop_duplicates(subset=["campaign"])
```

캠페인 이름만 기준으로 제거하면 날짜별 또는 매체별 데이터가 사라질 수 있다. 제거 전에 행의 의미와 고유 기준을 확인해야 한다.

## 11. Key Takeaways

| Method | Purpose |
|---|---|
| `duplicated()` | 중복 여부 확인 |
| `duplicated().sum()` | 중복 행 개수 확인 |
| `df[df.duplicated()]` | 중복으로 표시된 행 추출 |
| `drop_duplicates()` | 중복 행 제거 |
| `subset=[...]` | 특정 컬럼을 기준으로 중복 판단 |
| `keep="first"` | 첫 번째 행 유지 |
| `keep="last"` | 마지막 행 유지 |
| `keep=False` | 중복 그룹의 모든 행을 중복으로 처리 |

## 12. Completion Checklist

- [ ] `duplicated()`를 사용해 중복 여부를 확인했다.
- [ ] `duplicated().sum()`으로 중복 개수를 구했다.
- [ ] `drop_duplicates()`로 중복 행을 제거했다.
- [ ] `subset`으로 특정 컬럼 기준의 중복을 확인했다.
- [ ] 원본과 정리된 DataFrame의 행 개수를 비교했다.
- [ ] 중복 행을 무조건 제거하면 안 되는 이유를 설명할 수 있다.