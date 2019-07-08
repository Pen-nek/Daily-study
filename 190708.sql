-- 190708

-- ## �����Լ�
-- NVL : NULL���� �ٸ� ������ ��ü�ؼ� ���. ���ڷ� ��ü�ؼ� ������ ���� ���� 
-- ROWNUM : �ڷḦ �Ϻκи� Ȯ��
-- �Է°����� ���ڰ� �ƴ� �÷��� ���� ���� ����

-- #### Tip | SELECT�� ó�� ����
-- FROM
-- ON
-- JOIN
-- WHERE
-- GROUP BY
-- HAVING
-- SELECT
-- DISTINCT
-- ORDER BY
-- TOP

-- ## ���� 204~217 ���� ��ȭ�ϱ�

-- > ABS : ���� ���ϱ�
---------------------------------------------------------------------------
-- ���� 4-1 -78�� +78�� ������ ���Ͻÿ�
SELECT ABS(-78), ABS(+78)
FROM dual;



---------------------------------------------------------------------------
-- ���� 4-2 4.875�� �Ҽ� ù° �ڸ����� �ݿø��� ���� ���Ͻÿ�
SELECT ROUND(4.875, 1)
FROM dual;



---------------------------------------------------------------------------
-- ���� 4-3 ���� ��� �ֹ� �ݾ��� ��� ������ �ݿø��� ���� ���Ͻÿ�
SELECT custid, ROUND(AVG(saleprice), -2)
FROM Orders
GROUP BY custid;



---------------------------------------------------------------------------
-- ���� 4-4 �������� �߱��� ���Ե� ������ �󱸷� ������ �� ���� ����� ���̽ÿ�
SELECT bookid, REPLACE(bookname, '�߱�', '��'), publisher, price
FROM Book;



---------------------------------------------------------------------------
-- ���� 4-5 �½��������� ������ ������ ����� ������ ���� ��, ����Ʈ ���� ���̽ÿ�
SELECT bookname, LENGTH(bookname) "���ڼ�", LENGTHB(bookname) "����Ʈ ��"
FROM Book
WHERE publisher = '�½�����';



---------------------------------------------------------------------------
-- ���� 4-6 ���缭���� �� �߿��� ���� ���� ���� ����� �� ���̳� �Ǵ��� ���� �ο� ���� ���Ͻÿ�
SELECT SUBSTR(name, 1,1) "��", COUNT(*) "�ο�"
FROM Customer
GROUP BY SUBSTR(name, 1, 1);



---------------------------------------------------------------------------
-- ���� 4-7 ���缭���� �ֹ��Ϸκ��� 10�� �� ������ Ȯ���Ѵ�. �� �ֹ��� Ȯ�����ڸ� ���Ͻÿ�
SELECT orderid "�ֹ���ȣ", orderdate "�ֹ���", orderdate+10 "�ֹ�Ȯ������"
FROM Orders;



---------------------------------------------------------------------------
-- ���� 4-8 ���缭���� 2014�� 7�� 7�Ͽ� �ֹ����� ������ �ֹ���ȣ, �ֹ���, ����ȣ, ������ȣ�� ��� ���̽ÿ�
-- �� �ֹ����� 'yyyy-mm-dd ����' ���·� ǥ���Ѵ�
SELECT orderid "�ֹ���ȣ", TO_CHAR(orderdate, 'yyyy-mm-dd dy') "�ֹ���", custid "����ȣ", bookid "������ȣ"
FROM Orders
WHERE Orderdate = '14/07/07';



---------------------------------------------------------------------------
-- ���� 4-9 DBMS ������ ������ ���� ��¥�� �ð�, ������ Ȯ���Ͻÿ�
SELECT TO_CHAR(SYSDATE, 'yyyy/mm/dd dy hh24:mi:ss')
FROM Dual;



---------------------------------------------------------------------------
-- ���� 4-10 �̸�, ��ȭ��ȣ�� ���Ե� ������� ���̽ÿ�. ��, ��ȭ��ȣ ���� ���� '����ó����'���� ǥ��
SELECT custid, name, NVL(phone, '����ó����')
FROM Customer;



---------------------------------------------------------------------------
-- ���� 4-11 �� ��Ͽ��� ����ȣ, �̸�, ��ȭ��ȣ�� ���� �� �� ���̽ÿ�
SELECT custid, name, phone
FROM Customer
WHERE ROWNUM <= 2;



---------------------------------------------------------------------------
/*
## VIEW
- �������̰� �Ͻ����� ���̺�
- �Ϲ������� ���� �����͸� ������ ���� ����


#### materialized view
- ���� �����͸� ������ �ִ� ��. ���� ���̺��� ������ �ִ� �����Ͱ� �ʹ� ���� �����͸� ��� ������ ó���ϴ� ������ ������ �� ���


### 1. ���� ����
�ܼ���(Simple View) - ����� ���������� ���� ���� 1���� ���̺�κ��� ��������� ��
���պ�(Complex View) - ����� ���������� �������� ���̺��� ������ ����� ��������� ��. �ǹ����� ��κ� �̰ɷ� ���۾��� ��
�ζ��κ�(Inline View) - �ش� ���ǿ����� �ʿ��� ���� ��� FROM


### 2. ���� ����

    CREATE VIEW ���̸�
    AS SELECT��
        [WITH READ ONLY] -- INSERT�� �� �ǰ� ��. INSERT�� �ϸ� ���� ���̺� �����Ͱ� ���ԵǱ� ����
        
        
### 3. ���� ����
 - REPLACE�� ������ �ִ� �� ������ �ٲ�. ���̺�ó�� ALTER�� �� �Ǳ� ������ ���

    CREATE OR REPLACE VIEW ���̸� [(���̸�, ...)]
    AS SELECT��

 - �𵨸��� �ַ� ����ڰ� ��. �ǹ� ���� �� �ַ� �ϴ� ���� SQL ���� ������ ���α׷� ¥�� ��
*/




---------------------------------------------------------------------------
-- �� ���� ����
    -- ���� ���̺� ����
    CREATE TABLE o_tbl(
        a NUMBER,
        b NUMBER,
        c NUMBER
    );

    -- VIEW ����
    CREATE OR REPLACE VIEW view1
    AS
        SELECT a, b
        FROM o_tbl;
    
    -- VIEW�� ������ ���� (�������� �ݿ�)
    INSERT INTO view1 VALUES(1, 2);
    SELECT * FROM o_tbl;  

    
    -- �������̺� �� ���� (view���� �ݿ�)
    UPDATE o_tbl SET b=1 WHERE a=1;
    SELECT * FROM view1;
    

    -- VIEW ���� (with read only �������� ����)
    CREATE OR REPLACE VIEW view2
    AS
        SELECT a, b
        FROM o_tbl
    WITH READ ONLY;
    
    
    -- VIEW�� ������ ���� �õ�
    INSERT INTO view2 VALUES(99, 99);
    
    
    -- ������ �б� �õ�
    SELECT * FROM view2;
    
    
    -- ����ڰ� ������ �� Ȯ��
    SELECT * FROM user_views;
    
    
    -- �ý��� ���� ���̺� ���� Ȯ��
    SELECT * FROM tabs;
    
    
    CREATE OR REPLACE VIEW view1
    AS
        SELECT b, c
        FROM o_tbl
    WITH READ ONLY;
    
    
    -- ���� 4-20 �ּҿ� '���ѹα�'�� �����ϴ� ����� ������ �並 ����� ��ȸ�Ͻÿ�. ���� �̸��� vw_Customer�� �����Ͻÿ�.
    CREATE VIEW vw_Customer
    AS SELECT *
       FROM Customer
       WHERE address LIKE '%���ѹα�%';


       
---------------------------------------------------------------------------

-- ��������6-1 �ǸŰ����� 2���� �̻��� ������ ������ȣ, �����̸�, ���̸�, ���ǻ�, �ǸŰ����� �����ִ� highorders �� ����
CREATE OR REPLACE VIEW highorders
AS SELECT bk.bookid, bk.bookname, cs.name, bk.publisher, od.saleprice
   FROM Book bk, Customer cs, Orders od
   WHERE saleprice>=20000 AND bk.bookid=od.bookid AND cs.custid=od.custid;
   
SELECT * FROM highorders;
    
    
-- ��������6-2. ������ �並 �̿��Ͽ� �Ǹŵ� ���� �̸��� �� �̸��� ����ϴ� SQL���� �ۼ��Ͻÿ�
SELECT bookname, name
FROM highorders;


-- ��������6-3. highorders�� ����. �ǸŰ��� �Ӽ� ���� ��� �����Ͻÿ�. ���� �� (2)�� SQL�� �ٽ� ����.
CREATE OR REPLACE VIEW highorders (bookid, bookname, name, publisher)
AS SELECT bk.bookid, bk.bookname, cs.name, bk.publisher
   FROM Book bk, Customer cs, Orders od
   WHERE saleprice>=20000 AND bk.bookid=od.bookid AND cs.custid=od.custid;
   
SELECT * FROM highorders;



---------------------------------------------------------------------------
-- ## �ε���

    -- ���̺� �����
    CREATE TABLE test(no NUMBER);
    
    -- ���̺� ������ 1�� �� �ֱ�
    BEGIN -- ���α׷���
        FOR I IN 1..10000 LOOP
            INSERT INTO test VALUES (i);
        END LOOP;
        COMMIT;
    END;
    /
    
    -- ���̺� ������ Ȯ��
    SELECT * FROM test;
    SELECT * FROM test WHERE no = 9999;
    
    -- ���� ���̺��� no �Ӽ��� �ε��� ��������
    CREATE INDEX idx_test_no
        ON test(no);
    


---------------------------------------------------------------------------
-- (�߿�) �ε����� ���¸� ��ȸ�ϴ� ���
-- �ε����� �뷱��(�����ս�=����)�� Ȯ��.
-- 0�� �ֻ��� ����

ANALYZE INDEX idx_test_no VALIDATE STRUCTURE;
SELECT (del_lf_rows_len / lf_rows_len) * 100 BALANCE
FROM index_stats
WHERE name='IDX_TEST_NO'; -- �ݵ�� �빮�ڿ��� ��
---------------------------------------------------------------------------


-- �ε��� �� ����
DELETE FROM test
WHERE no BETWEEN 2500 AND 6500;


-- �ε��� ���� ����ȸ
ANALYZE INDEX idx_test_no VALIDATE STRUCTURE;
SELECT (del_lf_rows_len / lf_rows_len) * 100 BALANCE
FROM index_stats
WHERE name='IDX_TEST_NO';


-- �ε����� ������
-- �ε����� �뷱���� �������� �� ���
ALTER INDEX idx_test_no REBUILD;


-- �ε��� ���� ����ȸ
ANALYZE INDEX idx_test_no VALIDATE STRUCTURE;
SELECT (del_lf_rows_len / lf_rows_len) * 100 BALANCE
FROM index_stats
WHERE name='IDX_TEST_NO';


SELECT *
FROM Book
WHERE publisher='���ѹ̵��' AND price >= 30000;



---------------------------------------------------------------------------

