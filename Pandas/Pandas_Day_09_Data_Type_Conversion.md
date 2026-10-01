# Pandas Day 09: Data Type Conversion

## 1. 학습 목표

이번 학습에서는 Pandas에서 데이터 타입을 확인하고 변환하는 방법을 익혔다.

- `dtypes`로 컬럼별 데이터 타입 확인하기
- `astype()`으로 데이터 타입 변환하기
- `pd.to_numeric()`으로 숫자형 데이터 변환하기
- `errors="coerce"`로 변환할 수 없는 값을 결측치로 처리하기
- 변환 결과와 결측치 개수 검증하기

## 2. 데이터 타입이란?

데이터 타입(Data Type)은 데이터가 어떤 종류의 값인지 나타내는 정보다.

| 데이터 타입 | 의미 | 예시 |
|---|---|---|
| `int64` | 정수형 | 세션 수 1000 |
| `float64` | 실수형 | 전환율 12.5 |
| `object` | 문자열 등 다양한 객체 | `"Naver"`, `"50000"` |
| `bool` | 참 또는 거짓 | `True`, `False` |
| `datetime64` | 날짜와 시간 | 날짜 데이터 |

숫자처럼 보이는 값이라도 문자열로 저장되어 있다면 숫자 계산이 예상과 다르게 동작할 수 있다.

따라서 합계나 평균을 계산하기 전에 데이터 타입을 확인해야 한다.

## 3. 실습 데이터 만들기

```python
import pandas as pd

data = {
    "campaign": ["민사_A", "민사_B", "민사_C", "민사_D"],
    "sessions": [1000, 700, 1200, 800],
    "cost": ["50000", "35000", "60000", "확인 필요"],
    "key_events": [120, 105, 150, 72]
}

df = pd.DataFrame(data)

df
```

`cost` 컬럼에는 숫자로 변환할 수 있는 문자열과 변환할 수 없는 문자열이 함께 있다.

## 4. 데이터 타입 확인하기

### 전체 컬럼 확인하기

```python
df.dtypes
```

`dtypes`는 각 컬럼의 데이터 타입을 보여 준다.

이 데이터에서 `cost`는 문자열이 포함되어 있으므로 `object` 타입으로 표시된다.

### 특정 컬럼 확인하기

```python
df["cost"].dtype
```

특정 컬럼의 데이터 타입만 확인할 때는 `dtype`을 사용한다.

## 5. astype()으로 데이터 타입 변환하기

### 실수형으로 변환하기

```python
df["sessions"] = df["sessions"].astype(float)

df.dtypes
```

`astype(float)`은 `sessions` 컬럼을 실수형으로 변환한다.

변환 결과를 원본 DataFrame에 반영하려면 다시 컬럼에 할당해야 한다.

```python
df["sessions"] = df["sessions"].astype(float)
```

### 주의할 점

`astype()`은 모든 값이 지정한 타입으로 변환 가능해야 한다. 변환할 수 없는 값이 있으면 오류가 발생할 수 있다.

또한 정수형으로 변환할 때 소수점이 있는 값은 소수 부분이 버려질 수 있으므로 주의한다.

## 6. pd.to_numeric()으로 숫자형 변환하기

### 숫자형으로 변환하기

```python
df["cost"] = pd.to_numeric(df["cost"])
```

숫자로 변환할 수 없는 값이 있으면 오류가 발생할 수 있다.

### 변환할 수 없는 값을 결측치로 처리하기

```python
df["cost"] = pd.to_numeric(
    df["cost"],
    errors="coerce"
)
```

`errors="coerce"`를 사용하면 숫자로 변환할 수 없는 값이 `NaN`으로 바뀐다.

이 예제에서는 `"확인 필요"`가 `NaN`으로 변환된다.

단, 변환 불가능한 값을 결측치로 바꾸는 것만으로 데이터 문제가 해결되는 것은 아니다. 실제 분석에서는 해당 값이 왜 잘못되었는지 확인할 필요가 있다.

## 7. 결측치 확인하기

### 결측치 개수 확인하기

```python
df["cost"].isna().sum()
```

`isna()`는 결측치인 위치를 `True`로 표시한다.

`sum()`을 함께 사용하면 `True`의 개수를 계산하므로 결측치 개수를 확인할 수 있다.

이 예제의 `cost`에는 결측치가 1개 있다.

### 결측치가 있는 행 확인하기

```python
df[df["cost"].isna()]
```

결측치가 있는 행을 직접 확인할 수 있다.

## 8. 숫자형 데이터 분석하기

### 광고비 합계

```python
df["cost"].sum()
```

예상 결과:

```text
145000.0
```

### 광고비 평균

```python
df["cost"].mean()
```

예상 결과:

```text
48333.333333333336
```

Pandas는 기본적으로 합계와 평균을 계산할 때 `NaN`을 제외한다.

하지만 결측치가 실제로 0을 의미하는 것은 아니므로, 분석 목적에 맞게 처리 방법을 결정해야 한다.

## 9. 특정 컬럼 선택하기

### 여러 컬럼 선택하기

```python
df[["campaign", "sessions", "cost"]]
```

여러 컬럼을 선택할 때는 컬럼 이름들을 리스트로 묶어 전달한다.

`df["campaign"]`은 단일 컬럼을 선택하고, `df[["campaign", "sessions", "cost"]]`는 여러 컬럼으로 구성된 DataFrame을 반환한다.

### 변수와 컬럼 이름의 차이

```python
print(campaign, sessions, cost)
```

위 코드는 `campaign`, `sessions`, `cost`라는 변수를 찾는다. 해당 변수를 별도로 만들지 않았다면 `NameError`가 발생한다.

DataFrame 안에 있는 컬럼을 선택하려면 다음처럼 작성한다.

```python
df[["campaign", "sessions", "cost"]]
```

## 10. 최종 미션

### 미션 목표

다음 조건을 만족하는 코드를 작성한다.

- `sessions`를 실수형으로 변환한다.
- `cost`를 숫자형으로 변환한다.
- 숫자로 변환할 수 없는 값은 `NaN`으로 처리한다.
- `cost`의 결측치 개수를 출력한다.
- `cost`의 합계를 출력한다.
- `campaign`, `sessions`, `cost` 컬럼만 출력한다.

### 최종 코드

```python
df["sessions"] = df["sessions"].astype(float)

df["cost"] = pd.to_numeric(
    df["cost"],
    errors="coerce"
)

print("cost 결측치 개수:", df["cost"].isna().sum())
print("cost 합계:", df["cost"].sum())

print(df[["campaign", "sessions", "cost"]])
```

### 예상 결과

```text
cost 결측치 개수: 1
cost 합계: 145000.0
```

마지막 출력에는 4개 캠페인의 `campaign`, `sessions`, `cost` 컬럼이 표시된다. `민사_D`의 `cost` 값은 `NaN`으로 나타난다.

## 11. 자주 하는 실수

- `df.dtypes` 대신 존재하지 않는 메서드를 사용하기
- `astype()`으로 변환할 수 없는 문자열까지 변환하려고 하기
- `errors="coerce"`를 사용한 뒤 결측치 확인을 생략하기
- `df["cost"].sum`처럼 메서드 호출에 괄호를 빠뜨리기
- `print(campaign, sessions, cost)`처럼 DataFrame 컬럼을 독립 변수로 착각하기
- 변환한 결과를 컬럼에 다시 할당하지 않기

## 12. 완료 체크리스트

- [ ] `df.dtypes`와 `df["cost"].dtype`의 차이를 이해했다.
- [ ] `astype()`으로 데이터 타입을 변환할 수 있다.
- [ ] `pd.to_numeric()`을 사용할 수 있다.
- [ ] `errors="coerce"`의 역할을 설명할 수 있다.
- [ ] `isna().sum()`으로 결측치 개수를 확인할 수 있다.
- [ ] DataFrame에서 여러 컬럼을 선택할 수 있다.
- [ ] 변환 후 합계와 평균을 계산할 수 있다.