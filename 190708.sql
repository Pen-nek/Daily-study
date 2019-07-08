-- 190708

-- ## 내장함수
-- NVL : NULL값을 다른 값으로 대체해서 출력. 숫자로 대체해서 연산할 수도 있음 
-- ROWNUM : 자료를 일부분만 확인
-- 입력값으로 숫자가 아닌 컬럼을 넣을 수도 있음

-- #### Tip | SELECT문 처리 순서
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

-- ## 교재 204~217 내용 소화하기

-- > ABS : 절댓값 구하기
---------------------------------------------------------------------------
-- 질의 4-1 -78과 +78의 절댓값을 구하시오
SELECT ABS(-78), ABS(+78)
FROM dual;



---------------------------------------------------------------------------
-- 질의 4-2 4.875를 소수 첫째 자리까지 반올림한 값을 구하시오
SELECT ROUND(4.875, 1)
FROM dual;



---------------------------------------------------------------------------
-- 질의 4-3 고객별 평균 주문 금액을 백원 단위로 반올림한 값을 구하시오
SELECT custid, ROUND(AVG(saleprice), -2)
FROM Orders
GROUP BY custid;



---------------------------------------------------------------------------
-- 질의 4-4 도서제목에 야구가 포함된 도서를 농구로 변경한 후 도서 목록을 보이시오
SELECT bookid, REPLACE(bookname, '야구', '농구'), publisher, price
FROM Book;



---------------------------------------------------------------------------
-- 질의 4-5 굿스포츠에서 출판한 도서의 제목과 제목의 글자 수, 바이트 수를 보이시오
SELECT bookname, LENGTH(bookname) "글자수", LENGTHB(bookname) "바이트 수"
FROM Book
WHERE publisher = '굿스포츠';



---------------------------------------------------------------------------
-- 질의 4-6 마당서점의 고객 중에서 같은 성을 가진 사람이 몇 명이나 되는지 성별 인원 수를 구하시오
SELECT SUBSTR(name, 1,1) "성", COUNT(*) "인원"
FROM Customer
GROUP BY SUBSTR(name, 1, 1);



---------------------------------------------------------------------------
-- 질의 4-7 마당서점은 주문일로부터 10일 후 매출을 확정한다. 각 주문의 확정일자를 구하시오
SELECT orderid "주문번호", orderdate "주문일", orderdate+10 "주문확정일자"
FROM Orders;



---------------------------------------------------------------------------
-- 질의 4-8 마당서점이 2014년 7월 7일에 주문받은 도서의 주문번호, 주문일, 고객번호, 도서번호를 모두 보이시오
-- 단 주문일은 'yyyy-mm-dd 요일' 형태로 표시한다
SELECT orderid "주문번호", TO_CHAR(orderdate, 'yyyy-mm-dd dy') "주문일", custid "고객번호", bookid "도서번호"
FROM Orders
WHERE Orderdate = '14/07/07';



---------------------------------------------------------------------------
-- 질의 4-9 DBMS 서버에 설정된 현재 날짜와 시간, 요일을 확인하시오
SELECT TO_CHAR(SYSDATE, 'yyyy/mm/dd dy hh24:mi:ss')
FROM Dual;



---------------------------------------------------------------------------
-- 질의 4-10 이름, 전화번호가 포함된 고객목록을 보이시오. 단, 전화번호 없는 고객은 '연락처없음'으로 표시
SELECT custid, name, NVL(phone, '연락처없음')
FROM Customer;



---------------------------------------------------------------------------
-- 질의 4-11 고객 목록에서 고객번호, 이름, 전화번호를 앞의 두 명만 보이시오
SELECT custid, name, phone
FROM Customer
WHERE ROWNUM <= 2;



---------------------------------------------------------------------------
/*
## VIEW
- 가상적이고 일시적인 테이블
- 일반적으로 실제 데이터를 가지고 있지 않음


#### materialized view
- 실제 데이터를 가지고 있는 뷰. 원본 테이블이 가지고 있는 데이터가 너무 많아 데이터를 뷰로 가져와 처리하는 과정이 느려질 때 사용


### 1. 뷰의 종류
단순뷰(Simple View) - 뷰생성 서브쿼리에 조인 없이 1개의 테이블로부터 만들어지는 뷰
복합뷰(Complex View) - 뷰생성 서브쿼리에 여러개의 테이블을 조인한 결과로 만들어지는 뷰. 실무에선 대부분 이걸로 뷰작업을 함
인라인뷰(Inline View) - 해당 질의에서만 필요한 뷰일 경우 FROM


### 2. 뷰의 생성

    CREATE VIEW 뷰이름
    AS SELECT문
        [WITH READ ONLY] -- INSERT가 안 되게 함. INSERT를 하면 원본 테이블에 데이터가 삽입되기 때문
        
        
### 3. 뷰의 수정
 - REPLACE는 기존에 있던 뷰 내용을 바꿈. 테이블처럼 ALTER가 안 되기 때문에 사용

    CREATE OR REPLACE VIEW 뷰이름 [(열이름, ...)]
    AS SELECT문

 - 모델링은 주로 상급자가 함. 실무 투입 시 주로 하는 일은 SQL 구문 구성해 프로그램 짜는 것
*/




---------------------------------------------------------------------------
-- 뷰 생성 연습
    -- 원본 테이블 생성
    CREATE TABLE o_tbl(
        a NUMBER,
        b NUMBER,
        c NUMBER
    );

    -- VIEW 생성
    CREATE OR REPLACE VIEW view1
    AS
        SELECT a, b
        FROM o_tbl;
    
    -- VIEW에 데이터 삽입 (원본에도 반영)
    INSERT INTO view1 VALUES(1, 2);
    SELECT * FROM o_tbl;  

    
    -- 원본테이블 값 변경 (view에도 반영)
    UPDATE o_tbl SET b=1 WHERE a=1;
    SELECT * FROM view1;
    

    -- VIEW 생성 (with read only 제약조건 있음)
    CREATE OR REPLACE VIEW view2
    AS
        SELECT a, b
        FROM o_tbl
    WITH READ ONLY;
    
    
    -- VIEW에 데이터 삽입 시도
    INSERT INTO view2 VALUES(99, 99);
    
    
    -- 데이터 읽기 시도
    SELECT * FROM view2;
    
    
    -- 사용자가 정의한 뷰 확인
    SELECT * FROM user_views;
    
    
    -- 시스템 내의 테이블 정보 확인
    SELECT * FROM tabs;
    
    
    CREATE OR REPLACE VIEW view1
    AS
        SELECT b, c
        FROM o_tbl
    WITH READ ONLY;
    
    
    -- 질의 4-20 주소에 '대한민국'을 포함하는 고객들로 구성된 뷰를 만들고 조회하시오. 뷰의 이름은 vw_Customer로 설정하시오.
    CREATE VIEW vw_Customer
    AS SELECT *
       FROM Customer
       WHERE address LIKE '%대한민국%';


       
---------------------------------------------------------------------------

-- 연습문제6-1 판매가격이 2만원 이상인 도서의 도서번호, 도서이름, 고객이름, 출판사, 판매가격을 보여주는 highorders 뷰 생성
CREATE OR REPLACE VIEW highorders
AS SELECT bk.bookid, bk.bookname, cs.name, bk.publisher, od.saleprice
   FROM Book bk, Customer cs, Orders od
   WHERE saleprice>=20000 AND bk.bookid=od.bookid AND cs.custid=od.custid;
   
SELECT * FROM highorders;
    
    
-- 연습문제6-2. 생성한 뷰를 이용하여 판매된 도서 이름과 고객 이름을 출력하는 SQL문을 작성하시오
SELECT bookname, name
FROM highorders;


-- 연습문제6-3. highorders뷰 변경. 판매가격 속성 삭제 명령 수행하시오. 삭제 후 (2)번 SQL문 다시 수행.
CREATE OR REPLACE VIEW highorders (bookid, bookname, name, publisher)
AS SELECT bk.bookid, bk.bookname, cs.name, bk.publisher
   FROM Book bk, Customer cs, Orders od
   WHERE saleprice>=20000 AND bk.bookid=od.bookid AND cs.custid=od.custid;
   
SELECT * FROM highorders;



---------------------------------------------------------------------------
-- ## 인덱스

    -- 테이블 만들기
    CREATE TABLE test(no NUMBER);
    
    -- 테이블에 데이터 1만 개 넣기
    BEGIN -- 프로그래밍
        FOR I IN 1..10000 LOOP
            INSERT INTO test VALUES (i);
        END LOOP;
        COMMIT;
    END;
    /
    
    -- 테이블 데이터 확인
    SELECT * FROM test;
    SELECT * FROM test WHERE no = 9999;
    
    -- 만든 테이블의 no 속성에 인덱스 만들어놓기
    CREATE INDEX idx_test_no
        ON test(no);
    


---------------------------------------------------------------------------
-- (중요) 인덱스의 상태를 조회하는 방법
-- 인덱스의 밸런스(퍼포먼스=성능)을 확인.
-- 0이 최상의 상태

ANALYZE INDEX idx_test_no VALIDATE STRUCTURE;
SELECT (del_lf_rows_len / lf_rows_len) * 100 BALANCE
FROM index_stats
WHERE name='IDX_TEST_NO'; -- 반드시 대문자여야 함
---------------------------------------------------------------------------


-- 인덱스 값 삭제
DELETE FROM test
WHERE no BETWEEN 2500 AND 6500;


-- 인덱스 상태 재조회
ANALYZE INDEX idx_test_no VALIDATE STRUCTURE;
SELECT (del_lf_rows_len / lf_rows_len) * 100 BALANCE
FROM index_stats
WHERE name='IDX_TEST_NO';


-- 인덱스를 리빌드
-- 인덱스의 밸런스가 무너졌을 때 사용
ALTER INDEX idx_test_no REBUILD;


-- 인덱스 상태 재조회
ANALYZE INDEX idx_test_no VALIDATE STRUCTURE;
SELECT (del_lf_rows_len / lf_rows_len) * 100 BALANCE
FROM index_stats
WHERE name='IDX_TEST_NO';


SELECT *
FROM Book
WHERE publisher='대한미디어' AND price >= 30000;



---------------------------------------------------------------------------

