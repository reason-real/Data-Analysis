# Day2 - Python 기초 (비교 연산자와 True/False)

## 📌 학습 목표

- Python의 비교 연산자를 이해한다.
- `True`와 `False`의 의미를 이해한다.
- 비교 연산의 결과가 `bool` 자료형이라는 것을 이해한다.
- 광고 데이터에 비교 연산을 적용할 수 있다.
- SQL의 조건식과 Python의 비교 연산을 연결해서 이해한다.

---

## 📚 핵심 문법

### 1. 비교 연산자

Python에서는 두 값을 비교하여 조건을 판단할 수 있다.

| 연산자 | 의미 |
|---|---|
| `==` | 같다 |
| `!=` | 같지 않다 |
| `>` | 크다 |
| `<` | 작다 |
| `>=` | 크거나 같다 |
| `<=` | 작거나 같다 |

---

### 2. `=`와 `==`의 차이

`=`는 값을 변수에 저장할 때 사용한다.

```python
sessions = 1000
```

→ `sessions` 변수에 `1000`을 저장한다.

반면 `==`는 두 값이 같은지 비교할 때 사용한다.

```python
sessions == 1000
```

→ `sessions`가 `1000`과 같은지 판단한다.

즉,

> `=` → 저장  
> `==` → 비교

라는 차이가 있다.

---

### 3. True와 False

비교 연산의 결과는 `True` 또는 `False`가 된다.

```python
sessions = 1000

print(sessions >= 500)
print(sessions < 500)
```

결과:

```text
True
False
```

`1000 >= 500`은 참이므로 `True`가 반환되고,

`1000 < 500`은 거짓이므로 `False`가 반환된다.

---

### 4. bool 자료형

`True`와 `False`는 Python의 `bool` 자료형이다.

```python
is_active = True

print(type(is_active))
```

결과:

```text
<class 'bool'>
```

비교 결과 역시 `bool` 자료형이 된다.

```python
sessions = 1000

is_high_traffic = sessions >= 1000

print(is_high_traffic)
```

결과:

```text
True
```

여기서 `is_high_traffic`에는 `sessions` 자체가 저장되는 것이 아니라,

`sessions >= 1000`이라는 비교 결과인 `True`가 저장된다.

---

### 5. 광고 데이터에 비교 연산 적용

SQL에서 조건을 사용할 때처럼 Python에서도 분석 기준을 만들 수 있다.

```python
campaign = "민사_A"
sessions = 1000
key_events = 120

print(sessions >= 500)
print(key_events >= 100)
print(sessions >= 2000)
```

결과:

```text
True
True
False
```

이를 통해 데이터가 특정 기준을 만족하는지 판단할 수 있다.

---

## 🔗 SQL과 Python 연결

SQL에서는 `WHERE`를 이용하여 조건에 맞는 데이터를 필터링한다.

```sql
SELECT *
FROM ga4_data
WHERE sessions >= 500;
```

Python에서는 비교 연산자를 사용하여 값이 특정 조건을 만족하는지 판단할 수 있다.

```python
sessions = 1000

print(sessions >= 500)
```

SQL과 Python은 문법은 다르지만,

> 특정 기준을 설정하고 데이터가 그 기준을 만족하는지 판단한다.

라는 공통적인 분석 사고방식을 가지고 있다.

---

## 📊 주요 이벤트율 계산과 비교

Day31에서 배운 계산과 Day32의 비교 연산을 연결할 수 있다.

```python
sessions = 700
key_events = 105

key_event_rate = key_events / sessions * 100

print(key_event_rate)
print(key_event_rate >= 10)
```

결과:

```text
15.0
True
```

주요 이벤트율을 먼저 계산한 다음,

`10% 이상인지` 비교하여 `True` 또는 `False`로 판단할 수 있다.

---

### 6. 퍼센트 계산에서 주의할 점

주요 이벤트율은 다음과 같이 계산한다.

```python
key_event_rate = key_events / sessions * 100
```

예를 들어:

```python
sessions = 1000
key_events = 120

key_event_rate = key_events / sessions * 100
```

결과는:

```text
12.0
```

즉, **12%**이다.

비교할 때는 `%` 기호를 직접 작성하지 않고 숫자로 비교한다.

```python
print(key_event_rate >= 10)
```

`10% 이상`을 의미한다.

---

## 📚 핵심 개념

### `=`

변수에 값을 저장한다.

```python
sessions = 1000
```

### `==`

두 값이 같은지 비교한다.

```python
sessions == 1000
```

### `!=`

두 값이 다른지 비교한다.

```python
sessions != 1000
```

### `>`, `<`

크거나 작은지를 비교한다.

```python
sessions > 500
sessions < 500
```

### `>=`, `<=`

이상 또는 이하인지 비교한다.

```python
sessions >= 500
sessions <= 500
```

---

## ⚠️ `>`와 `>=`의 차이

분석 조건에서 자주 발생하는 실수이므로 구분해야 한다.

```python
key_event_rate > 10
```

→ **10% 초과**

```python
key_event_rate >= 10
```

→ **10% 이상**

따라서 문제에서 **"10% 이상"**이라고 표현했다면 `>=`를 사용해야 한다.

---

## 📈 분석가 관점에서 생각하기

비교 연산자는 단순히 숫자의 크기를 비교하는 문법이 아니다.

분석에서는 특정 기준을 정하고 데이터를 판단하는 데 사용할 수 있다.

예:

```python
sessions = 1000
key_events = 120

key_event_rate = key_events / sessions * 100

is_good_campaign = key_event_rate >= 10

print(is_good_campaign)
```

분석 흐름:

```text
원본 데이터
↓
변수에 저장
↓
지표 계산
↓
분석 기준 설정
↓
비교 연산
↓
True / False
↓
데이터 판단
```

---

## 💡 Day32 핵심 정리

```text
비교 연산자
→ 두 값을 비교

비교 결과
→ True 또는 False

True / False
→ bool 자료형

계산식 + 비교 연산
→ 지표를 기준으로 데이터 판단

비교 결과
→ 다음 단계의 조건문(if)에서 활용
```

---

## 🔗 Day31과 Day32의 연결

### Day31

```python
sessions = 1000
key_events = 120

key_event_rate = key_events / sessions * 100

print(key_event_rate)
```

→ 데이터를 저장하고 계산한다.

### Day32

```python
sessions = 1000
key_events = 120

key_event_rate = key_events / sessions * 100

print(key_event_rate >= 10)
```

→ 계산한 지표가 특정 기준을 만족하는지 판단한다.

### 다음 단계

```text
변수
↓
계산
↓
비교
↓
True / False
↓
if
↓
조건에 따라 다른 코드 실행
```

---

## 📝 배운 점

- Python에서 `=`는 값을 저장하고 `==`는 값을 비교한다.
- 비교 연산의 결과는 `True` 또는 `False`로 나타난다.
- `True`와 `False`는 `bool` 자료형이다.
- 계산한 분석 지표에 기준을 적용하여 데이터를 판단할 수 있다.
- `>`는 초과, `>=`는 이상이라는 차이를 정확하게 구분해야 한다.
- Python의 비교 연산은 SQL의 조건식과 비슷한 분석 사고방식으로 연결할 수 있다.
- 비교 연산은 이후 `if` 조건문으로 이어지는 중요한 기초 개념이다.

---

## 🎯 오늘의 핵심 문장

> **비교 연산자는 특정 기준을 설정하고, 데이터가 그 기준을 만족하는지 `True` 또는 `False`로 판단하게 해준다.**

---

## 📚 학습 키워드

`==` `!=` `>` `<` `>=` `<=` `True` `False` `bool` `비교 연산자` `조건 판단` `key_event_rate`