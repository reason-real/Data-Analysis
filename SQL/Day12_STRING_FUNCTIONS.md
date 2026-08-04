# Day12 - String Functions

> 📅 Study Date : 2026.07.21
>
> 📖 Topic : SQL String Functions

---

# 📌 학습 목표

- 문자열 함수의 역할과 활용 방법을 이해한다.
- UPPER(), LOWER(), LENGTH(), CONCAT() 함수를 사용할 수 있다.
- 문자열 함수를 활용하여 데이터를 보기 쉽게 가공한다.

---

# 📚 핵심 개념

## 1. UPPER()

문자열을 모두 **대문자**로 변환한다.

```sql
SELECT UPPER(name)
FROM employees;
```

---

## 2. LOWER()

문자열을 모두 **소문자**로 변환한다.

```sql
SELECT LOWER(email)
FROM employees;
```

---

## 3. LENGTH()

문자열의 길이를 반환한다.

```sql
SELECT LENGTH(name)
FROM employees;
```

---

## 4. CONCAT()

여러 문자열을 하나의 문자열로 연결한다.

```sql
SELECT CONCAT(name, ' (', department, ')') AS employee_info
FROM employees;
```

출력 예시

```
Kim (Finance)
Lee (Marketing)
Park (HR)
```

---

# 💼 실무 활용

문자열 함수는 데이터를 보기 좋게 가공할 때 자주 사용한다.

예를 들어

- 고객 이름 대문자 통일
- 이메일 형식 통일
- 이름과 부서를 하나의 컬럼으로 출력
- 보고서용 표시 형식 생성

---

# 💡 실무 예제

직원 이름과 부서를 하나의 컬럼으로 출력하기

```sql
SELECT CONCAT(name, ' - ', department) AS employee_info
FROM employees;
```

결과

```
Kim - Finance
Lee - Marketing
Park - HR
```

---

# 🎯 핵심 정리

- UPPER() : 대문자 변환
- LOWER() : 소문자 변환
- LENGTH() : 문자열 길이 반환
- CONCAT() : 문자열 연결

---

# 🧠 오늘 배운 개념

- UPPER()
- LOWER()
- LENGTH()
- CONCAT()

---

# 📌 실무 TIP

실무에서는 CONCAT()을 활용하여 보고서에서 보기 쉬운 형태의 컬럼을 많이 만든다.

또한 UPPER()와 LOWER()를 사용하여 이메일이나 아이디의 대소문자를 통일하는 경우도 많다.

---

# 🎯 한 줄 정리

> 문자열 함수는 데이터를 보기 쉽게 가공하고, 보고서 작성과 데이터 전처리에 가장 많이 사용하는 SQL 함수이다.