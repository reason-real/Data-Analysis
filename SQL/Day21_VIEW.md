# Day21 - VIEW

> 📅 Study Date : 2026.08.05
>
> 📖 Topic : VIEW

---

# 📌 학습 목표

- VIEW의 개념과 역할을 이해한다.
- VIEW 생성, 조회, 삭제 문법을 익힌다.
- 실무에서 VIEW를 사용하는 이유를 이해한다.

---

# 📚 VIEW란?

VIEW는 **가상 테이블(Virtual Table)** 이다.

실제 데이터를 새로 저장하는 것이 아니라, 하나의 `SELECT` 문을 저장하여 테이블처럼 사용할 수 있는 객체이다.

복잡한 SQL을 간단하게 재사용하거나, 필요한 데이터만 공유할 때 자주 활용된다.

---

# 📖 기본 문법

## 1. VIEW 생성

```sql
CREATE VIEW employee_salary_view AS
SELECT name, salary
FROM employees;
```

---

## 2. VIEW 조회

```sql
SELECT *
FROM employee_salary_view;
```

---

## 3. VIEW 삭제

```sql
DROP VIEW employee_salary_view;
```

---

# 📊 VIEW와 TABLE의 차이

| TABLE | VIEW |
|-------|------|
| 실제 데이터를 저장한다. | 데이터를 저장하지 않고 SELECT 결과를 보여준다. |
| 원본 데이터를 관리한다. | 원본 테이블을 참조한다. |
| INSERT, UPDATE, DELETE가 가능하다. | 주로 조회(SELECT) 목적으로 사용된다. |

---

# 💼 실무 예제 1

급여가 5,000 이상인 직원만 조회하는 VIEW 생성

```sql
CREATE VIEW high_salary_employee AS
SELECT name, salary
FROM employees
WHERE salary >= 5000;
```

조회

```sql
SELECT *
FROM high_salary_employee;
```

---

# 💼 실무 예제 2

광고 데이터에서 자주 사용하는 컬럼만 조회하는 VIEW 생성

```sql
CREATE VIEW ad_summary AS
SELECT campaign_name,
       conversion_count,
       cost
FROM ad_performance;
```

조회

```sql
SELECT *
FROM ad_summary;
```

---

# 🎯 실무에서 VIEW를 사용하는 이유

### 1. 복잡한 SQL을 단순하게 만들기

자주 사용하는 SELECT 문을 저장하여 반복 작성하지 않아도 된다.

### 2. 보안

원본 테이블 전체를 공유하지 않고 필요한 컬럼만 제공할 수 있다.

### 3. 재사용성

여러 사용자가 동일한 조회 결과를 일관되게 사용할 수 있다.

---

# 💡 면접 포인트

**Q. VIEW는 데이터를 저장하나요?**

A. 아니요.

VIEW는 데이터를 별도로 저장하지 않으며, 원본 테이블을 참조하여 SELECT 결과를 보여주는 가상 테이블입니다.

---

# 📌 실무 TIP

분석 업무에서는 복잡한 JOIN이나 집계 쿼리를 VIEW로 만들어두면,
반복적인 분석 작업을 훨씬 빠르고 일관성 있게 수행할 수 있다.

---

# 📝 핵심 정리

- VIEW는 가상 테이블이다.
- SELECT 문을 저장하여 재사용할 수 있다.
- 데이터를 새로 저장하지 않는다.
- 복잡한 SQL을 단순화할 수 있다.
- 필요한 데이터만 공유하여 보안을 강화할 수 있다.

---

# 🚀 한 줄 정리

> VIEW는 **자주 사용하는 SELECT 문을 저장하여 재사용하는 가상 테이블**이며, 실무에서는 **재사용성, 보안, 유지보수성**을 높이기 위해 활용한다.