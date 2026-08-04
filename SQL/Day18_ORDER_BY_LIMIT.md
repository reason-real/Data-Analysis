# Day18 - ORDER BY & LIMIT

> 📅 Study Date : 2026.07.27
>
> 📖 Topic : SQL ORDER BY & LIMIT

---

# 📌 학습 목표

- ORDER BY를 이용한 데이터 정렬 방법을 이해한다.
- LIMIT를 사용하여 원하는 개수의 데이터만 조회하는 방법을 익힌다.
- 정렬과 제한 기능을 함께 활용하는 방법을 학습한다.

---

# 📚 핵심 개념

## 1. ORDER BY

조회 결과를 원하는 기준으로 정렬한다.

기본 정렬은 **오름차순(ASC)** 이며, **DESC**를 사용하면 내림차순으로 정렬된다.

```sql
SELECT name, salary
FROM employees
ORDER BY salary DESC;
```

---

## 2. LIMIT

조회 결과 중 원하는 개수만 출력한다.

```sql
SELECT *
FROM employees
LIMIT 5;
```

---

## 3. ORDER BY + LIMIT

정렬 후 원하는 개수만 조회할 수 있다.

```sql
SELECT name, salary
FROM employees
ORDER BY salary DESC
LIMIT 3;
```

---

# 📌 ASC와 DESC

| 옵션 | 설명 |
|------|------|
| ASC | 오름차순 (기본값) |
| DESC | 내림차순 |

---

# 💼 실무 활용

ORDER BY와 LIMIT는 실무에서 매우 자주 함께 사용된다.

대표적인 활용 사례는 다음과 같다.

- 급여 상위 10명 조회
- 최근 가입한 회원 조회
- 매출 상위 상품 조회
- 광고 전환 수 상위 캠페인 조회
- 최근 주문 내역 조회

---

# 💡 실무 예제

급여가 높은 순으로 조회하기

```sql
SELECT name,
       salary
FROM employees
ORDER BY salary DESC;
```

---

급여 상위 3명 조회하기

```sql
SELECT name,
       salary
FROM employees
ORDER BY salary DESC
LIMIT 3;
```

---

입사일이 가장 빠른 직원 1명 조회하기

```sql
SELECT name,
       hire_date
FROM employees
ORDER BY hire_date ASC
LIMIT 1;
```

---

# 📌 ORDER BY 실행 순서

SQL 실행 순서에서 ORDER BY는 SELECT 이후에 수행된다.

일반적인 실행 순서는 다음과 같다.

1. FROM
2. WHERE
3. GROUP BY
4. HAVING
5. SELECT
6. ORDER BY
7. LIMIT

---

# 🎯 핵심 정리

- ORDER BY : 데이터 정렬
- ASC : 오름차순
- DESC : 내림차순
- LIMIT : 원하는 개수만 조회
- ORDER BY와 LIMIT는 함께 사용하는 경우가 많다.

---

# 🧠 오늘 배운 개념

- ORDER BY
- ASC
- DESC
- LIMIT

---

# 📌 실무 TIP

ORDER BY 없이 LIMIT만 사용하면 조회되는 데이터의 순서를 보장할 수 없다.

상위 또는 하위 데이터를 정확하게 조회하려면 ORDER BY를 먼저 사용한 뒤 LIMIT를 적용하는 것이 좋다.

---

# 📊 실무 분석 포인트

광고 성과 데이터를 분석할 때는 전환 수(`conversion_count`)나 광고비(`cost`)를 기준으로 정렬한 후 상위 캠페인만 확인하는 경우가 많다.

예를 들어 전환 수가 높은 광고 10개를 조회하여 성과가 좋은 캠페인을 분석하거나, 광고비가 높은 순으로 정렬하여 예산 사용 현황을 점검할 수 있다.

---

# 🎯 한 줄 정리

> ORDER BY는 데이터를 원하는 기준으로 정렬하고, LIMIT는 필요한 개수만 조회하여 효율적인 데이터 분석을 가능하게 한다.