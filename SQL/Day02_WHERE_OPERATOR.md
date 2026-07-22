# Day02 - WHERE 심화 (Operators)

> 📅 Study Date : 2026.07.09  
> 📖 Topic : WHERE, AND, OR, BETWEEN, IN, LIKE

---

# 📌 학습 목표

이번 학습에서는 WHERE 절을 더욱 다양하게 사용하는 방법을 익힌다.

학습 내용

- WHERE 조건문
- 비교 연산자
- AND / OR
- BETWEEN
- IN
- LIKE

---

# 📚 핵심 문법

## 1️⃣ WHERE

```sql
SELECT *
FROM employees
WHERE salary >= 4000;
```

✔ 조건에 맞는 데이터만 조회한다.

---

## 2️⃣ 비교 연산자

```sql
=
>
<
>=
<=
!=
```

예시

```sql
SELECT *
FROM employees
WHERE age <= 30;
```

✔ 나이가 30세 이하인 직원 조회

---

## 3️⃣ AND

```sql
SELECT *
FROM employees
WHERE department = 'Finance'
AND salary >= 5000;
```

✔ 모든 조건을 만족하는 데이터 조회

---

## 4️⃣ OR

```sql
SELECT *
FROM employees
WHERE department = 'Marketing'
OR department = 'HR';
```

✔ 하나 이상의 조건을 만족하면 조회

---

## 5️⃣ BETWEEN

```sql
SELECT *
FROM employees
WHERE salary BETWEEN 3500 AND 5000;
```

✔ 범위 조회

위 SQL은 아래와 같다.

```sql
salary >= 3500
AND salary <= 5000
```

---

## 6️⃣ IN

```sql
SELECT *
FROM employees
WHERE department IN ('Finance', 'Marketing');
```

✔ 여러 값을 한 번에 조회

위 SQL은 아래와 같다.

```sql
department='Finance'
OR department='Marketing'
```

---

## 7️⃣ LIKE

```sql
SELECT *
FROM employees
WHERE name LIKE 'K%';
```

패턴 검색

| 문법 | 의미 |
|------|------|
| 'K%' | K로 시작 |
| '%K' | K로 끝남 |
| '%K%' | K 포함 |

---

# 💡 핵심 개념

| 문법 | 설명 |
|------|------|
| WHERE | 조건 조회 |
| AND | 모두 만족 |
| OR | 하나 이상 만족 |
| BETWEEN | 범위 조회 |
| IN | 여러 값 조회 |
| LIKE | 문자열 검색 |

---

# 📝 배운 점

- WHERE는 SQL에서 가장 많이 사용하는 조건문이다.
- BETWEEN은 범위를 조회할 때 가독성이 높다.
- IN은 OR를 여러 번 사용하는 것보다 효율적이다.
- LIKE는 문자열 검색에서 자주 사용된다.

---

# 🎯 실무 Tip

실무에서는 다음과 같은 형태를 자주 사용한다.

```sql
SELECT name,
       department,
       salary
FROM employees
WHERE department IN ('Finance', 'HR')
AND salary >= 4000
ORDER BY salary DESC;
```

✔ 여러 조건을 함께 사용하는 것이 일반적이다.

---

# 📚 학습 키워드

`WHERE`

`AND`

`OR`

`BETWEEN`

`IN`

`LIKE`