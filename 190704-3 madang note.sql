-- ���̺� ���� �� ����
    -- ���̺� �����ϱ�(CREATE table syntax)
    
    /*
    CREATE TABLE table_name (
        column_1 datatype,
        column_2 datatype,
        ...
        column_n datatype
    );
    */
    
    CREATE TABLE book (
        bookid number(3) not null, -- (3) : ������ �ڸ���. not null : null���� ����ϴ��� ����
        bookname varchar2(100) not null, -- (50) : ������ ����(byte)
        publisher varchar2(100) not null,
        price number(8),
        primary key(bookid) -- �⺻Ű ����. 2�� �̻� ������ ���� �� �� ����� ���.
    );
    
    
    -- ���̺� �����ϱ�2 : �ܷ�Ű ����
        -- �ܷ�Ű�� �� �Ӽ��� ������� �����´ٴ� �� �ƴ϶� �����Ѵٴ� �ǹ�!
    /*
    CREATE TABLE table_name (
        column_1 datatype,
        column_2 datatype,
        ...
        column_n datatype
        PRIMARY KEY (�⺻Ű �Ӽ���)
        FOREIGN KEY (������ �ܷ�Ű�� �� �̸�) REFERENCES ���̺��̸�(������ �ܷ�Ű �Ӽ��̸�)
    );
    */
    
    CREATE TABLE orders(
        ....
        custid number(3),
        .....
        FOREIGN KEY (custid) REFERENCES customer(custid) -- ó�� ���� 
    );
    
    
     
    -- ���̺� ����
    DROP TABLE book;
    


-- ������ ����/����/����
    -- ���̺� ������ ����1
    INSERT INTO book VALUES(1, '���������', '������', 14000);
    
    
    -- ���̺� ������ ����2 : Ư���� �Ӽ����� ������� ��
    INSERT INTO book(bookid, bookname, publisher)
    VALUES(2, '�����', '�Ѻ�');  -- �Ӽ��� ������ Ÿ���� �¾ƾ� ��
        
        
    -- ���̺� ������ ����
    UPDATE book
    SET price = 30000    -- ���̺� ��ü ������ ������ �� ������� ���
    WHERE bookid = 2;
    
    
    -- ���̺� ������ ����
        -- �ٸ� ���̺��� �����ϰ� �ִ� �����ʹ� ������ �� �� �� ����
    DELETE FROM book     -- ���̺� ��ü ������ ������ �� �ุ ���
    WHERE bookid = 2;
    
    
--  ���� : å 132,133p�� ���̺� 3���� ����� ���ÿ�
    -- Book ���̺� �����
    CREATE TABLE Book (
        bookid number(3) not null,
        bookname varchar2(100) not null,
        publisher varchar2(100) not null,
        price number(8),
        primary key(bookid)
    );
    
        -- Book ���̺� ������ ����
        INSERT INTO Book VALUES(1, '�౸�� ����', '�½�����', 7000);
        INSERT INTO Book VALUES(2, '�౸�ƴ¿���', '������', 13000);
        INSERT INTO Book VALUES(3, '�౸�� ����', '���ѹ̵��', 22000);
        INSERT INTO Book VALUES(4, '���� ���̺�', '���ѹ̵��', 35000);
        INSERT INTO Book VALUES(5, '�ǰ� ����', '�½�����', 8000);
        INSERT INTO Book VALUES(6, '���� �ܰ躰���', '�½�����', 6000);
        INSERT INTO Book VALUES(7, '�߱��� �߾�', '�̻�̵��', 20000);
        INSERT INTO Book VALUES(8, '�߱��� ��Ź��', '�̻�̵��', 13000);
        INSERT INTO Book VALUES(9, '�ø��� �̾߱�', '�Ｚ��', 7500);
        INSERT INTO Book VALUES(10, 'Olympic Champions', 'Pearson', 13000);
    
    
    -- Customer ���̺� �����
    CREATE TABLE Customer (
        custid number(3) not null,
        name varchar2(100) not null,
        address varchar2(300) not null,
        phone varchar2(300),
        primary key(custid)
    );
    
        -- Customer ���̺� ������ ����
        INSERT INTO Customer VALUES(1, '������', '���� ��ü��Ÿ', '000-5000-0001');
        INSERT INTO Customer VALUES(2, '�迬��', '���ѹα� ����', '000-6000-0001');
        INSERT INTO Customer VALUES(3, '��̶�', '���ѹα� ������', '000-7000-0001');
        INSERT INTO Customer VALUES(4, '�߽ż�', '�̱� Ŭ������', '000-8000-0001');
        INSERT INTO Customer VALUES(5, '�ڼ���', '���ѹα� ����', NULL);
    
    
    -- Orders ���̺� �����
    CREATE TABLE Orders (
        orderid number(3) not null,
        custid number(3) not null,
        bookid number(3) not null,
        saleprice number(8) not null,
        orderdate date not null,
        primary key(orderid),
        FOREIGN KEY(custid) REFERENCES Customer(custid),
        FOREIGN KEY(bookid) REFERENCES Book(bookid)
    );
    
        -- Orders ���̺� ������ ����
        INSERT INTO Orders VALUES(1, 1, 1, 6000, '2014-07-01');
        INSERT INTO Orders VALUES(2, 1, 3, 21000, '2014-07-03');
        INSERT INTO Orders VALUES(3, 2, 5, 8000, '2014-07-03');
        INSERT INTO Orders VALUES(4, 3, 6, 6000, '2014-07-04');
        INSERT INTO Orders VALUES(5, 4, 7, 20000, '2014-07-05');
        INSERT INTO Orders VALUES(6, 1, 2, 12000, '2014-07-07');
        INSERT INTO Orders VALUES(7, 4, 8, 13000, '2014-07-07');
        INSERT INTO Orders VALUES(8, 3, 10, 12000, '2014-07-08');
        INSERT INTO Orders VALUES(9, 2, 10, 7000, '2014-07-09');
        INSERT INTO Orders VALUES(10, 3, 8, 13000, '2014-07-10');
       
        
Commit; -- ����Ȯ��

SET AUTO OFF; -- �⺻������ SET AUTO ON ����, �ڵ� Ŀ���� �Ǳ� ������ �ѹ� ����� ����ϱ� ���� ���ִ� ��

INSERT INTO Customer VALUES(6, 'ȫ�浿', '���ѹα� ����', NULL);

SELECT *
FROM Customer;

rollback;

DELETE FROM Customer
WHERE custid = 6;

SELECT *
FROM Customer;

rollback;

SELECT *
FROM Customer;

commit;

