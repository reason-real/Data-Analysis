# Day24 - PARTITION BY (Window Function)

## 📚 학습 내용

오늘은 Window Function의 핵심 문법인 `PARTITION BY`를 학습하였다.

`PARTITION BY`는 데이터를 그룹으로 나누어 계산하지만 원본 데이터는 그대로 유지한다는 점에서 `GROUP BY`와 가장 큰 차이가 있다.

주로 `ROW_NUMBER()`, `RANK()`, `DENSE_RANK()`와 함께 사용하여 그룹별 순위나 집계를 계산할 때 활용된다.

---

## ✅ PARTITION BY

### 특징

- 원본 데이터를 유지한다.
- 그룹별로 독립적인 계산을 수행한다.
- Window Function과 함께 사용한다.

기본 형태

```sql
SELECT
    column,
    function() OVER(
        PARTITION BY column
        ORDER BY column
    )
FROM table_name;
```

---

## ✅ ROW_NUMBER() + PARTITION BY

부서별 급여 순위를 계산하는 예제

```sql
SELECT
    name,
    department,
    salary,
    ROW_NUMBER() OVER(
        PARTITION BY department
        ORDER BY salary DESC
    ) AS dept_rank
FROM employees;
```

예시 결과

| name | department | salary | dept_rank |
|------|------------|--------:|----------:|
| 김철수 | 개발팀 | 7000 | 1 |
| 이영희 | 개발팀 | 6000 | 2 |
| 박민수 | 마케팅 | 5000 | 1 |
| 최지은 | 마케팅 | 4500 | 2 |

---

## ✅ RANK() + PARTITION BY

부서별 공동 순위를 계산할 수 있다.

```sql
SELECT
    name,
    department,
    salary,
    RANK() OVER(
        PARTITION BY department
        ORDER BY salary DESC
    ) AS dept_rank
FROM employees;
```

동일한 급여는 같은 순위를 가지며, 다음 순위는 건너뛴다.

---

## ✅ DENSE_RANK() + PARTITION BY

```sql
SELECT
    name,
    department,
    salary,
    DENSE_RANK() OVER(
        PARTITION BY department
        ORDER BY salary DESC
    ) AS dept_rank
FROM employees;
```

동일한 급여는 같은 순위를 가지며, 다음 순위는 건너뛰지 않는다.

---

## 📌 GROUP BY와 PARTITION BY 비교

| GROUP BY | PARTITION BY |
|----------|--------------|
| 데이터를 그룹으로 묶는다. | 그룹별로 계산을 수행한다. |
| 원본 데이터가 사라진다. | 원본 데이터를 유지한다. |
| 집계 결과만 반환한다. | 계산 결과를 새로운 컬럼으로 추가한다. |

---

## 💡 실무 활용 사례

- 부서별 급여 순위
- 플랫폼별 광고 성과 순위
- 지역별 매출 순위
- 카테고리별 인기 상품 순위
- 회원 등급별 구매 순위

---

## ✨ 핵심 정리

- `PARTITION BY`는 그룹별 계산을 수행하지만 원본 데이터는 유지한다.
- `PARTITION BY`는 `OVER()` 절 내부에서 사용한다.
- `ROW_NUMBER()`는 그룹별 순차 번호를 부여한다.
- `RANK()`는 공동 순위를 허용하며 다음 순위를 건너뛴다.
- `DENSE_RANK()`는 공동 순위를 허용하지만 다음 순위를 건너뛰지 않는다.
- `GROUP BY`는 집계 결과를 반환하고, `PARTITION BY`는 원본 데이터와 계산 결과를 함께 반환한다.