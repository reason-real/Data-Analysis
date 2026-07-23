# Day04 - LEFT JOIN

> 📅 **Study Date** : 2026.07.11
>
> 📖 **Topic** : LEFT JOIN

---

# 📌 학습 목표

- LEFT JOIN의 개념 이해
- INNER JOIN과 차이 이해
- NULL 이해

---

# 📚 핵심 문법

## LEFT JOIN

```sql
SELECT *
FROM customers
LEFT JOIN loans
ON customers.customer_id = loans.customer_id;
```

LEFT 테이블의 모든 데이터를 조회한다.

오른쪽 데이터가 없으면 NULL이 출력된다.

---

## INNER JOIN과 차이

| INNER JOIN | LEFT JOIN |
|------------|-----------|
| 공통 데이터만 조회 | 왼쪽 테이블 전체 조회 |

---

## NULL

NULL은 존재하지 않는 값을 의미한다.

예시

| Customer | Loan |
|----------|------|
| Kim | O |
| Lee | O |
| Park | NULL |

---

# 💼 실무 예시

```sql
SELECT *
FROM members
LEFT JOIN orders
ON members.member_id = orders.member_id;
```

주문하지 않은 회원도 함께 조회할 수 있다.

---

# 🧠 오늘 배운 개념

- LEFT JOIN
- NULL
- INNER JOIN과 차이

---

# 🎯 한 줄 정리

> LEFT JOIN은 왼쪽 테이블을 기준으로 모든 데이터를 조회하며, 연결되는 데이터가 없으면 NULL이 출력된다.