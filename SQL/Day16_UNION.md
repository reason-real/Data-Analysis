# Day16 - UNION

> 📅 Study Date : 2026.07.25
>
> 📖 Topic : SQL UNION & UNION ALL

---

# 📌 학습 목표

- UNION과 UNION ALL의 차이를 이해한다.
- 여러 SELECT 문의 결과를 하나로 합치는 방법을 익힌다.
- 실무에서 UNION을 활용하는 사례를 학습한다.

---

# 📚 핵심 개념

## 1. UNION

여러 SELECT 문의 결과를 하나로 합치며, **중복된 데이터는 제거**한다.

```sql
SELECT name
FROM employees_2024

UNION

SELECT name
FROM employees_2025;
```

---

## 2. UNION ALL

여러 SELECT 문의 결과를 하나로 합치며, **중복된 데이터도 모두 포함**한다.

```sql
SELECT name
FROM employees_2024

UNION ALL

SELECT name
FROM employees_2025;
```

---

# 📌 UNION 사용 조건

UNION과 UNION ALL을 사용할 때는 다음 조건을 만족해야 한다.

- SELECT 문의 컬럼 개수가 같아야 한다.
- 컬럼의 순서가 같아야 한다.
- 컬럼의 데이터 타입이 서로 호환되어야 한다.

---

# 💼 실무 활용

UNION은 서로 다른 테이블에 저장된 데이터를 하나의 결과로 조회할 때 사용한다.

대표적인 활용 사례는 다음과 같다.

- 연도별 고객 데이터 통합
- 월별 주문 데이터 통합
- 지점별 판매 데이터 통합
- 여러 광고 채널 데이터 통합

---

# 💡 실무 예제

2024년과 2025년 직원 이름을 중복 없이 조회한다.

```sql
SELECT name
FROM employees_2024

UNION

SELECT name
FROM employees_2025;
```

---

중복을 포함하여 모든 직원 이름을 조회한다.

```sql
SELECT name
FROM employees_2024

UNION ALL

SELECT name
FROM employees_2025;
```

---

# 📌 UNION과 JOIN의 차이

| UNION | JOIN |
|--------|------|
| 행(Row)을 추가한다. | 열(Column)을 추가한다. |
| 같은 구조의 결과를 합친다. | 공통 Key를 기준으로 테이블을 연결한다. |
| 컬럼 개수가 같아야 한다. | 컬럼 개수가 달라도 된다. |

---

# 🎯 핵심 정리

- UNION : 중복 제거 후 합치기
- UNION ALL : 중복 포함하여 합치기
- 컬럼 개수와 순서가 같아야 한다.
- 데이터 타입이 서로 호환되어야 한다.

---

# 🧠 오늘 배운 개념

- UNION
- UNION ALL
- DISTINCT와의 차이
- JOIN과의 차이

---

# 📌 실무 TIP

UNION은 중복을 제거하기 때문에 추가적인 연산이 발생한다.

데이터 중복을 제거할 필요가 없다면 UNION ALL을 사용하는 것이 일반적으로 더 빠르며, 대용량 데이터 처리에서도 자주 활용된다.

---

# 📊 실무 분석 포인트

퍼포먼스 마케팅에서는 네이버 광고와 구글 광고 데이터를 각각 저장한 뒤, 하나의 분석 결과로 합쳐 전체 성과를 확인하는 경우가 많다.

이처럼 **동일한 구조의 데이터를 하나로 통합하여 분석할 때 UNION 또는 UNION ALL을 활용**한다.

---

# 🎯 한 줄 정리

> UNION은 여러 SELECT 결과를 하나로 합치는 문법이며, 중복 제거 여부에 따라 UNION과 UNION ALL을 선택한다.