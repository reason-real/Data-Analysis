# Day22 - CTE (Common Table Expression)

> 📅 학습일: 2026-08-06

## 📖 학습 내용

오늘은 **CTE(Common Table Expression)** 에 대해 학습했다.

CTE는 `WITH` 키워드를 사용하여 **임시 결과 집합**을 만드는 SQL 문법으로, 복잡한 Subquery를 단계별로 나누어 작성할 수 있어 가독성과 유지보수성을 높여준다.

실무에서는 여러 단계의 집계나 복잡한 분석 쿼리를 작성할 때 자주 활용된다.

---

## 📚 핵심 개념

### CTE란?

CTE(Common Table Expression)는 SQL 실행 중에만 존재하는 **임시 결과 집합**이다.

긴 Subquery를 여러 단계로 나누어 작성할 수 있으며, SQL을 더 읽기 쉽고 관리하기 쉽게 만들어준다.

기본 문법

```sql
WITH cte_name AS
(
    SELECT ...
)

SELECT *
FROM cte_name;
```

---

## 💻 실습

### 1. 평균 급여를 구하는 CTE

```sql
WITH avg_salary AS
(
    SELECT AVG(salary) AS avg_salary
    FROM employees
)

SELECT *
FROM avg_salary;
```

---

### 2. 평균 급여보다 높은 직원 조회

```sql
WITH avg_salary AS
(
    SELECT AVG(salary) AS avg_sal
    FROM employees
)

SELECT
    name,
    salary
FROM employees,
     avg_salary
WHERE salary > avg_sal;
```

---

### 3. 급여가 5,000 이상인 직원 조회

```sql
WITH high_salary AS
(
    SELECT
        name,
        salary
    FROM employees
    WHERE salary >= 5000
)

SELECT *
FROM high_salary;
```

---

## 💼 실무 활용 예시

마케팅 데이터 분석에서는 여러 단계의 집계 결과를 활용하는 경우가 많다.

예를 들어,

- 캠페인별 성과 집계
- 성과가 우수한 캠페인만 추출
- 다른 테이블과 결합하여 최종 리포트 생성

이러한 과정을 CTE로 작성하면 SQL 구조가 명확해지고 유지보수가 쉬워진다.

---

## ✅ 학습 정리

- `WITH` 키워드를 사용하여 CTE를 생성하는 방법을 학습했다.
- CTE는 SQL 실행 중에만 존재하는 임시 결과 집합임을 이해했다.
- 복잡한 Subquery를 CTE로 변경하여 가독성을 높이는 방법을 연습했다.
- 실무에서 여러 단계의 데이터 분석 시 CTE가 많이 활용된다는 점을 이해했다.

---

## 📌 핵심 키워드

`SQL` `CTE` `WITH` `Subquery` `가독성` `임시 결과 집합`