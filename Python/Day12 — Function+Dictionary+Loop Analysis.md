# Day12 — Function + Dictionary + Loop Analysis

## 오늘의 학습 목표

오늘은 지금까지 배운 Python 기초 문법을 연결해서 광고 데이터를 반복적으로 분석하는 연습을 했다.

- 함수
- Dictionary
- `for`
- `if / elif / else`
- 데이터 계산
- 분석 결과 출력

특히 Python 문법 자체보다 **데이터를 가져와서 → 계산하고 → 조건으로 판단하고 → 결과를 만드는 흐름**을 이해하는 데 집중했다.

---

## 🟢 Level 1 — 함수 + Dictionary

### 문제 1

Dictionary에서 세션과 주요 이벤트를 가져와 주요 이벤트율을 계산했다.

```python
def calculate_rate(sessions, key_events):
    return key_events / sessions * 100

rate = calculate_rate(
    campaign["key_events"],
    campaign["sessions"]
)

print(rate)
```

> 주의: 함수에 전달하는 순서는 `sessions`, `key_events`이므로 실제로는 아래처럼 작성하는 것이 정확하다.

```python
rate = calculate_rate(
    campaign["sessions"],
    campaign["key_events"]
)
```

### 핵심

Dictionary의 key를 이용하면 필요한 데이터를 의미가 명확한 이름으로 가져올 수 있다.

---

### 문제 2

다음 결과를 예상했다.

```python
campaign = {
    "name": "민사_B",
    "sessions": 700,
    "key_events": 105
}

rate = calculate_rate(
    campaign["sessions"],
    campaign["key_events"]
)

print(rate)
```

결과:

```text
15.0
```

`campaign["sessions"]`처럼 Dictionary의 key를 이용하면 원하는 데이터를 직접 가져와 함수에 전달할 수 있다.

---

## 🟡 Level 2 — 반복 분석

### 문제 3

여러 캠페인을 `for`문으로 하나씩 가져오면서 함수에 데이터를 전달하는 구조를 연습했다.

```python
for campaign in campaigns:
    rate = calculate_rate(
        campaign["sessions"],
        campaign["key_events"]
    )

    print(campaign["name"], rate)
```

결과:

```text
민사_A 12.0
민사_B 15.0
민사_C 16.0
```

---

### 문제 4

계산한 주요 이벤트율을 기준으로 성과 등급을 판단했다.

기준:

```text
15% 이상 → 우수
10% 이상 → 양호
그 외 → 개선 필요
```

예시:

```python
for campaign in campaigns:
    rate = calculate_rate(
        campaign["sessions"],
        campaign["key_events"]
    )

    if rate >= 15:
        grade = "우수"
    elif rate >= 10:
        grade = "양호"
    else:
        grade = "개선 필요"

    print(campaign["name"], rate, grade)
```

---

## 🔴 Level 3 — 분석 결과 저장

### 문제 5

각 캠페인의 성과 등급을 `performance_grades` 리스트에 저장하는 구조를 연습했다.

```python
performance_grades = []

for campaign in campaigns:
    rate = calculate_rate(
        campaign["sessions"],
        campaign["key_events"]
    )

    if rate >= 15:
        grade = "우수"
    elif rate >= 10:
        grade = "양호"
    else:
        grade = "개선 필요"

    performance_grades.append(grade)
```

결과:

```python
["양호", "우수", "우수", "개선 필요"]
```

### 핵심

`print()`는 결과를 바로 보여주는 것이고,

`append()`는 결과를 리스트에 저장하여 나중에 다시 사용할 수 있게 한다.

---

### 문제 6

저장한 `performance_grades`와 캠페인 이름을 연결해서 출력했다.

```python
for i in range(len(campaigns)):
    print(
        campaigns[i]["name"],
        performance_grades[i]
    )
```

결과:

```text
민사_A 양호
민사_B 우수
민사_C 우수
민사_D 개선 필요
```

---

# 🏆 Day12 Challenge — 광고 데이터 분석

## 문제 7

각 캠페인의 주요 이벤트율과 성과 등급을 함께 출력하는 분석 흐름을 연습했다.

```python
for campaign in campaigns:
    rate = calculate_rate(
        campaign["sessions"],
        campaign["key_events"]
    )

    if rate >= 15:
        grade = "우수"
    elif rate >= 10:
        grade = "양호"
    else:
        grade = "개선 필요"

    print(
        campaign["name"],
        ":",
        rate,
        "%",
        ":",
        grade
    )
```

목표 결과:

```text
민사_A : 12.0% : 양호
민사_B : 15.0% : 우수
민사_C : 16.0% : 우수
민사_D : 6.67% : 개선 필요
```

---

## 문제 8 — 분석 흐름 이해

다음과 같은 분석 과정을 이해하는 것이 핵심이다.

```text
① 데이터를 하나씩 가져온다
        ↓
② Dictionary에서 필요한 값을 가져온다
        ↓
③ 함수로 주요 이벤트율을 계산한다
        ↓
④ 계산 결과를 기준과 비교한다
        ↓
⑤ 성과 등급을 결정한다
        ↓
⑥ 분석 결과를 출력한다
```

즉, Python 문법 자체가 목적이 아니라 **데이터를 반복적으로 처리하여 분석 결과를 만드는 과정**이 중요하다.

---

# 🧠 문제 9 — Python을 배우는 이유

`for`, `if`, 함수, Dictionary를 배우는 이유는 각각의 문법을 암기하기 위해서가 아니다.

광고 데이터처럼 여러 데이터를 반복적으로 처리해야 하는 상황에서,

```text
데이터 가져오기
→ 필요한 값 추출
→ 지표 계산
→ 조건 판단
→ 결과 생성
```

과정을 자동화하기 위해 사용하는 것이다.

캠페인이 수백 개, 수천 개가 되면 같은 작업을 직접 반복하기 어렵기 때문에 Python의 반복문과 조건문, 함수 등이 유용해진다.

---

# 🚀 문제 10 — Pandas 진입 전 체크

오늘까지의 Python 기초에서 다음 개념을 이해하는 것을 목표로 했다.

| 개념 | 학습 목표 |
|---|---|
| `def` | 함수를 정의하는 문법 이해 |
| Dictionary | 의미 있는 key로 데이터를 저장하는 구조 이해 |
| Dictionary 값 가져오기 | `campaign["sessions"]` 형태 이해 |
| 함수 호출 | 함수에 값을 전달하고 결과를 받는 과정 이해 |
| `if / elif / else` | 조건에 따라 다른 결과를 만드는 구조 이해 |
| `return` | 함수의 계산 결과를 반환하는 역할 이해 |
| `for` | 데이터를 반복적으로 처리하는 구조 이해 |
| `append()` | 분석 결과를 리스트에 저장하는 방법 이해 |

## Python 학습 기준

현재 단계에서는 Python 문법을 개발자 수준으로 완벽하게 암기하는 것이 목표가 아니다.

**코드를 보고 데이터 처리 흐름을 해석할 수 있고, 간단한 코드를 직접 수정하거나 작성할 수 있는 수준**이면 다음 단계로 넘어간다.

앞으로 Python 복습은 계속 병행하되, 취업 준비의 핵심인 SQL, 분석 방법론, Pandas, 포트폴리오에 더 많은 시간을 배분한다.

---

## 📌 Day12 핵심 정리

오늘 배운 가장 중요한 흐름:

```text
Dictionary
↓
데이터 추출
↓
함수
↓
지표 계산
↓
for
↓
반복 분석
↓
if / elif / else
↓
성과 판단
↓
print / append
↓
분석 결과 생성
```

---