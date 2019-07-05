/*
<��������>
- ���������� ������������ ���� �����
- �Ұ�ȣ�� ���ξ� ��
*/

-- 1. ���� : Kochhar���� ���ų� ���� �޿��� �޴� ������ ã�ƶ�

    -- �������� �̻�� ��
        -- 1. ���� 'Kochhar'�� ����� �޿��� ã��
        SELECT salary
        FROM employees
        WHERE last_name = 'Kochhar';
        
        -- 2. �޿��� 17000������ Ȯ��
        -- 3. �޿��� 17000���� ���ų� ���� ��� ã��
        SELECT first_name, last_name, salary
        FROM employees
        WHERE salary>=17000;
    
    
        -- �������� ��� ��
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
    -- ������ �Ӽ����� ���� ������ �׷� �����(ex.�μ���, ������)
    -- �׷��Լ��� GROUP BY������ ���ǿ� �´� ���� �̾Ƴ�
    SELECT department_id, MIN (salary)
    FROM employees
    GROUP BY department_id;
    
    
    
-- ����2. �μ��� ���� �޿��� ����ϵ� 60�μ��� ���� �޿����ٴ� ū ���� �˻��϶�.(Having������ ���� ���� ���)
    -- �������� �̻�� ���
        -- 1. �μ� ���̵� 60�� �μ��� �޿� �ּҾ��� ã�ƶ�
        SELECT MIN (salary)
        FROM employees
        WHERE department_id = 60;
        
        -- 2. �μ��� �����޿� �˻�
        SELECT department_id, MIN (salary) 
        FROM employees
        GROUP BY department_id;
    
    -- �������� �̿��� ���
    SELECT department_id, MIN (salary) 
    FROM employees
    GROUP BY department_id
    HAVING MIN (salary) > (
        SELECT MIN (salary)
        FROM employees
        WHERE department_id = 60);
        
        
--������ �������� : ���������� ������� 2�� �̻�
    SELECT DISTINCT department_id
    FROM employees;
    
    --����1 : �μ��� �ִ� �޿��� ���� �ݾ��� �޿��� �޴� ������ �̸��� �޿����� ��ȸ�϶�.
    SELECT last_name, salary
    FROM employees
    WHERE salary IN (
        SELECT MAX(salary)
        FROM employees
        GROUP BY department_id);
        
    --����2 : ������ IT_PROG�� �������� �޴� �޿� �� �ִ� �޿� ���� ���� �޿��� �޴� Ÿ���� ������ �̸��� ���� �޿��� �� �˻��϶�
    --(ANY ������ ����� ��)
    SELECT last_name, job_id, salary 
    FROM employees
    WHERE salary < ANY(
          SELECT salary
          FROM employees
          WHERE job_id = 'IT_PROG') 
    AND job_id <> 'IT_PROG';
    
    
    