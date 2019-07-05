-- 테이블 생성 및 삭제
    -- 테이블 생성하기(CREATE table syntax)
    
    /*
    CREATE TABLE table_name (
        column_1 datatype,
        column_2 datatype,
        ...
        column_n datatype
    );
    */
    
    CREATE TABLE book (
        bookid number(3) not null, -- (3) : 숫자의 자릿수. not null : null값을 허용하는지 여부
        bookname varchar2(100) not null, -- (50) : 데이터 길이(byte)
        publisher varchar2(100) not null,
        price number(8),
        primary key(bookid) -- 기본키 설정. 2개 이상 설정할 때는 꼭 이 방법을 사용.
    );
    
    
    -- 테이블 생성하기2 : 외래키 포함
        -- 외래키는 그 속성을 순서대로 가져온다는 게 아니라 참조한다는 의미!
    /*
    CREATE TABLE table_name (
        column_1 datatype,
        column_2 datatype,
        ...
        column_n datatype
        PRIMARY KEY (기본키 속성명)
        FOREIGN KEY (가져온 외래키의 새 이름) REFERENCES 테이블이름(가져올 외래키 속성이름)
    );
    */
    
    CREATE TABLE orders(
        ....
        custid number(3),
        .....
        FOREIGN KEY (custid) REFERENCES customer(custid) -- 처음 들어가는 
    );
    
    
     
    -- 테이블 삭제
    DROP TABLE book;
    


-- 데이터 삽입/수정/삭제
    -- 테이블에 데이터 삽입1
    INSERT INTO book VALUES(1, '레미제라블', '대한출', 14000);
    
    
    -- 테이블에 데이터 삽입2 : 특정한 속성값만 집어넣을 때
    INSERT INTO book(bookid, bookname, publisher)
    VALUES(2, '장발장', '한빛');  -- 속성과 데이터 타입이 맞아야 함
        
        
    -- 테이블 데이터 수정
    UPDATE book
    SET price = 30000    -- 테이블 전체 데이터 수정은 이 행까지만 사용
    WHERE bookid = 2;
    
    
    -- 테이블 데이터 삭제
        -- 다른 테이블에서 참조하고 있는 데이터는 삭제가 안 될 수 있음
    DELETE FROM book     -- 테이블 전체 데이터 삭제는 이 행만 사용
    WHERE bookid = 2;
    
    
--  예제 : 책 132,133p의 테이블 3개를 만들어 보시오
    -- Book 테이블 만들기
    CREATE TABLE Book (
        bookid number(3) not null,
        bookname varchar2(100) not null,
        publisher varchar2(100) not null,
        price number(8),
        primary key(bookid)
    );
    
        -- Book 테이블에 데이터 삽입
        INSERT INTO Book VALUES(1, '축구의 역사', '굿스포츠', 7000);
        INSERT INTO Book VALUES(2, '축구아는여자', '나무수', 13000);
        INSERT INTO Book VALUES(3, '축구의 이해', '대한미디어', 22000);
        INSERT INTO Book VALUES(4, '골프 바이블', '대한미디어', 35000);
        INSERT INTO Book VALUES(5, '피겨 교본', '굿스포츠', 8000);
        INSERT INTO Book VALUES(6, '역도 단계별기술', '굿스포츠', 6000);
        INSERT INTO Book VALUES(7, '야구의 추억', '이상미디어', 20000);
        INSERT INTO Book VALUES(8, '야구를 부탁해', '이상미디어', 13000);
        INSERT INTO Book VALUES(9, '올림픽 이야기', '삼성당', 7500);
        INSERT INTO Book VALUES(10, 'Olympic Champions', 'Pearson', 13000);
    
    
    -- Customer 테이블 만들기
    CREATE TABLE Customer (
        custid number(3) not null,
        name varchar2(100) not null,
        address varchar2(300) not null,
        phone varchar2(300),
        primary key(custid)
    );
    
        -- Customer 테이블에 데이터 삽입
        INSERT INTO Customer VALUES(1, '박지성', '영국 맨체스타', '000-5000-0001');
        INSERT INTO Customer VALUES(2, '김연아', '대한민국 서울', '000-6000-0001');
        INSERT INTO Customer VALUES(3, '장미란', '대한민국 강원도', '000-7000-0001');
        INSERT INTO Customer VALUES(4, '추신수', '미국 클리블랜드', '000-8000-0001');
        INSERT INTO Customer VALUES(5, '박세리', '대한민국 대전', NULL);
    
    
    -- Orders 테이블 만들기
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
    
        -- Orders 테이블에 데이터 삽입
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
       
        
Commit; -- 영구확정

SET AUTO OFF; -- 기본적으로 SET AUTO ON 상태, 자동 커밋이 되기 때문에 롤백 기능을 사용하기 위해 꺼주는 것

INSERT INTO Customer VALUES(6, '홍길동', '대한민국 대전', NULL);

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

