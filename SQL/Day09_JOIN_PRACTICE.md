# Day09 - JOIN Practice

> 📅 Study Date : 2026.07.18
>
> 📖 Topic : JOIN Practice

---

# 📌 학습 목표

- INNER JOIN, LEFT JOIN, RIGHT JOIN의 차이를 이해한다.
- SELF JOIN과 CROSS JOIN의 활용을 익힌다.
- 실무에서 JOIN을 사용하는 상황을 이해한다.

---

# 📚 핵심 문법

## 1. INNER JOIN

```sql
SELECT c.customer_name,
       l.loan_amount
FROM customers c
INNER JOIN loans l
ON c.customer_id = l.customer_id;
```

공통된 키가 있는 데이터만 조회한다.

---

## 2. LEFT JOIN

```sql
SELECT c.customer_name,
       l.loan_amount
FROM customers c
LEFT JOIN loans l
ON c.customer_id = l.customer_id;
```

왼쪽 테이블의 모든 데이터를 기준으로 조회한다.

---

## 3. RIGHT JOIN

```sql
SELECT c.customer_name,
       l.loan_amount
FROM customers c
RIGHT JOIN loans l
ON c.customer_id = l.customer_id;
```

오른쪽 테이블의 모든 데이터를 기준으로 조회한다.

---

## 4. SELF JOIN

```sql
SELECT e.name,
       m.name AS manager_name
FROM employees e
JOIN employees m
ON e.manager_id = m.employee_id;
```

같은 테이블을 자기 자신과 조인하여 관계를 조회한다.

---

# 💼 실무 예시

직원과 담당 대출 정보, 고객과 주문 정보 등 여러 테이블의 데이터를 하나로 연결하여 분석할 때 JOIN을 사용한다.

---

# 🎯 핵심 정리

- INNER JOIN : 공통 데이터만 조회
- LEFT JOIN : 왼쪽 테이블 기준
- RIGHT JOIN : 오른쪽 테이블 기준
- SELF JOIN : 같은 테이블끼리 조인
- CROSS JOIN : 가능한 모든 조합 생성

---

# 🧠 오늘 배운 개념

- INNER JOIN
- LEFT JOIN
- RIGHT JOIN
- SELF JOIN
- CROSS JOIN

---

# 🎯 한 줄 정리

> JOIN은 여러 테이블의 데이터를 하나로 연결하여 분석할 때 사용하는 가장 중요한 SQL 문법이다.
