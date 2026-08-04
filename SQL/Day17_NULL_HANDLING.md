# Day17 - NULL Handling

> 📅 Study Date : 2026.08.04
>
> 📖 Topic : SQL NULL Handling (IFNULL & COALESCE)

---

# 📌 학습 목표

- NULL의 의미와 특징을 이해한다.
- IFNULL()과 COALESCE()의 차이를 학습한다.
- NULL 값을 안전하게 처리하는 방법을 익힌다.

---

# 📚 핵심 개념

## 1. NULL

NULL은 **0이나 빈 문자열이 아니라 값이 존재하지 않는 상태**를 의미한다.

데이터가 아직 입력되지 않았거나 알 수 없는 경우 사용된다.

---

## 2. IFNULL()

첫 번째 값이 NULL이면 두 번째 값을 반환한다.

```sql
SELECT IFNULL(bonus, 0)
FROM employees;
```

---

## 3. COALESCE()

여러 값 중 **NULL이 아닌 첫 번째 값**을 반환한다.

```sql
SELECT COALESCE(bonus, salary, 0)
FROM employees;
```

---

# 📌 IFNULL과 COALESCE의 차이

| 함수 | 설명 |
|------|------|
| IFNULL(value, replace) | NULL이면 대체값 반환 |
| COALESCE(value1, value2, value3...) | NULL이 아닌 첫 번째 값 반환 |

---

# 💼 실무 활용

NULL 처리는 데이터 분석에서 매우 중요하다.

대표적인 활용 사례는 다음과 같다.

- 보너스가 없는 직원을 0으로 표시
- 광고 전환 수가 없는 캠페인을 0으로 처리
- 매출 데이터의 NULL 값을 기본값으로 대체
- 보고서 계산 오류 방지

---

# 💡 실무 예제

보너스가 NULL이면 0으로 조회하기

```sql
SELECT name,
       IFNULL(bonus, 0) AS bonus
FROM employees;
```

---

급여와 보너스를 합산하기

```sql
SELECT name,
       salary + IFNULL(bonus, 0) AS total_salary
FROM employees;
```

---

COALESCE 사용 예제

```sql
SELECT name,
       COALESCE(bonus, salary, 0) AS payment
FROM employees;
```

---

# 📌 NULL 처리의 중요성

NULL을 처리하지 않으면 계산 결과가 NULL이 되거나 집계 결과가 예상과 달라질 수 있다.

예를 들어,

```sql
SELECT salary + bonus
FROM employees;
```

위 SQL에서 `bonus`가 NULL이면 결과도 NULL이 된다.

이를 방지하기 위해 IFNULL() 또는 COALESCE()를 사용한다.

---

# 🎯 핵심 정리

- NULL은 값이 없는 상태이다.
- IFNULL()은 NULL을 다른 값으로 대체한다.
- COALESCE()는 NULL이 아닌 첫 번째 값을 반환한다.
- 계산 전 NULL 처리는 필수이다.

---

# 🧠 오늘 배운 개념

- NULL
- IFNULL()
- COALESCE()

---

# 📌 실무 TIP

실무에서는 집계 함수나 계산식을 사용할 때 NULL 처리를 먼저 수행하는 것이 일반적이다.

NULL을 그대로 계산하면 잘못된 분석 결과가 나올 수 있으므로, 데이터를 정제한 후 분석하는 습관이 중요하다.

---

# 📊 실무 분석 포인트

광고 성과 데이터에서는 `conversion_count`, `revenue`, `cost` 등의 컬럼에 NULL이 존재할 수 있다.

이 경우 IFNULL() 또는 COALESCE()를 사용하여 0으로 대체하면 전환율, ROAS, CPA 등의 지표를 안정적으로 계산할 수 있다.

---

# 🎯 한 줄 정리

> NULL은 값이 없는 상태이며, IFNULL()과 COALESCE()를 활용해 안전하게 처리해야 정확한 데이터 분석이 가능하다.