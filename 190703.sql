-- SELECT ����
SELECT *
FROM employees;


-- employees ���̺�κ��� ���̵�, �̸�, ���� ��ȸ�ϴ� ���ǹ�
SELECT employee_id, first_name, last_name
FROM employees;


-- �ּ�ó�� ���
/*
��������
�ּ�ó��
�ϴ� ���
*/


-- �޿���(��������)���� ������ �̸��� �޿��� ����
SELECT last_name AS �̸�, salary
FROM employees
ORDER BY salary;


-- �޿���(��������)���� ������ �̸��� �޿��� ����
    -- AS ��������
SELECT last_name �̸�, salary
FROM employees
ORDER BY salary DESC;


-- ��Ī������ ������ �̸��� �޿��� ����
SELECT last_name �̸�, salary
FROM employees
ORDER BY "�̸�";


-- ���� �Ӽ��� �̿��� ����
    -- �μ�ID ������ ����, �μ� ID�� ������ �޿��� ����, �޿����� ������ �̸��� ����
SELECT employee_id, last_name, department_id, salary
FROM employees
ORDER BY department_id, salary DESC, last_name;


-- ���� 100�޷� �λ��� ����� ���󿬺�
SELECT last_name, 12*salary+100
FROM employees;


-- ���� �켱������ �ٸ��� ��
SELECT last_name, 12*(salary+100)
FROM employees;


-- �����ϴ� �� �� �ϳ��� NULL���� ������ ���� ����� ������ NULL
SELECT last_name, 12 * salary * commission_pct
FROM employees;


-- ���Ῥ���� || : �÷� ���� �����͸� ����
    -- ����1
    SELECT last_name ||' '|| first_name AS "Name"
    FROM employees;
    
    -- ����2
    SELECT last_name ||' ��(��) �μ� '|| department_id || '���� �ٹ��մϴ�.' AS "�ٹ��μ�Ȯ��"
    FROM employees;


-- �ߺ� �� ���� DISTINCT
SELECT DISTINCT department_id
FROM employees;


-- ������ WHERE
    -- ����1 : �μ�ID�� 90�� ������ ���
    SELECT employee_id, last_name, department_id
    FROM employees
    WHERE department_id = 90;
    
    -- ����2 : ���� King�� ���� ȣ��
    SELECT employee_id, first_name, last_name, job_id
    FROM employees
    WHERE last_name LIKE 'King';


-- �񱳿����� LIKE
    -- ����3 : ���� K�� �����ϴ� ��� ���� ȣ�� (�ڿ����� ���ڼ��� �������)
    SELECT employee_id, first_name, last_name, job_id
    FROM employees
    WHERE last_name LIKE 'K%';
    
    -- ����3 : ���� 2��° ��¥�� a�� ���� ȣ�� (�ڿ����� ���ڼ��� �������)
    SELECT employee_id, first_name, last_name, job_id
    FROM employees
    WHERE last_name LIKE '_a%';
    
    
-- �񱳿�����
    -- ����1 : �޿��� 2500 �̻��� ���� ȣ��
    SELECT employee_id, last_name, salary
    FROM employees
    WHERE salary >= 2500;

    -- ����2 : �޿��� 2500~3000�� ���� ȣ��(1) - ������ AND ���
    SELECT employee_id, last_name, salary
    FROM employees
    WHERE salary >= 2500 AND salary <=3000;
    
    -- ����3 : �޿��� 2500~3000�� ���� ȣ��(2) - ������ BETWEEN�� AND ���
    -- ����2���� ȿ����!
    SELECT employee_id, last_name, salary
    FROM employees
    WHERE salary BETWEEN 2500 AND 3000;
    
    -- ����4 : �޿��� 2400 �Ǵ� 2500 �Ǵ� 3000�� ���� ȣ�� - ������ OR ���
    SELECT employee_id, last_name, salary
    FROM employees
    WHERE salary=2400 OR salary=2500 OR salary=3000;
    
    -- ����5 : �޿��� 2400 �Ǵ� 2500 �Ǵ� 3000�� ���� ȣ�� - ������ IN ���
    -- ����4���� ȿ����!
    SELECT employee_id, last_name, salary
    FROM employees
    WHERE salary IN (2400,2500,3000);
    

-- ������ IS NULL
SELECT employee_id, last_name, commission_pct
FROM employees
WHERE commission_pct IS NULL;


--�����Լ�
    --LOWER
    SELECT LOWER(last_name), last_name
    FROM employees;

    --CONCAT : ���ڵ��� ������
    SELECT CONCAT(first_name, last_name)
    FROM employees;
    
    --SUBSTR : ���ڸ� ����
    --LENGTH : ������ ���� �˷���
    --INSTR : ���ڿ� �߿� �ش� ���ڰ� ���°�� �ִ��� �˷���
    
    -- LPAD : �޿��� 10���� ǥ���ض�, �� ĭ�� *�� ǥ��
    SELECT last_name, LPAD(salary, 10, '*')
    FROM employees;
    
--��¥�Լ�
    --TO_CHAR
    SELECT last_name, hire_date, TO_CHAR(hire_date, 'yyyymmdd')
    FROM employees;
    
    --TO_CHAT ����2 : õ�� �ڸ� ǥ��
    SELECT department_id, TO_CHAR(ROUND(AVG(salary), 3), '999,999')
    FROM employees
    GROUP BY department_id;
    
    --��¥ ������ ����
    SELECT last_name, TO_CHAR(hire_date, 'yyyy-month-dd(dy)')
    FROM employees;


--�����Լ�
    --�ݿø� ROUND
    SELECT department_id, ROUND(AVG(salary), 0)
    FROM employees
    GROUP BY department_id ;
    
    
--�Ϲ��Լ�
    --NVL(a,b) : a�� ���� NULL�̸� b�� ��ü
    SELECT last_name, NVL(manager_id, 999) "��ġ�μ�"
    FROM employees;
    
    --NVL2(a,b,c) : a�� ���� NULL�� �ƴϸ� b�� ������� NULL�̸� c�� ���
    SELECT employee_id, last_name, manager_id, NVL2(manager_id, '�μ�����', '�μ�����')
    FROM employees;
    
    --LENGTH
    SELECT first_name, last_name, NULLIF(LENGTH(first_name), LENGTH(last_name))name
    FROM employees
    WHERE last_name = 'Chen';
    
    --ROWNUM : �ڷḦ �Ϻκи� ��� (ex. �Խ��� �ִ� �� �� ��)
    SELECT first_name, last_name
    FROM employees
    WHERE ROWNUM <= 10;

    
--�Լ� ��ø
SELECT employee_id, last_name, NVL (TO_CHAR(manager_id), �������ھ�����)
FROM employees ;
    
    
--���� ���̺� DUAL TABLE
SELECT 5*4
FROM dual;


--�׷��Լ�
    --1. ���� ������
    SELECT AVG(salary), SUM(salary), MAX(salary), MIN(salary)
    FROM employees
    WHERE department_id = 90;
    
    --2. ��¥ ������
    SELECT MAX(hire_date), MIN(hire_date)
    FROM employees ;
    
    --3. COUNT ��� : ���� ���ǿ��� ���� ���� ����
    SELECT COUNT(employee_id)
    FROM employees
    WHERE department_id = 60 ;
    
    --4. �׷��Լ��� NULL ����
    SELECT AVG(commission_pct)
    FROM employees ;
    
    --5. �׷��Լ��� NULL ������
    SELECT AVG (NVL (commission_pct, 0))
    FROM employees ;
    
-- ** GROUP BY�� Ư¡ ** 
    --GROUP BY ���� �����ؼ� �߸��� ���
    SELECT job_id, AVG(salary)
    FROM employees
    --GROUP BY job_id ; (SELECT ���Ŀ� ���� Ű�� �� �ϳ��� �־�� ��)
    
    --GROUP�� ���� ������ HAVING���� �����ؾ� ��
    SELECT job_id, AVG(salary)
    FROM employees
    GROUP BY job_id
    HAVING AVG(salary) > 4000 ;
    
    
--���̺� ���� Join
    --Cross Join : ��� �Ӽ��� ������ ��ħ. ������ ���̺��� Ʃ�� ���� �� ���̺��� Ʃ�ð��� ��.
    SELECT *
    FROM countries, regions;
    
    --Inner Join(Equi Join)
        --Equi Join : ���� �ٸ� ���̺� �ȿ� �ִ� ����Ӽ��� ���� �ͳ��� ��ħ (������)
        SELECT c.country_name, r.region_name
        FROM countries c, regions r
        WHERE c.region_id = r.region_id
        ORDER BY country_name;
        
        --Equi Join ����2 : ���̺� ���� �� ���� �޾� �˻�
        SELECT e.employee_id, e.last_name, e.department_id, 
           d.department_id, d.department_name 
        FROM employees e, departments d
        WHERE e.department_id = d.department_id
              AND last_name = 'King';
            
        --Equi Join ����3 : 3�� ���̺� ����
        SELECT e.last_name, e.department_id, d.department_id,
               d.department_name, d.location_id, l.location_id, l.city
        FROM employees e, departments d, locations l
        WHERE e.department_id = d.department_id
              AND d.location_id = l.location_id ;
          
SELECT last_name, department_name
FROM employees JOIN departments
USING (department_id);
          
    --Outer Join
        --Left Join : ���� ���̺� �� ���� �����ְ� �����ʿ��� ��Ī�Ǵ� �� ������ NULL ���
        SELECT e.first_name, e.last_name, e.department_id, d.department_name
        FROM employees e
        LEFT OUTER JOIN departments d
        ON (e.department_id = d.department_id);
        
        --Right Join : ������ ���̺� �� ���� �����ְ� ���ʿ��� ��Ī�Ǵ� �� ������ NULL ���
        SELECT e.last_name, e.department_id, d.department_name
        FROM employees e
        RIGHT OUTER JOIN departments d
        ON (e.department_id = d.department_id);
        
    --Outer Join���� ON�� WHERE�� ������?
        
SELECT e.last_name, d.department_name
FROM employees e JOIN departments d
ON (e.department_id = d.department_id);

SELECT *
FROM employees NATURAL JOIN departments ;
