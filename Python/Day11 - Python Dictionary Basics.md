# Day11 - Python Dictionary Basics

## 📌 학습 목표

- Dictionary의 `key : value` 구조를 이해한다.
- 리스트의 index와 Dictionary의 key 차이를 이해한다.
- Dictionary에서 원하는 데이터를 가져올 수 있다.
- `for`문과 Dictionary를 함께 사용할 수 있다.
- 함수와 Dictionary를 연결하여 광고 데이터를 분석할 수 있다.

---

## 📚 핵심 이론

### 1. Dictionary란?

Dictionary는 데이터를 `key : value` 형태로 저장하는 자료구조이다.

```python
campaign = {
    "name": "민사_A",
    "sessions": 1000,
    "key_events": 120
}
```

구조는 다음과 같다.

| Key | Value |
|---|---|
| `name` | `"민사_A"` |
| `sessions` | `1000` |
| `key_events` | `120` |

리스트는 순서(index)를 기준으로 데이터를 찾지만, Dictionary는 key의 이름을 이용해서 데이터를 찾는다.

```text
리스트
→ index로 데이터 접근

Dictionary
→ key로 데이터 접근
```

---

### 2. Dictionary에서 데이터 가져오기

```python
print(campaign["name"])
print(campaign["sessions"])
print(campaign["key_events"])
```

결과:

```text
민사_A
1000
120
```

따라서 다음과 같이 이해하면 된다.

```text
campaign["name"]
→ 캠페인 이름

campaign["sessions"]
→ 세션 수

campaign["key_events"]
→ 주요 이벤트 수
```

---

### 3. Dictionary 데이터로 계산하기

Dictionary에서 데이터를 가져와 계산할 수 있다.

```python
campaign = {
    "name": "민사_A",
    "sessions": 1000,
    "key_events": 120
}

key_event_rate = campaign["key_events"] / campaign["sessions"] * 100

print(key_event_rate)
```

결과:

```text
12.0
```

---

### 4. Dictionary + for문

여러 캠페인의 데이터를 Dictionary로 저장할 수 있다.

```python
campaigns = [
    {
        "name": "민사_A",
        "sessions": 1000,
        "key_events": 120
    },
    {
        "name": "민사_B",
        "sessions": 700,
        "key_events": 105
    },
    {
        "name": "민사_C",
        "sessions": 500,
        "key_events": 80
    }
]
```

`for`문으로 캠페인을 하나씩 가져올 수 있다.

```python
for campaign in campaigns:
    print(campaign["name"])
```

결과:

```text
민사_A
민사_B
민사_C
```

---

### 5. Dictionary + for문 + 계산

각 캠페인의 주요 이벤트율도 반복해서 계산할 수 있다.

```python
for campaign in campaigns:
    rate = campaign["key_events"] / campaign["sessions"] * 100
    print(campaign["name"], rate)
```

결과:

```text
민사_A 12.0
민사_B 15.0
민사_C 16.0
```

---

### 6. Dictionary + for문 + 함수

Day40에서 배운 함수를 Dictionary와 연결할 수도 있다.

```python
def calculate_rate(sessions, key_events):
    return key_events / sessions * 100


for campaign in campaigns:
    rate = calculate_rate(
        campaign["sessions"],
        campaign["key_events"]
    )

    print(campaign["name"], rate)
```

이 구조는 앞으로 데이터 분석 코드를 작성할 때 자주 사용하게 된다.

```text
Dictionary
↓
for문
↓
데이터 접근
↓
함수
↓
계산
```

---

## 📝 문제 풀이

### 🟢 Level 1 — Dictionary 기본

### 문제 1. 다음 딕셔너리에서 캠페인 이름을 출력하시오.

```python
campaign = {
    "name": "민사_A",
    "sessions": 1000,
    "key_events": 120
}

print(campaign["name"])
```

**정답:**

```text
민사_A
```

**풀이:**

Dictionary에서는 key를 이용해 데이터를 가져온다.

`name`이라는 key의 value를 가져오기 때문에 `campaign["name"]`을 사용한다.

---

### 문제 2. 다음 딕셔너리에서 세션 수를 출력하시오.

```python
campaign = {
    "name": "민사_A",
    "sessions": 1000,
    "key_events": 120
}

print(campaign["sessions"])
```

**정답:**

```text
1000
```

**풀이:**

`sessions`라는 key에 저장된 value가 `1000`이므로 `campaign["sessions"]`를 사용한다.

---

### 문제 3. 주요 이벤트율을 계산하시오.

```python
campaign = {
    "name": "민사_A",
    "sessions": 1000,
    "key_events": 120
}

key_event_rate = campaign["key_events"] / campaign["sessions"] * 100

print(key_event_rate)
```

**정답:**

```text
12.0
```

**풀이:**

주요 이벤트율은 다음과 같이 계산한다.

```text
120 / 1000 × 100 = 12.0%
```

---

## 🟡 Level 2 — Dictionary + for

### 문제 4. 캠페인 이름을 하나씩 출력하시오.

```python
campaigns = [
    {
        "name": "민사_A",
        "sessions": 1000,
        "key_events": 120
    },
    {
        "name": "민사_B",
        "sessions": 700,
        "key_events": 105
    },
    {
        "name": "민사_C",
        "sessions": 500,
        "key_events": 80
    }
]

for campaign in campaigns:
    print(campaign["name"])
```

**정답:**

```text
민사_A
민사_B
민사_C
```

**풀이:**

`campaigns` 리스트에서 Dictionary를 하나씩 가져온다.

그리고 각각의 Dictionary에서 `"name"` key를 이용해 캠페인 이름을 가져온다.

---

### 문제 5. 각 캠페인의 주요 이벤트율을 출력하시오.

```python
for campaign in campaigns:
    rate = campaign["key_events"] / campaign["sessions"] * 100
    print(campaign["name"], rate)
```

**정답:**

```text
민사_A 12.0
민사_B 15.0
민사_C 16.0
```

**풀이:**

각 Dictionary에서 `key_events`와 `sessions`를 가져온 뒤 주요 이벤트율을 계산한다.

---

### 문제 6. 주요 이벤트율이 10% 이상인지 판단하시오.

```python
for campaign in campaigns:
    rate = campaign["key_events"] / campaign["sessions"] * 100

    if rate >= 10:
        print(campaign["name"], "성과 기준 충족")
```

**정답:**

```text
민사_A 성과 기준 충족
민사_B 성과 기준 충족
민사_C 성과 기준 충족
```

**풀이:**

각 캠페인의 주요 이벤트율을 계산한 뒤 `10`과 비교한다.

`rate >= 10`이 `True`이면 해당 캠페인의 이름과 `"성과 기준 충족"`을 출력한다.

---

## 🔴 Level 3 — 분석가 사고방식

### 문제 7. 각 캠페인의 주요 이벤트율과 성과 등급을 출력하시오.

기준:

```text
15% 이상 → 우수
10% 이상 → 양호
그 외 → 개선 필요
```

```python
campaigns = [
    {
        "name": "민사_A",
        "sessions": 1000,
        "key_events": 120
    },
    {
        "name": "민사_B",
        "sessions": 700,
        "key_events": 105
    },
    {
        "name": "민사_C",
        "sessions": 500,
        "key_events": 80
    },
    {
        "name": "민사_D",
        "sessions": 300,
        "key_events": 20
    }
]

for campaign in campaigns:
    rate = campaign["key_events"] / campaign["sessions"] * 100

    if rate >= 15:
        grade = "우수"
    elif rate >= 10:
        grade = "양호"
    else:
        grade = "개선 필요"

    print(campaign["name"], rate, grade)
```

**정답:**

```text
민사_A 12.0 양호
민사_B 15.0 우수
민사_C 16.0 우수
민사_D 6.666666666666667 개선 필요
```

**풀이:**

각 캠페인을 하나씩 가져온다.

1. 세션과 주요 이벤트를 가져온다.
2. 주요 이벤트율을 계산한다.
3. `if / elif / else`로 등급을 판단한다.
4. 캠페인 이름, 이벤트율, 등급을 출력한다.

`민사_D`의 경우 `20 / 300 × 100 = 6.666...%`이므로 `"개선 필요"`가 된다.

---

### 문제 8. Dictionary 데이터를 함수에 전달하시오.

```python
def calculate_rate(sessions, key_events):
    return key_events / sessions * 100


for campaign in campaigns:
    rate = calculate_rate(
        campaign["sessions"],
        campaign["key_events"]
    )

    print(campaign["name"], rate)
```

**정답:**

```text
민사_A 12.0
민사_B 15.0
민사_C 16.0
민사_D 6.666666666666667
```

**풀이:**

Dictionary에서 `sessions`와 `key_events`를 꺼낸 후 `calculate_rate()` 함수에 전달한다.

즉, Day40에서 배운 함수와 Day41에서 배운 Dictionary가 연결된다.

---

## 🏆 Day11 Challenge — 광고 데이터 구조 만들기

### 문제 9. 하나의 캠페인 데이터를 Dictionary로 만들기

```python
campaign = {
    "name": "민사_A",
    "sessions": 1000,
    "key_events": 120
}
```

**정답:**

위와 같이 `name`, `sessions`, `key_events`를 각각 key로 지정한다.

---

### 문제 10 — 분석가 사고력

**질문:**

> Day07에서는 여러 리스트의 같은 위치를 연결하기 위해 `range()`와 인덱스를 사용했다. 그렇다면 Day41에서 Dictionary를 사용하면 어떤 점이 편해질까?

**정답:**

리스트는 데이터를 가져올 때 위치(index)를 알아야 한다.

반면 Dictionary는 key의 이름으로 데이터를 찾을 수 있기 때문에 데이터의 의미를 파악하기 쉽고 원하는 값을 직접 가져올 수 있다.

예를 들어:

```python
campaign["sessions"]
```

라고 작성하면 해당 캠페인의 세션 수를 바로 가져올 수 있다.

---

## 💡 Day11 핵심 정리

```text
리스트
↓
index로 데이터 접근

Dictionary
↓
key로 데이터 접근

Dictionary + for
↓
여러 캠페인의 데이터 반복 처리

Dictionary + 함수
↓
반복되는 분석 로직 재사용

Dictionary + for + 함수 + if
↓
광고 캠페인 분석 결과 생성
```

---

## 🎯 오늘의 핵심 포인트

오늘 가장 중요한 것은 Dictionary 문법을 많이 외우는 것이 아니다.

**"데이터의 의미를 이름으로 관리할 수 있다"**는 점을 이해하는 것이 중요하다.

기존에는:

```python
campaigns[i]
sessions[i]
key_events[i]
```

처럼 여러 리스트의 같은 index를 연결해야 했다.

Day11부터는:

```python
campaign["name"]
campaign["sessions"]
campaign["key_events"]
```

처럼 데이터의 의미를 직접 표현할 수 있다.

이러한 구조는 앞으로 Pandas의 DataFrame과 컬럼 기반 데이터 처리로 넘어갈 때 중요한 기초가 된다.

---

## 📚 학습 키워드

`Dictionary` `key` `value` `for` `index` `function` `if` `데이터 구조`

---