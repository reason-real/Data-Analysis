# Day20 - SQL Comprehensive Review Test

> 📅 Study Date : 2026.08.05
>
> 📖 Topic : SQL Comprehensive Review

---

# 📌 학습 목표

- 지금까지 학습한 SQL 기초 문법을 종합적으로 복습한다.
- 여러 SQL 문법을 하나의 문제에서 함께 활용하는 연습을 한다.
- 부족한 부분을 확인하고 보완하여 중급 SQL 학습을 준비한다.

---

# 📚 복습한 핵심 문법

이번 테스트에서는 다음 내용을 종합적으로 복습하였다.

- SELECT
- WHERE
- GROUP BY
- HAVING
- ORDER BY
- LIMIT
- DISTINCT
- AS
- CASE WHEN
- Subquery
- JOIN
- UNION
- NULL 처리
- 날짜 함수

---

# 💼 실무 예제 1

부서별 평균 급여가 5,000 이상인 부서 조회

```sql
SELECT department,
       AVG(salary) AS avg_salary
FROM employees
GROUP BY department
HAVING AVG(salary) >= 5000;
```

---

# 💼 실무 예제 2

직원의 급여를 등급으로 표시하기

```sql
SELECT name,
       CASE
           WHEN salary >= 7000 THEN 'S'
           WHEN salary >= 5000 THEN 'A'
           WHEN salary >= 3000 THEN 'B'
           ELSE 'C'
       END AS salary_grade
FROM employees;
```

---

# 💼 실무 예제 3

평균 급여보다 높은 급여를 받는 직원 조회

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

# 📌 테스트를 통해 복습한 내용

이번 테스트를 통해 다음 내용을 다시 확인하였다.

- GROUP BY와 HAVING의 역할
- DISTINCT와 GROUP BY의 차이
- CASE WHEN 문법 작성
- Subquery 활용
- ORDER BY와 LIMIT의 실행 순서
- IFNULL()을 활용한 NULL 처리

---

# 🎯 테스트 결과

- 총점 : **92 / 100점**
- 결과 : **중급 SQL 학습 진행 가능**

---

# 🧠 보완할 내용

## 1. HAVING 활용

GROUP BY로 그룹을 만든 뒤 조건을 적용할 때는 WHERE가 아닌 HAVING을 사용한다.

---

## 2. CASE WHEN 문법

CASE WHEN 작성 시 THEN 뒤에는 쉼표(,)를 사용하지 않는다.

```sql
CASE
    WHEN salary >= 7000 THEN 'S'
    WHEN salary >= 5000 THEN 'A'
    ELSE 'C'
END
```

---

# 📌 실무 TIP

실무에서는 하나의 SQL 문법만 사용하는 경우보다 여러 문법을 함께 조합하는 경우가 훨씬 많다.

복잡한 데이터 분석일수록 WHERE, GROUP BY, HAVING, CASE WHEN, Subquery 등을 함께 사용하는 능력이 중요하다.

---

# 📊 실무 분석 포인트

광고 성과 데이터를 분석할 때도 여러 SQL 문법을 조합하여 사용한다.

예를 들어 광고 데이터를 필터링(WHERE)한 뒤, 캠페인별로 그룹화(GROUP BY)하고, 평균 전환 수(HAVING)를 계산하여 성과가 높은 캠페인만 추출하는 방식으로 활용할 수 있다.

---

# 🎯 한 줄 정리

> SQL 실력은 개별 문법을 암기하는 것이 아니라, 여러 문법을 자연스럽게 조합하여 문제를 해결하는 능력에서 완성된다.