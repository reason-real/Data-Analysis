# Day23 - Window Function (ROW_NUMBER, RANK, DENSE_RANK)

## 📚 학습 내용

오늘은 SQL의 Window Function(윈도우 함수)의 기본 개념과 순위 함수인 `ROW_NUMBER()`, `RANK()`, `DENSE_RANK()`를 학습하였다.

Window Function은 기존 데이터를 유지하면서 계산 결과를 함께 출력할 수 있다는 점에서 `GROUP BY`와 가장 큰 차이가 있다.

또한 Window Function은 반드시 `OVER()` 절과 함께 사용한다.

---

## ✅ Window Function

### 특징

- 기존 데이터를 유지한다.
- 계산 결과를 새로운 컬럼으로 추가한다.
- `OVER()` 절과 함께 사용한다.

기본 형태

```sql
SELECT
    column,
    function() OVER(...)
FROM table_name;
```

---

## ✅ ROW_NUMBER()

데이터를 정렬한 후 순차적으로 번호를 부여한다.

같은 값이 있어도 번호는 중복되지 않는다.

예시

```sql
SELECT
    name,
    salary,
    ROW_NUMBER() OVER(ORDER BY salary DESC) AS row_num
FROM employees;
```

예시 결과

| name | salary | row_num |
|------|--------:|---------:|
| A | 7000 | 1 |
| B | 6000 | 2 |
| C | 6000 | 3 |
| D | 5000 | 4 |

---

## ✅ RANK()

동일한 값은 같은 순위를 부여한다.

다음 순위는 건너뛴다.

예시 결과

| salary | rank |
|--------:|-----:|
|7000|1|
|6000|2|
|6000|2|
|5000|4|

---

## ✅ DENSE_RANK()

동일한 값은 같은 순위를 부여한다.

다음 순위를 건너뛰지 않는다.

예시 결과

| salary | dense_rank |
|--------:|-----------:|
|7000|1|
|6000|2|
|6000|2|
|5000|3|

---

## 📌 함수 비교

| 함수 | 공동 순위 | 번호 건너뜀 |
|------|:--------:|:-----------:|
| ROW_NUMBER() | ❌ | - |
| RANK() | ✅ | ✅ |
| DENSE_RANK() | ✅ | ❌ |

---

## 💡 실무 활용 사례

- 직원 급여 순위
- 광고 전환 수 순위
- 상품 매출 순위
- 고객 구매 순위
- 인기 콘텐츠 순위

---

## ✨ 핵심 정리

- Window Function은 기존 데이터를 유지하면서 계산한다.
- Window Function은 `OVER()`와 함께 사용한다.
- `ROW_NUMBER()`는 순차적으로 번호를 부여한다.
- `RANK()`는 공동 순위를 허용하며 다음 순위를 건너뛴다.
- `DENSE_RANK()`는 공동 순위를 허용하지만 다음 순위를 건너뛰지 않는다.