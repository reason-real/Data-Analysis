# Day4 - Python 논리 연산자와 조건 조합

## 📌 학습 목표

- Python의 논리 연산자 `and`, `or`, `not`의 역할을 이해한다.
- 비교 연산자의 결과인 `True` / `False`를 논리 연산자로 조합할 수 있다.
- 광고 데이터의 여러 지표를 기준으로 조건을 판단할 수 있다.
- `if`, `elif`, `else`와 논리 연산자를 함께 활용할 수 있다.

---

## 📚 핵심 문법

### 1. `and` 연산자

`and`는 **모든 조건이 `True`일 때만 `True`**가 된다.

```python
sessions = 1000
key_events = 120

print(sessions >= 500 and key_events >= 100)
```

결과:

```text
True
```

- `sessions >= 500` → `True`
- `key_events >= 100` → `True`
- `True and True` → `True`

즉,

> `and` → 여러 조건을 모두 만족해야 한다.

---

### 2. `or` 연산자

`or`는 **조건 중 하나라도 `True`이면 `True`**가 된다.

```python
sessions = 300
key_events = 120

print(sessions >= 500 or key_events >= 100)
```

결과:

```text
True
```

- `sessions >= 500` → `False`
- `key_events >= 100` → `True`
- `False or True` → `True`

즉,

> `or` → 여러 조건 중 하나만 만족해도 된다.

---

### 3. `not` 연산자

`not`은 Boolean 값을 **반대로 바꾼다.**

```python
is_active = True

print(not is_active)
```

결과:

```text
False
```

- `True` → `not` → `False`
- `False` → `not` → `True`

즉,

> `not` → 조건의 결과를 반대로 바꾼다.

---

## 📊 논리 연산자 정리

| 연산자 | 의미 | 핵심 |
| --- | --- | --- |
| `and` | 그리고 | 모든 조건이 `True`여야 함 |
| `or` | 또는 | 하나라도 `True`면 됨 |
| `not` | 아니다 | `True`와 `False`를 반대로 변경 |

---

## 📚 광고 데이터에 논리 연산자 적용하기

### 4. 두 가지 성과 조건을 동시에 만족하는지 확인

```python
campaign = "민사_A"
sessions = 1000
key_events = 120

key_event_rate = key_events / sessions * 100

if sessions >= 500 and key_event_rate >= 10:
    print("성과 기준 충족")
```

`and`를 사용하면 다음 두 조건을 **동시에 만족해야 한다.**

- 세션이 500 이상
- 주요 이벤트율이 10% 이상

---

### 5. 하나의 조건만 만족해도 우수 후보로 분류

```python
sessions = 1000
key_events = 120

key_event_rate = key_events / sessions * 100

if sessions >= 2000 or key_event_rate >= 15:
    print("우수 후보")
```

`or`를 사용하면 두 조건 중 **하나만 만족해도 된다.**

---

### 6. `and`를 활용한 성과 기준 판단

```python
sessions = 300
key_events = 80

key_event_rate = key_events / sessions * 100

if sessions >= 500 and key_event_rate >= 10:
    print("성과 기준 충족")
else:
    print("성과 기준 미달")
```

두 조건 중 하나라도 `False`라면 `and` 전체 결과가 `False`가 된다.

---

## 🔴 조건 조합하기

광고 데이터에서는 하나의 지표만 보는 것이 아니라 여러 지표를 함께 사용하여 캠페인을 판단할 수 있다.

예를 들어:

```text
세션 >= 500
그리고
주요 이벤트율 >= 15%
```

라면 우수 캠페인으로 분류할 수 있다.

```python
campaign = "민사_B"
sessions = 700
key_events = 105

key_event_rate = key_events / sessions * 100

if sessions >= 500 and key_event_rate >= 15:
    print("우수 캠페인")
else:
    print("추가 분석 필요")
```

반대로 다음과 같은 조건도 만들 수 있다.

```text
세션 >= 2,000
또는
주요 이벤트율 >= 20%
```

```python
campaign = "민사_C"
sessions = 500
key_events = 100

key_event_rate = key_events / sessions * 100

if sessions >= 2000 or key_event_rate >= 20:
    print("검토 대상")
```

이처럼 논리 연산자를 사용하면 **여러 분석 기준을 하나의 조건으로 조합**할 수 있다.

---

## 🏆 성과 기준을 여러 단계로 분류하기

다음과 같이 광고 성과 기준을 만들 수 있다.

```text
① 세션 >= 500
② 주요 이벤트율 >= 10%

두 조건 모두 만족
→ 기본 성과 충족

둘 중 하나만 만족
→ 추가 검토

둘 다 만족하지 않음
→ 개선 필요
```

Python으로 표현하면:

```python
sessions = 1000
key_events = 120

key_event_rate = key_events / sessions * 100

if sessions >= 500 and key_event_rate >= 10:
    print("기본 성과 충족")
elif sessions >= 500 or key_event_rate >= 10:
    print("추가 검토")
else:
    print("개선 필요")
```

여기서 중요한 점은 첫 번째 `if`에서 이미 **두 조건을 모두 만족하는 경우**를 먼저 처리한다는 것이다.

따라서 `elif`에서는 자연스럽게 **둘 중 하나만 만족하는 경우**를 처리하게 된다.

---

## 🔗 Day3 ~ Day4 학습 흐름

```text
Day32
비교 연산자
↓
>, <, >=, <=, ==, !=
↓
True / False
↓
Day33
if / elif / else
↓
조건에 따른 코드 실행
↓
Day34
and / or / not
↓
여러 조건을 조합
↓
광고 데이터의 성과 기준 판단
```

---

## 💡 핵심 개념

### 비교 연산자

```python
sessions >= 500
```

→ 조건을 비교하여 `True` 또는 `False`를 만든다.

### 논리 연산자

```python
sessions >= 500 and key_event_rate >= 10
```

→ 여러 개의 `True` / `False` 조건을 하나의 조건으로 조합한다.

### 조건문

```python
if sessions >= 500 and key_event_rate >= 10:
    print("성과 기준 충족")
```

→ 조건의 결과에 따라 실제 실행할 코드를 결정한다.

---

## 📝 오늘 배운 점

- `and`는 모든 조건을 만족해야 `True`가 된다.
- `or`는 하나의 조건만 만족해도 `True`가 된다.
- `not`은 Boolean 값을 반대로 변경한다.
- 비교 연산자는 `True` / `False`라는 판단 결과를 만든다.
- 논리 연산자는 여러 판단 결과를 하나의 조건으로 조합한다.
- `if`, `elif`, `else`와 논리 연산자를 함께 사용하면 분석 기준에 따라 데이터를 분류할 수 있다.
- 광고 데이터 분석에서는 여러 지표를 조합하여 캠페인의 성과를 판단할 수 있다.

---

## 📚 학습 키워드

`and` `or` `not` `True` `False` `if` `elif` `else` `비교 연산자` `논리 연산자` `조건문` `광고 데이터 분석`

---

## 🎯 오늘의 핵심 문장

> **비교 연산자가 각각의 판단 기준을 만들고, 논리 연산자는 그 판단 기준들을 조합하여 더 현실적인 분석 조건을 만든다.**