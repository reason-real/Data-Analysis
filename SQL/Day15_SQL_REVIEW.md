# Day15 - SQL Review

> 📅 Study Date : 2026.07.24
>
> 📖 Topic : SQL Comprehensive Review

---

# 📌 학습 목표

- 지금까지 학습한 SQL 문법을 종합적으로 복습한다.
- 여러 SQL 문법을 하나의 문제에서 함께 활용하는 연습을 한다.
- 실무에서 자주 사용하는 SQL 작성 흐름을 익힌다.

---

# 📚 복습한 핵심 문법

이번 학습에서는 다음 내용을 종합적으로 복습하였다.

- SELECT
- WHERE
- ORDER BY
- GROUP BY
- HAVING
- JOIN
- Subquery
- CASE WHEN
- DATE Functions
- String Functions
- NULL 처리
- UNION / UNION ALL

---

# 💼 실무 예제 1

급여가 4,000 이상인 직원만 대상으로 부서별 평균 급여를 조회한다.

```sql
SELECT department,
       AVG(salary) AS avg_salary
FROM employees
WHERE salary >= 4000
GROUP BY department;
```

---

# 💼 실무 예제 2

직원의 급여를 등급으로 표시한다.

```sql
SELECT name,
       salary,
       CASE
           WHEN salary >= 6000 THEN 'A'
           WHEN salary >= 4000 THEN 'B'
           ELSE 'C'
       END AS salary_grade
FROM employees;
```

---

# 💼 실무 예제 3

평균 급여보다 높은 급여를 받는 직원을 조회한다.

```sql
SELECT *
FROM employees
WHERE salary >
(
    SELECT AVG(salary)
    FROM employees
);
```

---

# 💼 실무 예제 4

입사일이 오래된 직원부터 조회한다.

```sql
SELECT name,
       hire_date
FROM employees
ORDER BY hire_date ASC;
```

---

# 📌 SQL 실행 순서

SQL은 다음 순서로 실행된다.

1. FROM
2. WHERE
3. GROUP BY
4. HAVING
5. SELECT
6. ORDER BY
7. LIMIT

실무에서는 실행 순서를 이해해야 복잡한 쿼리도 정확하게 작성할 수 있다.

---

# 📌 자주 헷갈리는 개념

| 개념 | 차이점 |
|------|--------|
| WHERE | 그룹화 이전 데이터 필터링 |
| HAVING | GROUP BY 이후 그룹 필터링 |
| JOIN | 여러 테이블을 가로로 연결 |
| UNION | 여러 SELECT 결과를 세로로 연결 |
| CASE WHEN | 조건에 따라 값을 분류 |
| DISTINCT | 중복 제거 |

---

# 🧠 오늘 복습한 내용

- SELECT
- WHERE
- GROUP BY
- HAVING
- ORDER BY
- LIMIT
- JOIN
- UNION
- CASE WHEN
- Subquery
- DATE Functions
- String Functions
- NULL 처리

---

# 📌 실무 TIP

실무에서는 하나의 SQL 문법만 사용하는 경우보다 여러 문법을 함께 사용하는 경우가 훨씬 많다.

예를 들어 WHERE로 데이터를 필터링한 뒤 GROUP BY로 집계하고, HAVING으로 조건을 적용한 후 ORDER BY와 LIMIT를 사용하여 원하는 결과만 조회하는 패턴이 매우 자주 사용된다.

---

# 🎯 한 줄 정리

> SQL 실력은 개별 문법을 많이 아는 것보다, 여러 문법을 자연스럽게 조합하여 문제를 해결하는 능력에서 결정된다.