# Day03 - INNER JOIN

> 📅 Study Date : 2026.07.10
> 📖 Topic : INNER JOIN

---

## 📌 학습 목표

이번 학습에서는 두 개 이상의 테이블을 연결하는 JOIN의 개념과 가장 많이 사용하는 INNER JOIN을 학습한다.

학습 내용

- JOIN이 필요한 이유
- INNER JOIN
- ON
- Primary Key(PK)
- Foreign Key(FK)

---

## 📚 핵심 문법

### 1. INNER JOIN

```sql
SELECT *
FROM employees
JOIN departments
ON employees.department_id = departments.department_id;
```

두 테이블에서 공통으로 존재하는 데이터만 조회한다.

---

### 2. ON

```sql
ON employees.department_id = departments.department_id;
```

두 테이블을 어떤 컬럼으로 연결할지 지정하는 조건이다.

---

### 3. Primary Key(PK)

각 행(Row)을 유일하게 구분하는 고유한 값이다.

예시

| employee_id | name |
|------------:|------|
| 1 | Kim |
| 2 | Lee |

---

### 4. Foreign Key(FK)

다른 테이블의 Primary Key를 참조하는 컬럼이다.

예를 들어 `employees.department_id`는 `departments.department_id`를 참조한다.

---

## 📚 핵심 개념

| 문법 | 설명 |
|------|------|
| JOIN | 두 개 이상의 테이블을 연결 |
| INNER JOIN | 공통된 데이터만 조회 |
| ON | JOIN 조건 지정 |
| Primary Key | 고유한 값 |
| Foreign Key | 다른 테이블을 참조하는 값 |

---

## 📝 배운 점

- JOIN은 여러 테이블의 데이터를 함께 조회하기 위해 사용한다.
- INNER JOIN은 공통된 데이터만 조회한다.
- ON 절을 사용하여 연결 기준을 지정한다.
- Primary Key와 Foreign Key를 이용하여 테이블을 연결한다.

---

## 🎯 실무 Tip

실무에서는 `SELECT *`보다 필요한 컬럼만 조회하는 것이 좋다.

```sql
SELECT e.name,
       d.department_name
FROM employees e
JOIN departments d
ON e.department_id = d.department_id;
```

Alias를 사용하면 SQL을 더욱 읽기 쉽고 관리하기 편하다.

---

## 💼 금융권 활용 예시

은행에서는 고객 정보와 계좌 정보가 서로 다른 테이블에 저장되는 경우가 많다.

고객 이름과 계좌번호를 함께 조회하려면 JOIN을 사용한다.

```sql
SELECT c.customer_name,
       a.account_number
FROM customers c
JOIN accounts a
ON c.customer_id = a.customer_id;
```

금융권 데이터 분석에서는 JOIN이 가장 많이 사용되는 SQL 문법 중 하나이다.

---

## 📚 학습 키워드

- JOIN
- INNER JOIN
- ON
- Primary Key
- Foreign Key
- Alias