# Day07 - Python range()와 인덱스로 데이터 연결하기

## 📌 학습 목표

- Python 리스트의 인덱스(index)를 이해한다.
- `range()`의 기본 동작을 이해한다.
- `range()`와 인덱스를 함께 사용할 수 있다.
- 여러 리스트의 같은 위치에 있는 데이터를 연결할 수 있다.
- 광고 데이터의 주요 이벤트율을 반복적으로 계산할 수 있다.

---

## 📚 핵심 문법

### 1. 인덱스(index)

Python 리스트는 각 데이터에 위치 번호가 있으며, **0부터 시작**한다.

```python
campaigns = ["민사_A", "민사_B", "민사_C"]

print(campaigns[0])
print(campaigns[1])
print(campaigns[2])
```

- `campaigns[0]` → `"민사_A"`
- `campaigns[1]` → `"민사_B"`
- `campaigns[2]` → `"민사_C"`

> Python의 리스트 인덱스는 0부터 시작한다.

---

### 2. `range()`

`range()`는 반복할 숫자의 범위를 만들어준다.

```python
for i in range(3):
    print(i)
```

결과:

```text
0
1
2
```

`range(3)`은 **0부터 3 직전까지**의 숫자를 만든다.

---

### 3. `range()` + 인덱스

`range()`를 사용하면 리스트의 위치를 반복적으로 사용할 수 있다.

```python
campaigns = ["민사_A", "민사_B", "민사_C"]

for i in range(3):
    print(campaigns[i])
```

실행 과정:

```text
i = 0 → campaigns[0] → 민사_A
i = 1 → campaigns[1] → 민사_B
i = 2 → campaigns[2] → 민사_C
```

핵심:

- `i` → 위치 번호
- `campaigns[i]` → 해당 위치의 실제 데이터

---

### 4. 여러 리스트 연결하기

광고 데이터는 서로 다른 리스트에 저장될 수 있다.

```python
campaigns = ["민사_A", "민사_B", "민사_C"]
sessions = [1000, 700, 500]

for i in range(3):
    print(campaigns[i], sessions[i])
```

결과:

```text
민사_A 1000
민사_B 700
민사_C 500
```

같은 인덱스를 사용하면 서로 다른 리스트의 같은 위치 데이터를 연결할 수 있다.

---

### 5. 주요 이벤트율 계산

여러 리스트를 연결하면 광고 분석 지표도 계산할 수 있다.

```python
campaigns = ["민사_A", "민사_B", "민사_C"]
sessions = [1000, 700, 500]
key_events = [120, 105, 80]

for i in range(3):
    key_event_rate = key_events[i] / sessions[i] * 100
    print(campaigns[i], key_event_rate)
```

결과:

```text
민사_A 12.0
민사_B 15.0
민사_C 16.0
```

---

## 📊 오늘의 핵심 개념

| 문법 | 역할 |
|---|---|
| `for` | 데이터를 반복해서 처리 |
| `range()` | 반복할 숫자의 범위 생성 |
| `i` | 리스트의 위치를 나타내는 변수 |
| `list[i]` | 특정 위치의 데이터 조회 |
| `range()` + 인덱스 | 여러 리스트의 같은 위치 데이터를 연결 |

---

## 🔍 `for`문과 `range()` + 인덱스의 차이

### Day06

```python
campaigns = ["민사_A", "민사_B", "민사_C"]

for campaign in campaigns:
    print(campaign)
```

→ 리스트의 **값 자체를 하나씩 가져온다.**

### Day07

```python
campaigns = ["민사_A", "민사_B", "민사_C"]

for i in range(3):
    print(campaigns[i])
```

→ 리스트의 **위치 번호를 이용해서 데이터를 가져온다.**

특히 여러 리스트를 연결할 때 `range()` + 인덱스가 유용하다.

---

## 🎯 광고 분석에 적용

```python
campaigns = ["민사_A", "민사_B", "민사_C"]
sessions = [1000, 700, 500]
key_events = [120, 105, 80]

for i in range(3):
    key_event_rate = key_events[i] / sessions[i] * 100

    if key_event_rate >= 15:
        performance = "우수"
    elif key_event_rate >= 10:
        performance = "양호"
    else:
        performance = "개선 필요"

    print(campaigns[i], ":", key_event_rate, "% :", performance)
```

결과:

```text
민사_A : 12.0 % : 양호
민사_B : 15.0 % : 우수
민사_C : 16.0 % : 우수
```

이 과정에서 지금까지 배운 Python 기초가 연결된다.

```text
변수
↓
리스트
↓
for문
↓
range()
↓
인덱스
↓
계산
↓
비교 연산자
↓
if / elif / else
↓
광고 성과 분석
```

---

## 📝 Day07 문제 풀이에서 배운 점

- Python 리스트의 인덱스는 0부터 시작한다.
- `range(3)`은 0, 1, 2를 만든다.
- `i`는 리스트의 위치를 나타낼 수 있다.
- `list[i]`를 사용하면 특정 위치의 데이터를 가져올 수 있다.
- 여러 리스트의 같은 위치에 있는 데이터를 연결할 수 있다.
- 여러 캠페인의 세션과 주요 이벤트를 연결하여 주요 이벤트율을 계산할 수 있다.
- `for`문과 조건문을 함께 사용하면 여러 캠페인을 반복적으로 평가할 수 있다.

---

## 💡 오늘의 핵심 문장

> `range()`와 인덱스를 사용하면 여러 리스트의 같은 위치에 있는 데이터를 연결하여 반복적으로 분석할 수 있다.

---

## 📚 학습 키워드

`for` `range()` `index` `list[index]` `if` `elif` `else` `key_event_rate`

---