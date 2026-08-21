# Day09 - append()로 분석 결과 저장하기

## 📌 학습 목표

- `append()`를 사용하여 리스트에 데이터를 추가할 수 있다.
- 반복문을 이용하여 계산 결과를 리스트에 저장할 수 있다.
- `for`, `range()`, 인덱스, `if / elif / else`를 함께 사용할 수 있다.
- `print()`와 `append()`의 차이를 이해한다.
- 광고 캠페인 데이터를 계산하고 분석 결과를 저장하는 흐름을 이해한다.

---

## 📚 핵심 개념

### 1. `append()`로 리스트에 값 추가하기

`append()`는 리스트의 가장 뒤에 값을 하나 추가하는 함수이다.

```python
numbers = []

numbers.append(10)
numbers.append(20)
numbers.append(30)

print(numbers)
```

결과:

```text
[10, 20, 30]
```

- `print()` → 결과를 화면에 보여준다.
- `append()` → 결과를 리스트에 저장한다.

---

### 2. `for`문과 `append()` 함께 사용하기

반복문을 이용하여 여러 값을 하나씩 리스트에 저장할 수 있다.

```python
rates = [12, 15, 16]

results = []

for rate in rates:
    results.append(rate)

print(results)
```

결과:

```text
[12, 15, 16]
```

기본적인 구조는 다음과 같다.

```python
results = []

for value in data:
    results.append(value)
```

즉,

```text
빈 리스트 생성
↓
for문으로 데이터를 하나씩 가져오기
↓
append()로 결과 저장
```

---

### 3. 계산 결과를 리스트에 저장하기

광고 분석에서는 계산한 결과를 나중에 다시 사용해야 하는 경우가 많다.

예를 들어 각 캠페인의 주요 이벤트율을 계산하고 리스트에 저장할 수 있다.

```python
campaigns = ["민사_A", "민사_B", "민사_C"]
sessions = [1000, 700, 500]
key_events = [120, 105, 80]

key_event_rates = []

for i in range(3):
    key_event_rate = key_events[i] / sessions[i] * 100
    key_event_rates.append(key_event_rate)

print(key_event_rates)
```

결과:

```text
[12.0, 15.0, 16.0]
```

여기서 중요한 차이:

- `key_event_rate` → 계산된 **하나의 값**
- `key_event_rates` → 계산된 값들을 모아놓은 **리스트**

---

## 🟡 조건에 맞는 결과만 저장하기

`if`문과 `append()`를 함께 사용하면 조건을 만족하는 데이터만 새로운 리스트에 저장할 수 있다.

```python
key_event_rates = [12, 8, 15, 4]

qualified_rates = []

for rate in key_event_rates:
    if rate >= 10:
        qualified_rates.append(rate)

print(qualified_rates)
```

결과:

```text
[12, 15]
```

분석 과정은 다음과 같다.

```text
전체 데이터
↓
for문으로 하나씩 확인
↓
조건 판단
↓
조건을 만족하면 append()
↓
새로운 분석 결과 리스트 생성
```

---

## 🔴 성과 등급을 리스트에 저장하기

이번에는 숫자가 아니라 `if / elif / else`의 판단 결과를 리스트에 저장해보자.

기준:

- 15% 이상 → 우수
- 10% 이상 → 양호
- 그 외 → 개선 필요

```python
campaigns = ["민사_A", "민사_B", "민사_C", "민사_D"]
key_event_rates = [12, 8, 15, 4]

performance_grades = []

for i in range(4):
    if key_event_rates[i] >= 15:
        performance_grades.append("우수")
    elif key_event_rates[i] >= 10:
        performance_grades.append("양호")
    else:
        performance_grades.append("개선 필요")

print(performance_grades)
```

결과:

```text
["양호", "개선 필요", "우수", "개선 필요"]
```

즉, 숫자를 조건에 따라 분석한 뒤 **분석 결과 자체를 리스트에 저장**할 수 있다.

---

## 🟢 캠페인과 분석 결과 연결하기

저장된 결과는 나중에 다시 사용할 수 있다.

```python
campaigns = ["민사_A", "민사_B", "민사_C", "민사_D"]
performance_grades = ["양호", "개선 필요", "우수", "개선 필요"]

for i in range(4):
    print(campaigns[i], performance_grades[i])
```

결과:

```text
민사_A 양호
민사_B 개선 필요
민사_C 우수
민사_D 개선 필요
```

---

## 💡 `print()`와 `append()`의 차이

| 기능 | 역할 |
|---|---|
| `print()` | 결과를 화면에 보여준다. |
| `append()` | 결과를 리스트에 저장한다. |

예를 들어:

```python
print(rate)
```

는 현재 결과를 **보여주는 것**이다.

반면,

```python
results.append(rate)
```

는 현재 결과를 **나중에 사용할 수 있도록 저장하는 것**이다.

---

## 🏆 Day09 Challenge

실제 광고 분석 상황이라고 생각해보자.

다음 데이터를 가지고 캠페인별 주요 이벤트율과 성과 등급을 만들어보자.

```python
campaigns = ["민사_A", "민사_B", "민사_C", "민사_D"]
sessions = [1000, 700, 500, 300]
key_events = [120, 105, 80, 20]

key_event_rates = []
performance_grades = []

for i in range(4):
    key_event_rate = key_events[i] / sessions[i] * 100
    key_event_rates.append(key_event_rate)

    if key_event_rate >= 15:
        performance_grades.append("우수")
    elif key_event_rate >= 10:
        performance_grades.append("양호")
    else:
        performance_grades.append("개선 필요")

print(key_event_rates)
print(performance_grades)
```

결과:

```text
[12.0, 15.0, 16.0, 6.666666666666667]
["양호", "우수", "우수", "개선 필요"]
```

---

## 📌 오늘의 핵심 정리

- `append()`는 리스트에 값을 추가한다.
- 빈 리스트를 만들어 분석 결과를 하나씩 저장할 수 있다.
- `for`문을 이용하면 여러 데이터를 반복해서 처리할 수 있다.
- `if / elif / else`를 이용하면 데이터를 조건에 따라 분류할 수 있다.
- `print()`는 결과를 보여주는 것이고, `append()`는 결과를 저장하는 것이다.
- 저장된 분석 결과는 이후 추가적인 분석에 다시 사용할 수 있다.

---

## 📚 학습 키워드

`append()` `list` `for` `range()` `index` `if` `elif` `else` `데이터 분석`

---