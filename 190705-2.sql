-- ���̺� ���� �� �� �� �ִ� ���� ����

        -- ���̺� ���� �� ���������� ���� ����.
        CREATE TABLE ex (
                id NUMBER(3),
                name VARCHAR(30),
                salary NUMBER(7)
        );
        
        
        -- ���̺� ����. id �Ӽ��� �⺻Ű ���������� ��.
        CREATE TABLE ex (
                id NUMBER(3),
                name VARCHAR(30),
                salary NUMBER(7),
                PRIMARY KEY(id)
        );
        
        
        -- ���̺� ����. id �Ӽ��� �⺻Ű, name �Ӽ��� UNIQUE ����.
        CREATE TABLE ex (
                id NUMBER(3),
                name VARCHAR(30) UNIQUE,
                salary NUMBER(7),
                PRIMARY KEY(id)
        );
        
        
        -- ���̺� ����. id �Ӽ��� �⺻Ű, name �Ӽ��� UNIQUE, salary�� CHECK ����.
        CREATE TABLE ex (
                id NUMBER(3),
                name VARCHAR(30) UNIQUE,
                salary NUMBER(7) CHECK(salary BETWEEN 300 AND 1000),
                PRIMARY KEY(id)
        );
        
        
        -- ���̺� ����. ���������� �̸� ����
        CREATE TABLE ex (
                id NUMBER(3),
                name VARCHAR(30) CONSTRAINT CNAME_unique UNIQUE,
                salary NUMBER(7) CONSTRAINT '' CHECK(salary BETWEEN 300 AND 1000),
                PRIMARY KEY(id)
        );
        
        
        -- ���� ���������� ��� Ȯ��
        SELECT CONSTRAINT_NAME FROM USER_CONSTRAINTS;
        
        
        -- �������� �����غ���        
        INSERT INTO ex VALUES(1, 'ȫ�浿', 300);
        INSERT INTO ex VALUES(2, '�ڹ���', 2000);
        INSERT INTO ex VALUES(3, '������', 500);
        
        

-----------------------------------------------------------------------------------------------
-- ���̺� �����ϱ�

        -- ���̺� �̸� ����
        RENAME example TO ex;
        
        
        -- ���̺� �÷� �߰�
            -- ALTER TABLE ADD(���ο��÷��̸�, Ÿ��)
         ALTER TABLE ex ADD(dept_id NUMBER(3));
        
        
        -- ���̺� �÷��� �Ӽ� �ٲٱ�
        ALTER TABLE ex MODIFY(name VARCHAR(50));
        
        
        -- ���̺��� �÷� ����
        ALTER TABLE ex DROP COLUMN dept_id;
        
        
        -- ���̺��� �÷� �̸� ����
        ALTER TABLE ex RENAME COLUMN salary TO pay;
        
        
        -- ���̺� �Ӽ� Ȯ��
        DESC ex;
        
        