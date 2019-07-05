/*
<서브쿼리>
- 서브쿼리가 메인쿼리보다 먼저 수행됨
- 소괄호로 감싸야 함
*/

-- 1. 예제 : Kochhar보다 많거나 같은 급여를 받는 직원을 찾아라

    -- 서브쿼리 미사용 시
        -- 1. 성이 'Kochhar'인 사람의 급여를 찾음
        SELECT salary
        FROM employees
        WHERE last_name = 'Kochhar';
        
        -- 2. 급여가 17000원임을 확인
        -- 3. 급여가 17000보다 많거나 같은 사원 찾기
        SELECT first_name, last_name, salary
        FROM employees
        WHERE salary>=17000;
    
    
        -- 서브쿼리 사용 시
        SELECT first_name, last_name, salary
        FROM employees
        WHERE salary >= (
              SELECT salary 
              FROM employees
              WHERE last_name = 'Kochhar')
        ORDER BY first_name;
    
    
    SELECT last_name, department_id, salary 
    FROM employees
    WHERE department_id = (
          SELECT department_id
          FROM employees
          WHERE employee_id = 101)
    AND salary > (
          SELECT salary
          FROM employees
          WHERE employee_id = 141);
          
    SELECT first_name, last_name, salary 
    FROM employees
    WHERE salary = (
         SELECT MAX (salary)
         FROM employees);
         
    SELECT department_id, MIN (salary) 
    FROM employees
    GROUP BY department_id
    HAVING MIN (salary) > (
        SELECT MIN (salary)
        FROM employees
        WHERE department_id = 60);
    
--GROUP BY
    -- 선택한 속성에서 같은 값끼리 그룹 만들기(ex.부서별, 지역별)
    -- 그룹함수는 GROUP BY절에서 조건에 맞는 값을 뽑아냄
    SELECT department_id, MIN (salary)
    FROM employees
    GROUP BY department_id;
    
    
    
-- 예제2. 부서별 최저 급여를 출력하되 60부서의 최저 급여보다는 큰 값만 검색하라.(Having절에서 서브 쿼리 사용)
    -- 서브쿼리 미사용 답안
        -- 1. 부서 아이디가 60인 부서의 급여 최소액을 찾아라
        SELECT MIN (salary)
        FROM employees
        WHERE department_id = 60;
        
        -- 2. 부서별 최저급여 검색
        SELECT department_id, MIN (salary) 
        FROM employees
        GROUP BY department_id;
    
    -- 서브쿼리 이용한 답안
    SELECT department_id, MIN (salary) 
    FROM employees
    GROUP BY department_id
    HAVING MIN (salary) > (
        SELECT MIN (salary)
        FROM employees
        WHERE department_id = 60);
        
        
--다중행 서브쿼리 : 서브쿼리의 결과값이 2개 이상
    SELECT DISTINCT department_id
    FROM employees;
    
    --예제1 : 부서별 최대 급여와 같은 금액의 급여를 받는 직원의 이름과 급여액을 조회하라.
    SELECT last_name, salary
    FROM employees
    WHERE salary IN (
        SELECT MAX(salary)
        FROM employees
        GROUP BY department_id);
        
    --예제2 : 직종이 IT_PROG인 직원들이 받는 급여 중 최대 급여 보다 적은 급여를 받는 타직종 직원의 이름과 직종 급여액 을 검색하라
    --(ANY 연산자 사용할 것)
    SELECT last_name, job_id, salary 
    FROM employees
    WHERE salary < ANY(
          SELECT salary
          FROM employees
          WHERE job_id = 'IT_PROG') 
    AND job_id <> 'IT_PROG';
    
    
    