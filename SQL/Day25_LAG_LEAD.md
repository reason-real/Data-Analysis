# Day25 - LAG() & LEAD() (Window Function)

## 📚 학습 내용

오늘은 Window Function의 심화 문법인 `LAG()`와 `LEAD()`를 학습하였다.

두 함수는 이전 행 또는 다음 행의 값을 현재 행과 함께 조회할 수 있어 데이터의 변화와 추세를 분석할 때 자주 사용된다.

매출 증감, 광고 성과 비교, 전월 대비 분석 등 실무에서 매우 활용도가 높은 함수이다.

---

## ✅ LAG()

### 특징

- 이전 행의 값을 가져온다.
- `OVER()`와 함께 사용한다.
- 변화량 및 증감 분석에 자주 사용된다.

기본 문법

```sql
SELECT
    column,
    LAG(column)
        OVER(ORDER BY column)
FROM table_name;
```

---

## ✅ LEAD()

### 특징

- 다음 행의 값을 가져온다.
- 미래 데이터와 비교할 때 사용한다.

기본 문법

```sql
SELECT
    column,
    LEAD(column)
        OVER(ORDER BY column)
FROM table_name;
```

---

## ✅ LAG() 예제

월별 매출과 이전 달 매출 조회

```sql
SELECT
    month,
    sales,
    LAG(sales)
        OVER(ORDER BY month) AS prev_sales
FROM sales_data;
```

예시 결과

| month | sales | prev_sales |
|------|------:|-----------:|
| 1월 | 100 | NULL |
| 2월 | 150 | 100 |
| 3월 | 180 | 150 |
| 4월 | 170 | 180 |

---

## ✅ LEAD() 예제

월별 매출과 다음 달 매출 조회

```sql
SELECT
    month,
    sales,
    LEAD(sales)
        OVER(ORDER BY month) AS next_sales
FROM sales_data;
```

예시 결과

| month | sales | next_sales |
|------|------:|-----------:|
| 1월 | 100 | 150 |
| 2월 | 150 | 180 |
| 3월 | 180 | 170 |
| 4월 | 170 | NULL |

---

## ✅ 전월 대비 매출 증감 계산

```sql
SELECT
    month,
    sales,
    LAG(sales)
        OVER(ORDER BY month) AS prev_sales,
    sales - LAG(sales)
        OVER(ORDER BY month) AS diff_sales
FROM sales_data;
```

이전 달 매출과 비교하여 증가 또는 감소한 금액을 확인할 수 있다.

---

## 📌 LAG()와 LEAD() 비교

| LAG() | LEAD() |
|--------|---------|
| 이전 행 조회 | 다음 행 조회 |
| 전월 대비 분석 | 다음 기간 예측 및 비교 |
| 증감 분석 | 미래 데이터 비교 |

---

## 💡 실무 활용 사례

- 전월 대비 매출 증감 분석
- 광고 전환수 변화 분석
- 일별 방문자 수 변화 확인
- 고객 구매 패턴 비교
- 주식 및 금융 데이터의 전일 대비 등락 분석

---

## ✨ 핵심 정리

- `LAG()`는 이전 행의 값을 조회한다.
- `LEAD()`는 다음 행의 값을 조회한다.
- 두 함수 모두 `OVER()` 절과 함께 사용한다.
- `ORDER BY`를 기준으로 이전 또는 다음 데이터를 가져온다.
- 증감 분석, 추세 분석, 시계열 데이터 분석에서 자주 활용된다.