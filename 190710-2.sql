-- ## �Ƴ븻��


-- �Ƴ븻�� ���ظ� ���� å �ǽ�
-- �����б� ���� ���̺�(Summer) �����
CREATE TABLE Summer(
    sid NUMBER,
    class VARCHAR2(20),
    price NUMBER
);


-- ���̺� ������ ����
INSERT INTO Summer VALUES (100, 'FORTRAN', 20000);
INSERT INTO Summer VALUES (150, 'PASCAL', 15000);
INSERT INTO Summer VALUES (200, 'C', 10000);
INSERT INTO Summer VALUES (250, 'FORTRAN', 20000);


-- ���̺� Ȯ��
SELECT *
FROM Summer;


-- ���� 7-1 200�� �л��� �����б� ������û�� ����Ͻÿ�

--C���� ������ ��ȸ
SELECT price "C ������"
FROM Summer
WHERE class='C';

-- 200�� �л� ������û ���
DELETE FROM Summer
WHERE sid=200;

-- C���� ������ ����ȸ
SELECT price "C ������"
FROM Summer
WHERE class='C';


-- ���� 7-2 �����б⿡ ���ο� �ڹ� ���� ����

-- �ڹ� ���� ����
INSERT INTO Summer VALUES (NULL, 'JAVA', 25000);

-- Summer ���̺� ��ȸ
SELECT *
FROM Summer;

-- NULL ���� �ִ� ��� ������ ���� : �����л��� �� 4���̶� ���̺� ��ü ���� ī��Ʈ �� 5�� ��.
SELECT COUNT(*) "�����ο�"
FROM Summer;

SELECT COUNT(sid) "�����ο�"
FROM Summer;

SELECT COUNT(*) "�����ο�"
FROM Summer
WHERE sid IS NOT NULL;


-- ���� 7-3 FORTRAN ������ �����Ḧ 20,000������ 15,000������ �����Ͻÿ�

-- FORTRAN ���� ������ ����
UPDATE Summer
SET price=15000
WHERE class='FORTRAN';

SELECT *
FROM Summer;

SELECT DISTINCT price "FORTRAN ������"
FROM Summer
WHERE class='FORTRAN';

-- ���� �ǽ��� ���� ������ ����
UPDATE Summer
SET price=20000
WHERE class='FORTRAN';

-- ���� �ǽ��� ���� sid�� NULL�� ���� ����
DELETE FROM Summer
WHERE sid IS NULL;



-- ������ �����б� ���� ���̺�(Summer) �����

-- SummerPrice ���̺� ����
CREATE TABLE SummerPrice(
    class VARCHAR2(20),
    price NUMBER
);

INSERT INTO SummerPrice VALUES ('FORTRAN', 20000);
INSERT INTO SummerPrice VALUES ('PASCAL', 15000);
INSERT INTO SummerPrice VALUES ('C', 10000);

SELECT *
FROM SummerPrice;


-- SummerEnroll ���̺� ����
CREATE TABLE SummerEnroll(
    sid NUMBER,
    class VARCHAR2(20)
);

INSERT INTO SummerEnroll VALUES (100, 'FORTRAN');
INSERT INTO SummerEnroll VALUES (150, 'PASCAL');
INSERT INTO SummerEnroll VALUES (200, 'C');
INSERT INTO SummerEnroll VALUES (250, 'FORTRAN');

SELECT *
FROM SummerEnroll;


-- �����б⸦ ��� �л��� �й��� �����ϴ� ������?
SELECT sid, class
FROM SummerEnroll;


-- C ������ �������?
SELECT class, price
FROM SummerPrice
WHERE class='C';


-- �����ᰡ ���� ��� ������?
SELECT class, price
FROM SummerPrice
WHERE price=(SELECT MAX(price)
             FROM SummerPrice);
             
             
