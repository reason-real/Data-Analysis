# Day11 - Subquery

> 📅 Study Date : 2026.07.20
>
> 📖 Topic : SQL Subquery

---

# 📌 학습 목표

- Subquery의 개념과 실행 순서를 이해한다.
- WHERE 절에서 Subquery를 활용한다.
- 집계 함수와 함께 사용하는 방법을 익힌다.

---

# 📚 핵심 개념

Subquery는 SQL 안에 포함된 또 다른 SQL이다. 안쪽 쿼리가 먼저 실행되고 결과를 바깥 쿼리에서 사용한다.

---

## 평균 급여보다 많이 받는 직원
```sql
SELECT *
FROM employees
WHERE salary > (
 SELECT AVG(salary)
 FROM employees
);
```

## 최고 급여 직원
```sql
SELECT *
FROM employees
WHERE salary = (
 SELECT MAX(salary)
 FROM employees
);
```

## Finance 평균보다 높은 급여
```sql
SELECT *
FROM employees
WHERE salary > (
 SELECT AVG(salary)
 FROM employees
 WHERE department='Finance'
);
```

---

# 💼 실무 활용

- 평균보다 높은 매출 분석
- 최고 구매 고객 조회
- 평균 전환율보다 높은 광고 캠페인 분석

---

# 🎯 핵심 정리

- SQL 안의 SQL
- 안쪽 쿼리 먼저 실행
- WHERE와 함께 가장 많이 사용
- AVG, MAX, MIN과 자주 사용

---

# 🎯 한 줄 정리

> Subquery는 먼저 실행된 결과를 바깥 SQL의 조건으로 사용하는 문법이다.
