# Day3 - Python 조건문 (if, elif, else)

## 📌 학습 목표

- `if`문의 기본 구조를 이해한다.
- `if`, `elif`, `else`를 활용하여 조건에 따라 다른 결과를 실행할 수 있다.
- 광고 데이터의 지표를 기준으로 성과를 판단하는 조건문을 작성할 수 있다.
- 변수 → 계산 → 비교 → 조건문으로 이어지는 Python의 기본적인 분석 흐름을 이해한다.

---

## 📚 핵심 문법

### 1. `if` 기본 구조

조건이 `True`이면 들여쓰기된 코드가 실행된다.

```python
sessions = 1000

if sessions >= 500:
    print("High Traffic")
```

- `if` → 조건을 확인한다.
- 조건이 `True`이면 내부 코드가 실행된다.
- Python에서는 조건문 내부에 들어가는 코드에 **들여쓰기**가 필요하다.

---

### 2. `if` + `else`

조건이 참일 때와 거짓일 때 서로 다른 코드를 실행할 수 있다.

```python
sessions = 300

if sessions >= 500:
    print("유입량 충분")
else:
    print("유입량 부족")
```

- 조건이 `True` → `유입량 충분`
- 조건이 `False` → `유입량 부족`

---

### 3. `if` + `elif` + `else`

조건이 여러 단계로 나뉘는 경우 `elif`를 사용할 수 있다.

```python
key_event_rate = 12

if key_event_rate >= 15:
    print("우수")
elif key_event_rate >= 10:
    print("양호")
elif key_event_rate >= 5:
    print("보통")
else:
    print("개선 필요")
```

조건은 위에서부터 순서대로 확인된다.

- 15% 이상 → 우수
- 10% 이상 → 양호
- 5% 이상 → 보통
- 그 외 → 개선 필요

따라서 `key_event_rate = 12`라면 `"양호"`가 출력된다.

---

## 📊 광고 데이터에 조건문 적용

### 4. 주요 이벤트율 계산 후 성과 판단

Day31에서 배운 변수와 계산식을 조건문과 연결할 수 있다.

```python
campaign = "민사_A"
sessions = 1000
key_events = 120

key_event_rate = key_events / sessions * 100

if key_event_rate >= 10:
    print("양호")
else:
    print("개선 필요")
```

주요 이벤트율을 계산한 후 비교 연산자를 사용하여 성과 기준을 판단한다.

---

### 5. 성과 등급 만들기

여러 단계의 성과 기준을 만들 수 있다.

```python
key_event_rate = 12

if key_event_rate >= 15:
    performance = "우수"
elif key_event_rate >= 10:
    performance = "양호"
elif key_event_rate >= 5:
    performance = "보통"
else:
    performance = "개선 필요"

print(performance)
```

`key_event_rate = 12`이므로 결과는 다음과 같다.

```text
양호
```

---

## 💡 핵심 개념

| 문법 | 역할 |
| --- | --- |
| `if` | 조건이 참인지 확인 |
| `elif` | 앞의 조건이 거짓일 때 다른 조건 확인 |
| `else` | 모든 조건이 거짓일 때 실행 |
| `>=` | 이상 |
| `>` | 초과 |
| `<` | 미만 |
| `<=` | 이하 |
| `==` | 같은지 비교 |
| `!=` | 다른지 비교 |

---

## 🔗 Day1 → Day2 → Day3 연결

Python 학습이 다음과 같은 흐름으로 연결되고 있다.

```text
변수
↓
데이터 저장
↓
계산
↓
비교 연산자
↓
True / False
↓
if / elif / else
↓
조건에 따른 결과 실행
```

예를 들어 광고 데이터를 분석하면 다음과 같은 구조가 된다.

```python
sessions = 1000
key_events = 120

key_event_rate = key_events / sessions * 100

if key_event_rate >= 15:
    performance = "우수"
elif key_event_rate >= 10:
    performance = "양호"
elif key_event_rate >= 5:
    performance = "보통"
else:
    performance = "개선 필요"

print(key_event_rate)
print(performance)
```

즉, Python에서는 데이터를 단순히 계산하는 것에서 끝나는 것이 아니라 **계산한 결과를 기준으로 데이터를 판단하고 분류하는 것**까지 할 수 있다.

---

## 📝 오늘 배운 점

- `if`는 조건에 따라 특정 코드를 실행할 때 사용한다.
- `else`는 조건이 거짓일 때 실행된다.
- `elif`를 사용하면 여러 조건을 단계적으로 판단할 수 있다.
- 변수에 저장된 값을 계산하고 비교한 뒤 조건문으로 연결할 수 있다.
- 광고 분석에서는 주요 이벤트율 같은 지표를 기준으로 캠페인의 성과 등급을 분류할 수 있다.
- Python의 들여쓰기는 조건문에서 매우 중요하다.

---

## 🎯 오늘의 핵심 문장

> **변수에 저장된 데이터를 계산하고, 비교 연산자로 판단한 결과를 조건문으로 연결하면 데이터에 의미를 부여할 수 있다.**

---

## 📚 학습 키워드

`if` `elif` `else` `True` `False` `>=` `>` `<` `<=` `==` `!=` `조건문` `성과 판단` `주요 이벤트율`