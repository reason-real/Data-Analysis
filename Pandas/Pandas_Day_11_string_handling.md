# Pandas Day11: String Handling

## 학습 목표

- Pandas의 `.str` 접근자를 사용해 문자열 데이터를 처리한다.
- 앞뒤 공백을 제거하고 대소문자를 통일한다.
- 특정 문자열을 포함하거나 특정 문자열로 시작하는 행을 필터링한다.
- 정리한 데이터를 원래 DataFrame에 반영하고 결과를 확인한다.

## 1. 실습 데이터 준비

```python
import pandas as pd

data = {
    "platform": ["Naver", " naver ", "GOOGLE", "Google", None],
    "campaign": ["민사_A", " 민사_B ", "BRAND_C", "brand_D", "민사_E"],
    "sessions": [1000, 700, 1200, 800, 500]
}

df = pd.DataFrame(data)

df
```

문자열 데이터에 공백이나 대소문자 차이가 있는지 확인한다.

```python
print(df["platform"].unique())
print(df["campaign"].unique())
```

## 2. 앞뒤 공백 제거하기

`str.strip()`은 문자열의 앞뒤 공백을 제거한다.

```python
df["platform"] = df["platform"].str.strip()
df["campaign"] = df["campaign"].str.strip()

df
```

문자열 중간에 있는 공백은 제거하지 않는다.

## 3. 대소문자 통일하기

`str.lower()`는 문자열을 소문자로 바꾼다.

```python
df["platform"] = df["platform"].str.lower()

df
```

`Naver`, ` naver `처럼 서로 다르게 기록된 매체명을 동일한 기준으로 정리할 수 있다.

## 4. 특정 문자열이 포함된 행 찾기

`str.contains()`는 문자열에 특정 값이 포함되어 있는지 확인한다.

```python
brand_df = df[
    df["campaign"].str.contains("brand", case=False, na=False)
]

brand_df
```

- `case=False`: 대소문자를 구분하지 않는다.
- `na=False`: 결측값은 조건에 맞지 않는 것으로 처리한다.

## 5. 특정 문자열로 시작하는 행 찾기

`str.startswith()`는 문자열이 특정 값으로 시작하는지 확인한다.

```python
civil_df = df[
    df["campaign"].str.startswith("민사", na=False)
]

civil_df
```

마케팅 캠페인을 유형별로 구분할 때 활용할 수 있다.

## 6. 문자열 치환하기

`str.replace()`는 문자열의 일부를 다른 문자열로 바꾼다.

```python
df["campaign"] = df["campaign"].str.replace(
    "BRAND",
    "brand",
    regex=False
)

df
```

`regex=False`는 정규표현식이 아닌 일반 문자열을 기준으로 치환한다는 의미다.

## 7. 최종 미션

### 미션 목표

매체명과 캠페인명을 정리한 뒤 `brand`가 포함된 캠페인만 조회한다.

### 해결 코드

```python
df["platform"] = df["platform"].str.strip()
df["campaign"] = df["campaign"].str.strip()

df["platform"] = df["platform"].str.lower()

brand_df = df[
    df["campaign"].str.contains("brand", case=False, na=False)
]

result = brand_df[["campaign", "platform", "sessions"]]

print(result)
print("결과 행 개수:", len(result))
```

### 예상 결과

```text
  campaign platform  sessions
2   BRAND_C   google      1200
3   brand_D   google       800

결과 행 개수: 2
```

## 8. 실습 중 발생한 오류와 해결

### 문자열 메서드 앞의 점 누락

잘못된 코드:

```python
df["platform"] str.strip()
```

수정 코드:

```python
df["platform"].str.strip()
```

문자열 메서드를 사용할 때는 `.str` 접근자와 메서드 사이의 점을 빠뜨리지 않는다.

### 열 이름 오타

잘못된 코드:

```python
df["platfrom"] = df["platform"].str.strip()
df["campagin"] = df["campaign"].str.strip()
```

수정 코드:

```python
df["platform"] = df["platform"].str.strip()
df["campaign"] = df["campaign"].str.strip()
```

열 이름을 잘못 입력하면 원하지 않는 새 열이 생기거나 후속 분석에서 오류가 발생할 수 있다.

### 정리한 값을 다른 열 이름에 저장

데이터를 정리할 때는 원래 열에 다시 저장해야 이후 필터링에서도 정리된 값을 사용할 수 있다.

```python
df["campaign"] = df["campaign"].str.strip()
```

## 9. 핵심 요약

| 메서드 | 기능 |
|---|---|
| `.str.strip()` | 문자열 앞뒤 공백 제거 |
| `.str.lower()` | 소문자로 변환 |
| `.str.upper()` | 대문자로 변환 |
| `.str.contains()` | 특정 문자열 포함 여부 확인 |
| `.str.startswith()` | 특정 문자열로 시작하는지 확인 |
| `.str.replace()` | 문자열 치환 |

문자열 전처리의 기본 흐름은 **값 확인 → 공백 제거 → 대소문자 통일 → 조건 필터링 → 결과 검증**이다.

## 10. 마케팅 데이터 분석 활용

매체명이나 캠페인명이 일관되지 않으면 같은 캠페인이 여러 항목으로 집계될 수 있다. 문자열 전처리는 캠페인별 성과를 정확하게 비교하기 위한 기초 작업이다.

다만, 실제 분석에서는 대소문자나 공백 차이가 단순한 표기 오류인지 먼저 확인해야 한다. 이름이 비슷하더라도 서로 다른 캠페인일 수 있으므로 무조건 통합하지 않는다.

## 체크리스트

- [ ] `.str.strip()`으로 앞뒤 공백을 제거할 수 있다.
- [ ] `.str.lower()`로 대소문자를 통일할 수 있다.
- [ ] `.str.contains()`로 특정 캠페인을 찾을 수 있다.
- [ ] `case=False`, `na=False`의 역할을 설명할 수 있다.
- [ ] 정리한 결과를 원래 열에 저장하고 결과 행 개수를 확인할 수 있다.
