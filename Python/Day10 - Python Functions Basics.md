# Day10 - Python Functions Basics

## 📌 학습 목표

- Python에서 함수가 무엇인지 이해한다.
- `def`를 사용하여 함수를 정의할 수 있다.
- 함수를 호출하고 실행할 수 있다.
- 매개변수와 `return`의 역할을 이해한다.
- 광고 데이터 분석에서 함수를 활용할 수 있다.

---

## 📚 핵심 이론

### 1. 함수란?

함수는 특정 작업을 하나의 이름으로 만들어 필요할 때마다 다시 사용하는 기능이다.

예를 들어 주요 이벤트율을 계산하는 작업을 함수로 만들 수 있다.

```python
def calculate_rate(sessions, key_events):
    return key_events / sessions * 100
```

- `def` : 함수를 정의할 때 사용하는 키워드
- `calculate_rate` : 함수 이름
- `sessions`, `key_events` : 함수에 전달할 값
- `return` : 계산 결과를 함수 밖으로 반환

---

### 2. 함수 정의와 함수 호출

함수를 정의했다고 바로 실행되는 것은 아니다.

```python
def greet():
    print("Hello Python")
```

위 코드는 `greet`이라는 함수를 만드는 것이다.

실제로 실행하려면 함수를 호출해야 한다.

```python
greet()
```

- `greet` : 함수 자체
- `greet()` : 함수를 실행

---

### 3. 매개변수

함수에 데이터를 전달할 수도 있다.

```python
def add_numbers(a, b):
    return a + b

result = add_numbers(10, 20)

print(result)
```

실행 과정:

```text
a = 10
b = 20
10 + 20
↓
30
```

결과:

```text
30
```

---

### 4. `return`

`return`은 함수에서 계산한 결과를 함수 밖으로 돌려주는 역할을 한다.

```python
def calculate_rate(sessions, key_events):
    return key_events / sessions * 100

rate = calculate_rate(1000, 120)

print(rate)
```

결과:

```text
12.0
```

---

## 📊 광고 데이터 분석에 함수 적용하기

### 1. 주요 이벤트율 계산 함수

```python
def calculate_rate(sessions, key_events):
    return key_events / sessions * 100
```

함수를 만들어두면 여러 캠페인에 같은 계산을 반복해서 적용할 수 있다.

```python
rate_a = calculate_rate(1000, 120)
rate_b = calculate_rate(700, 105)
rate_c = calculate_rate(500, 80)

print(rate_a)
print(rate_b)
print(rate_c)
```

결과:

```text
12.0
15.0
16.0
```

---

### 2. 성과 등급 판단 함수

```python
def get_grade(rate):
    if rate >= 15:
        return "우수"
    elif rate >= 10:
        return "양호"
    else:
        return "개선 필요"
```

함수를 사용하면 이벤트율에 따라 성과 등급을 자동으로 판단할 수 있다.

```python
print(get_grade(12))
print(get_grade(15))
print(get_grade(7))
```

결과:

```text
양호
우수
개선 필요
```

---

### 3. 함수 연결하기

계산 함수와 등급 판단 함수를 연결할 수도 있다.

```python
def calculate_rate(sessions, key_events):
    return key_events / sessions * 100


def get_grade(rate):
    if rate >= 15:
        return "우수"
    elif rate >= 10:
        return "양호"
    else:
        return "개선 필요"


rate = calculate_rate(1000, 120)
grade = get_grade(rate)

print(rate)
print(grade)
```

결과:

```text
12.0
양호
```

분석 흐름은 다음과 같다.

```text
세션 + 주요 이벤트
↓
calculate_rate()
↓
주요 이벤트율
↓
get_grade()
↓
성과 등급
```

---

## 📝 문제 풀이

### 문제 1

다음 함수가 무엇을 하는지 설명하시오.

```python
def greet():
    print("Hello Python")
```

**답:**

`greet`이라는 함수를 만들고, 함수를 실행하면 `"Hello Python"`을 출력한다.

---

### 문제 2

다음 함수를 실행하려면 어떻게 작성해야 하는가?

```python
def greet():
    print("Hello Python")
```

**답:**

```python
greet()
```

---

### 문제 3

다음 코드의 결과를 예상하시오.

```python
def add_numbers(a, b):
    return a + b

result = add_numbers(10, 20)

print(result)
```

**답:**

`a`에는 `10`, `b`에는 `20`이 들어간다.

`10 + 20`을 계산한 결과인 `30`이 반환되므로 최종적으로 `30`이 출력된다.

---

### 문제 4

세션과 주요 이벤트를 받아 주요 이벤트율을 계산하는 함수를 완성하시오.

```python
def calculate_rate(sessions, key_events):
    return key_events / sessions * 100
```

**답:**

```python
def calculate_rate(sessions, key_events):
    return key_events / sessions * 100
```

---

### 문제 5

다음 코드의 결과를 생각해보자.

```python
rate_a = calculate_rate(1000, 120)
rate_b = calculate_rate(700, 105)
rate_c = calculate_rate(500, 80)

print(rate_a)
print(rate_b)
print(rate_c)
```

**답:**

결과는 다음과 같다.

```text
12.0
15.0
16.0
```

같은 주요 이벤트율 계산식을 함수로 만들어두고, 서로 다른 데이터를 함수에 전달했기 때문에 각 데이터에 동일한 계산을 반복해서 적용할 수 있다.

---

### 문제 6

다음 코드의 결과를 예상하시오.

```python
print(get_grade(12))
print(get_grade(15))
print(get_grade(7))
```

기준:

```text
15% 이상 → 우수
10% 이상 → 양호
그 외 → 개선 필요
```

**답:**

```text
양호
우수
개선 필요
```

---

### 문제 7

다음 두 함수를 연결한 결과를 예상하시오.

```python
rate = calculate_rate(1000, 120)
grade = get_grade(rate)

print(rate)
print(grade)
```

**답:**

```text
12.0
양호
```

먼저 `calculate_rate()`가 주요 이벤트율 `12.0`을 계산하고, 그 결과를 `get_grade()`에 전달하여 `"양호"`라는 등급을 반환한다.

---

## 🏆 Day10 Challenge

다음 데이터를 사용하자.

```python
campaign = "민사_A"
sessions = 1000
key_events = 120
```

목표:

```text
민사_A : 12.0% : 양호
```

### 문제 8

`calculate_rate()`와 `get_grade()`를 활용하여 위 결과를 출력하는 코드를 작성하시오.

**답:**

```python
def calculate_rate(sessions, key_events):
    return key_events / sessions * 100


def get_grade(rate):
    if rate >= 15:
        return "우수"
    elif rate >= 10:
        return "양호"
    else:
        return "개선 필요"


rate = calculate_rate(sessions, key_events)
grade = get_grade(rate)

print(campaign, ":", str(rate) + "%", ":", grade)
```

결과:

```text
민사_A : 12.0% : 양호
```

---

### 문제 9

캠페인이 1개일 때는 직접 계산해도 되지만, 캠페인이 1,000개라면 함수가 왜 유용할까?

**답:**

같은 분석 수식을 반복해서 작성하지 않고 함수를 한 번 만들어두면 여러 데이터에 같은 분석 로직을 반복해서 적용할 수 있다.

또한 분석 기준이나 계산식을 수정해야 할 때 함수 하나만 수정하면 되기 때문에 코드 관리도 편리하다.

---

## 💡 핵심 개념

| 문법 | 역할 |
| --- | --- |
| `def` | 함수 정의 |
| 함수 이름 | 특정 작업을 나타냄 |
| 매개변수 | 함수에 전달하는 데이터 |
| `return` | 계산 결과를 반환 |
| `함수()` | 함수를 호출하여 실행 |

---

## 📌 오늘의 분석 흐름

```text
데이터
↓
함수에 전달
↓
계산
↓
return
↓
분석 결과
↓
다른 함수에 전달
↓
조건 판단
↓
최종 분석 결과
```

---

## 🎯 Day10에서 기억할 것

- 함수는 반복해서 사용하는 작업을 하나의 이름으로 묶는 기능이다.
- `def`를 사용하여 함수를 만든다.
- `()`를 사용하여 함수를 호출한다.
- 매개변수를 통해 함수에 데이터를 전달한다.
- `return`을 사용하여 결과를 반환한다.
- 데이터 분석에서는 같은 계산과 판단을 여러 데이터에 반복 적용할 때 함수가 유용하다.
- Python 자체를 깊게 공부하기보다 광고 데이터 분석에 필요한 함수를 활용하는 것을 목표로 한다.

---

## 📚 학습 키워드

`def` `function` `parameter` `return` `함수 호출` `재사용` `데이터 분석`