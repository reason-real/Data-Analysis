# Day01 - SQL 기초 (SELECT, FROM, WHERE)

## 📌 학습 목표

- SQL의 기본 구조를 이해한다.
- SELECT, FROM, WHERE의 역할을 이해한다.
- 데이터를 조회하고 조건에 맞게 필터링할 수 있다.

---

## 📚 핵심 문법

### 1. 전체 데이터 조회

```sql
SELECT *
FROM employees;
```

- `SELECT *` : 모든 컬럼 조회
- `FROM employees` : employees 테이블에서 조회

---

### 2. 특정 컬럼 조회

```sql
SELECT name
FROM employees;
```

- 필요한 컬럼만 조회하면 성능과 가독성이 좋아진다.

---

### 3. 조건에 맞는 데이터 조회

```sql
SELECT *
FROM employees
WHERE department = 'Finance';
```

- `WHERE`는 특정 조건에 맞는 데이터만 조회할 때 사용한다.

---

### 4. 급여 조건 조회

```sql
SELECT *
FROM employees
WHERE salary >= 4000;
```

- 비교 연산자(`=`, `>`, `<`, `>=`, `<=`)를 사용할 수 있다.

---

### 5. 데이터 정렬

```sql
SELECT *
FROM employees
ORDER BY salary DESC;
```

- `ASC` : 오름차순
- `DESC` : 내림차순

---

### 6. 조회 개수 제한

```sql
SELECT *
FROM employees
LIMIT 5;
```

- 조회 결과를 원하는 개수만큼 제한한다.

---

## 💡 핵심 개념

| 문법 | 역할 |
|------|------|
| SELECT | 조회할 컬럼 선택 |
| FROM | 조회할 테이블 지정 |
| WHERE | 조건 필터링 |
| ORDER BY | 정렬 |
| LIMIT | 조회 개수 제한 |

---

## 📝 배운 점

- SQL은 원하는 데이터를 조회하는 언어이다.
- 필요한 컬럼만 조회하는 습관이 중요하다.
- WHERE를 사용하면 조건에 맞는 데이터만 조회할 수 있다.
- ORDER BY와 LIMIT를 함께 사용하면 원하는 순위 데이터를 쉽게 조회할 수 있다.

---

## 📚 학습 키워드

`SELECT` `FROM` `WHERE` `ORDER BY` `LIMIT`