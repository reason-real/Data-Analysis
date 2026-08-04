# Day14 - Date Functions

> 📅 Study Date : 2026.08.04
>
> 📖 Topic : SQL Date Functions

---

# 📌 학습 목표

- 날짜와 시간을 다루는 주요 SQL 함수를 이해한다.
- YEAR(), MONTH(), NOW(), CURDATE()를 활용할 수 있다.
- 날짜 함수를 이용하여 기간별 데이터를 분석할 수 있다.

---

# 📚 핵심 개념

## 1. NOW()

현재 날짜와 시간을 반환한다.

```sql
SELECT NOW();
```

예시 결과

```
2026-08-04 14:35:20
```

---

## 2. CURDATE()

현재 날짜만 반환한다.

```sql
SELECT CURDATE();
```

예시 결과

```
2026-08-04
```

---

## 3. YEAR()

날짜에서 연도만 추출한다.

```sql
SELECT YEAR(order_date)
FROM orders;
```

---

## 4. MONTH()

날짜에서 월만 추출한다.

```sql
SELECT MONTH(order_date)
FROM orders;
```

---

# 💼 실무 활용

날짜 함수는 데이터 분석에서 가장 많이 사용하는 함수 중 하나이다.

대표적인 활용 사례는 다음과 같다.

- 연도별 매출 분석
- 월별 주문 건수 집계
- 오늘 가입한 회원 조회
- 최근 7일 데이터 분석
- 분기별 실적 분석

---

# 💡 실무 예제

2026년 7월 주문만 조회하기

```sql
SELECT *
FROM orders
WHERE YEAR(order_date) = 2026
  AND MONTH(order_date) = 7;
```

---

월별 주문 건수 조회하기

```sql
SELECT MONTH(order_date) AS order_month,
       COUNT(*) AS order_count
FROM orders
GROUP BY MONTH(order_date)
ORDER BY order_month;
```

---

# 📌 NOW()와 CURDATE()의 차이

| 함수 | 반환값 |
|------|--------|
| NOW() | 현재 날짜 + 현재 시간 |
| CURDATE() | 현재 날짜 |

---

# 🎯 핵심 정리

- NOW() : 현재 날짜와 시간
- CURDATE() : 현재 날짜
- YEAR() : 연도 추출
- MONTH() : 월 추출

---

# 🧠 오늘 배운 개념

- NOW()
- CURDATE()
- YEAR()
- MONTH()

---

# 📌 실무 TIP

날짜 함수는 매출 분석, 광고 성과 분석, 사용자 행동 분석 등 거의 모든 데이터 분석 업무에서 활용된다.

특히 YEAR()와 MONTH()를 함께 사용하면 월별·연도별 추이를 쉽게 분석할 수 있다.

---

# 🎯 한 줄 정리

> 날짜 함수는 시간의 흐름에 따른 데이터를 분석하기 위한 가장 기본적이고 중요한 SQL 함수이다.