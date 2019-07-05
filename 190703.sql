-- SELECT 구문
SELECT *
FROM employees;


-- employees 테이블로부터 아이디, 이름, 성을 조회하는 질의문
SELECT employee_id, first_name, last_name
FROM employees;


-- 주석처리 방법
/*
여러줄을
주석처리
하는 방법
*/


-- 급여순(오름차순)으로 직원의 이름과 급여를 정렬
SELECT last_name AS 이름, salary
FROM employees
ORDER BY salary;


-- 급여순(내림차순)으로 직원의 이름과 급여를 정렬
    -- AS 생략가능
SELECT last_name 이름, salary
FROM employees
ORDER BY salary DESC;


-- 별칭순으로 직원의 이름과 급여를 정렬
SELECT last_name 이름, salary
FROM employees
ORDER BY "이름";


-- 여러 속성을 이용한 정렬
    -- 부서ID 순으로 정렬, 부서 ID가 같으면 급여순 정렬, 급여까지 같으면 이름순 정렬
SELECT employee_id, last_name, department_id, salary
FROM employees
ORDER BY department_id, salary DESC, last_name;


-- 연봉 100달러 인상할 경우의 예상연봉
SELECT last_name, 12*salary+100
FROM employees;


-- 연산 우선순위를 다르게 함
SELECT last_name, 12*(salary+100)
FROM employees;


-- 연산하는 값 중 하나라도 NULL값을 가지면 연산 결과는 무조건 NULL
SELECT last_name, 12 * salary * commission_pct
FROM employees;


-- 연결연산자 || : 컬럼 내의 데이터를 결합
    -- 예제1
    SELECT last_name ||' '|| first_name AS "Name"
    FROM employees;
    
    -- 예제2
    SELECT last_name ||' 은(는) 부서 '|| department_id || '에서 근무합니다.' AS "근무부서확인"
    FROM employees;


-- 중복 행 제거 DISTINCT
SELECT DISTINCT department_id
FROM employees;


-- 조건절 WHERE
    -- 예제1 : 부서ID가 90인 직원의 목록
    SELECT employee_id, last_name, department_id
    FROM employees
    WHERE department_id = 90;
    
    -- 예제2 : 성이 King인 직원 호출
    SELECT employee_id, first_name, last_name, job_id
    FROM employees
    WHERE last_name LIKE 'King';


-- 비교연산자 LIKE
    -- 예제3 : 성이 K로 시작하는 모든 직원 호출 (뒤에오는 글자수는 상관없음)
    SELECT employee_id, first_name, last_name, job_id
    FROM employees
    WHERE last_name LIKE 'K%';
    
    -- 예제3 : 성의 2번째 글짜가 a인 직원 호출 (뒤에오는 글자수는 상관없음)
    SELECT employee_id, first_name, last_name, job_id
    FROM employees
    WHERE last_name LIKE '_a%';
    
    
-- 비교연산자
    -- 예제1 : 급여가 2500 이상인 직원 호출
    SELECT employee_id, last_name, salary
    FROM employees
    WHERE salary >= 2500;

    -- 예제2 : 급여가 2500~3000인 직원 호출(1) - 연산자 AND 사용
    SELECT employee_id, last_name, salary
    FROM employees
    WHERE salary >= 2500 AND salary <=3000;
    
    -- 예제3 : 급여가 2500~3000인 직원 호출(2) - 연산자 BETWEEN과 AND 사용
    -- 예제2보다 효율적!
    SELECT employee_id, last_name, salary
    FROM employees
    WHERE salary BETWEEN 2500 AND 3000;
    
    -- 예제4 : 급여가 2400 또는 2500 또는 3000인 직원 호출 - 연산자 OR 사용
    SELECT employee_id, last_name, salary
    FROM employees
    WHERE salary=2400 OR salary=2500 OR salary=3000;
    
    -- 예제5 : 급여가 2400 또는 2500 또는 3000인 직원 호출 - 연산자 IN 사용
    -- 예제4보다 효율적!
    SELECT employee_id, last_name, salary
    FROM employees
    WHERE salary IN (2400,2500,3000);
    

-- 연산자 IS NULL
SELECT employee_id, last_name, commission_pct
FROM employees
WHERE commission_pct IS NULL;


--문자함수
    --LOWER
    SELECT LOWER(last_name), last_name
    FROM employees;

    --CONCAT : 문자들을 합쳐줌
    SELECT CONCAT(first_name, last_name)
    FROM employees;
    
    --SUBSTR : 문자를 발췌
    --LENGTH : 문자의 수를 알려줌
    --INSTR : 문자열 중에 해당 문자가 몇번째에 있는지 알려줌
    
    -- LPAD : 급여를 10까지 표시해라, 빈 칸은 *로 표시
    SELECT last_name, LPAD(salary, 10, '*')
    FROM employees;
    
--날짜함수
    --TO_CHAR
    SELECT last_name, hire_date, TO_CHAR(hire_date, 'yyyymmdd')
    FROM employees;
    
    --TO_CHAT 예제2 : 천의 자리 표시
    SELECT department_id, TO_CHAR(ROUND(AVG(salary), 3), '999,999')
    FROM employees
    GROUP BY department_id;
    
    --날짜 포맷의 단위
    SELECT last_name, TO_CHAR(hire_date, 'yyyy-month-dd(dy)')
    FROM employees;


--숫자함수
    --반올림 ROUND
    SELECT department_id, ROUND(AVG(salary), 0)
    FROM employees
    GROUP BY department_id ;
    
    
--일반함수
    --NVL(a,b) : a의 값이 NULL이면 b로 대체
    SELECT last_name, NVL(manager_id, 999) "배치부서"
    FROM employees;
    
    --NVL2(a,b,c) : a의 값이 NULL이 아니면 b를 출려갛고 NULL이면 c를 출력
    SELECT employee_id, last_name, manager_id, NVL2(manager_id, '부서있음', '부서없음')
    FROM employees;
    
    --LENGTH
    SELECT first_name, last_name, NULLIF(LENGTH(first_name), LENGTH(last_name))name
    FROM employees
    WHERE last_name = 'Chen';
    
    --ROWNUM : 자료를 일부분만 출력 (ex. 게시판 최대 글 수 등)
    SELECT first_name, last_name
    FROM employees
    WHERE ROWNUM <= 10;

    
--함수 중첩
SELECT employee_id, last_name, NVL (TO_CHAR(manager_id), ‘관리자없음’)
FROM employees ;
    
    
--가상 테이블 DUAL TABLE
SELECT 5*4
FROM dual;


--그룹함수
    --1. 숫자 데이터
    SELECT AVG(salary), SUM(salary), MAX(salary), MIN(salary)
    FROM employees
    WHERE department_id = 90;
    
    --2. 날짜 데이터
    SELECT MAX(hire_date), MIN(hire_date)
    FROM employees ;
    
    --3. COUNT 사용 : 일정 조건에서 일정 값을 세기
    SELECT COUNT(employee_id)
    FROM employees
    WHERE department_id = 60 ;
    
    --4. 그룹함수에 NULL 포함
    SELECT AVG(commission_pct)
    FROM employees ;
    
    --5. 그룹함수에 NULL 미포함
    SELECT AVG (NVL (commission_pct, 0))
    FROM employees ;
    
-- ** GROUP BY의 특징 ** 
    --GROUP BY 절을 생략해서 잘못된 경우
    SELECT job_id, AVG(salary)
    FROM employees
    --GROUP BY job_id ; (SELECT 이후에 들어가는 키값 중 하나를 넣어야 함)
    
    --GROUP에 대한 제한은 HAVING절에 제시해야 함
    SELECT job_id, AVG(salary)
    FROM employees
    GROUP BY job_id
    HAVING AVG(salary) > 4000 ;
    
    
--테이블 결합 Join
    --Cross Join : 모든 속성을 무조건 합침. 조인한 테이블의 튜플 수는 각 테이블의 튜플값의 곱.
    SELECT *
    FROM countries, regions;
    
    --Inner Join(Equi Join)
        --Equi Join : 서로 다른 테이블 안에 있는 공통속성이 같은 것끼리 함침 (교집합)
        SELECT c.country_name, r.region_name
        FROM countries c, regions r
        WHERE c.region_id = r.region_id
        ORDER BY country_name;
        
        --Equi Join 예제2 : 테이블 조인 후 조건 달아 검색
        SELECT e.employee_id, e.last_name, e.department_id, 
           d.department_id, d.department_name 
        FROM employees e, departments d
        WHERE e.department_id = d.department_id
              AND last_name = 'King';
            
        --Equi Join 예제3 : 3개 테이블 조인
        SELECT e.last_name, e.department_id, d.department_id,
               d.department_name, d.location_id, l.location_id, l.city
        FROM employees e, departments d, locations l
        WHERE e.department_id = d.department_id
              AND d.location_id = l.location_id ;
          
SELECT last_name, department_name
FROM employees JOIN departments
USING (department_id);
          
    --Outer Join
        --Left Join : 왼쪽 테이블 값 전부 보여주고 오른쪽에는 매칭되는 값 없으면 NULL 출력
        SELECT e.first_name, e.last_name, e.department_id, d.department_name
        FROM employees e
        LEFT OUTER JOIN departments d
        ON (e.department_id = d.department_id);
        
        --Right Join : 오른쪽 테이블 값 전부 보여주고 왼쪽에는 매칭되는 값 없으면 NULL 출력
        SELECT e.last_name, e.department_id, d.department_name
        FROM employees e
        RIGHT OUTER JOIN departments d
        ON (e.department_id = d.department_id);
        
    --Outer Join에서 ON과 WHERE의 차이점?
        
SELECT e.last_name, d.department_name
FROM employees e JOIN departments d
ON (e.department_id = d.department_id);

SELECT *
FROM employees NATURAL JOIN departments ;
