# Day06 - Python for문과 반복 데이터 분석

## 📌 학습 목표

- `for`문을 활용하여 리스트의 데이터를 하나씩 처리할 수 있다.
- 반복문과 조건문을 함께 사용할 수 있다.
- 반복되는 광고 데이터를 계산하고 판단하는 구조를 이해한다.
- 여러 리스트의 데이터를 연결해야 하는 문제를 이해한다.
- `for`문이 데이터 분석에서 왜 필요한지 이해한다.

---

## 📚 핵심 문법

### 1. `for`문으로 리스트의 데이터 하나씩 가져오기

```python
sessions = [1000, 700, 500]

for session in sessions:
    print(session)
```

`for`문은 리스트에 있는 값을 처음부터 하나씩 꺼내서 반복적으로 처리한다.

실행 과정:

```text
첫 번째 반복 → session = 1000
두 번째 반복 → session = 700
세 번째 반복 → session = 500
```

따라서 결과는 다음과 같다.

```text
1000
700
500
```

- `sessions` → 전체 리스트
- `session` → 현재 반복에서 하나씩 가져오는 값
- `for` → 리스트의 값을 차례대로 반복 처리

---

### 2. `for`문을 이용한 데이터 계산

리스트의 값을 하나씩 가져온 뒤 계산할 수도 있다.

```python
numbers = [10, 20, 30]

for number in numbers:
    print(number + 10)
```

결과:

```text
20
30
40
```

즉, `for`문 안에서는 현재 가져온 값에 계산이나 조건을 적용할 수 있다.

---

### 3. `for` + 비교 연산자

반복문과 비교 연산자를 함께 사용하면 여러 데이터를 하나씩 판단할 수 있다.

```python
key_event_rates = [12, 8, 15, 4]

for rate in key_event_rates:
    print(rate >= 10)
```

결과:

```text
True
False
True
False
```

Day02에서 배운 비교 연산자가 각 데이터에 반복적으로 적용되는 것이다.

```text
리스트
↓
for문으로 하나씩 가져오기
↓
비교 연산
↓
True / False
```

---

### 4. `for` + `if`

반복문과 조건문을 함께 사용하면 여러 데이터를 기준에 따라 분류할 수 있다.

```python
sessions = [1000, 300, 700, 400]

for session in sessions:
    if session >= 500:
        print("유입량 충분")
    else:
        print("유입량 부족")
```

결과:

```text
유입량 충분
유입량 부족
유입량 충분
유입량 부족
```

이 구조는 광고 분석에서 여러 캠페인을 하나씩 평가할 때 활용할 수 있다.

---

### 5. `for` + `if / elif / else`

여러 개의 기준으로 데이터를 분류할 수도 있다.

```python
key_event_rates = [12, 8, 15, 4]

for rate in key_event_rates:
    if rate >= 15:
        print("우수")
    elif rate >= 10:
        print("양호")
    elif rate >= 5:
        print("보통")
    else:
        print("개선 필요")
```

결과:

```text
양호
보통
우수
개선 필요
```

---

## 🔍 중요한 개념

### 리스트 전체와 하나의 값은 다르다

다음 두 변수는 서로 다르다.

```python
key_event_rates = [12, 8, 15, 4]
```

→ 여러 값을 가지고 있는 **리스트 전체**

```python
for key_event_rate in key_event_rates:
```

→ 반복할 때마다 리스트에서 하나씩 가져오는 **현재 값**

예를 들어:

```text
첫 번째 반복 → key_event_rate = 12
두 번째 반복 → key_event_rate = 8
세 번째 반복 → key_event_rate = 15
네 번째 반복 → key_event_rate = 4
```

따라서 조건문에서는 현재 값을 의미하는 `key_event_rate`를 사용해야 한다.

```python
for key_event_rate in key_event_rates:
    if key_event_rate >= 10:
        print("성과 기준 충족")
```

---

## ⚠️ 여러 리스트를 연결할 때 생기는 문제

다음과 같은 데이터가 있다고 하자.

```python
sessions = [1000, 700, 500]
key_events = [120, 105, 80]
```

각 데이터는 같은 위치끼리 연결되어 있다.

```text
sessions[0] → 1000
key_events[0] → 120

sessions[1] → 700
key_events[1] → 105

sessions[2] → 500
key_events[2] → 80
```

따라서 주요 이벤트율을 계산하려면 두 리스트의 같은 위치에 있는 값을 연결해야 한다.

현재 배운 `for`문만으로는 이 작업이 조금 불편하다.

이 문제를 해결하기 위해 다음 단계에서 `range()`와 **인덱스(index)**를 배우게 된다.

---

## 📊 광고 데이터 분석과 연결

광고 데이터가 다음과 같이 있다고 하자.

```python
campaigns = ["민사_A", "민사_B", "민사_C"]
sessions = [1000, 700, 500]
key_events = [120, 105, 80]
```

우리가 하고 싶은 분석은 다음과 같다.

```text
캠페인
↓
세션
↓
주요 이벤트
↓
주요 이벤트율 계산
↓
성과 기준 비교
↓
분석 결과 출력
```

캠페인이 3개라면 직접 계산할 수도 있지만, 캠페인이 수백 개 또는 수천 개라면 직접 계산하기 어렵다.

이때 `for`문을 사용하면 같은 분석 작업을 반복적으로 수행할 수 있다.

---

## 💡 분석가 관점에서 이해하기

`for`문 자체가 중요한 것이 아니라,

> **반복되는 데이터에 같은 분석 작업을 적용한다**

는 사고방식이 중요하다.

예를 들어 캠페인이 1개라면:

```python
key_event_rate = key_events / sessions * 100
```

처럼 직접 계산할 수 있다.

하지만 캠페인이 100개라면 각각의 데이터를 일일이 계산하기 어렵다.

`for`문을 사용하면 반복되는 작업을 자동화할 수 있다.

```text
캠페인 1
↓
계산

캠페인 2
↓
계산

캠페인 3
↓
계산

...

캠페인 100
↓
계산
```

이것이 데이터 분석에서 반복문이 필요한 이유다.

---

## 📝 오늘 배운 핵심 정리

```text
for문
→ 리스트의 값을 하나씩 가져온다.

for + 계산
→ 여러 데이터에 같은 계산을 반복한다.

for + 비교 연산자
→ 여러 데이터를 하나씩 판단한다.

for + if
→ 여러 데이터를 조건에 따라 분류한다.

for + if / elif / else
→ 여러 기준에 따라 데이터를 분류한다.

여러 리스트
→ 같은 위치의 데이터를 연결해야 할 수 있다.

range() + 인덱스
→ 여러 리스트의 데이터를 연결할 때 활용할 수 있다.
```

---

## 🎯 Day06 핵심 문장

> **`for`문은 반복되는 데이터에 같은 분석 작업을 적용하기 위한 기본적인 도구이다.**

---

## 📚 학습 키워드

`for` `list` `iteration` `if` `elif` `else` `comparison` `boolean` `index` `range`

---