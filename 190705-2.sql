
-- <190705 | 책 3,4단원 질의 풀어보기>



------------------------------------------------------------------------------------------------------------------------------------
-- 질의 3-17 고객이 주문한 도서의 총 판매액, 평균값, 최저가, 최고가 구하기
SELECT SUM(saleprice), 
    AVG(saleprice), 
    MAX(saleprice), 
    MIN(saleprice)
FROM orders;



------------------------------------------------------------------------------------------------------------------------------------
-- 질의 3-18 마당서점의 도서 판매 건수 구하기
        -- 나의 답
        SELECT MAX(orderid) as 도서판매건수
        FROM orders;
        
        -- 정답
        SELECT COUNT(*)
        FROM orders;



------------------------------------------------------------------------------------------------------------------------------------
-- 질의 3-19 고객별로 주문한 도서의 총 수량과 총 판매액을 구하기
        -- 나의 답
        SELECT count(bookid) AS 총주문수량, SUM(saleprice)
        FROM orders
        GROUP BY custid;
        
        -- 정답
        SELECT count(*) AS 총주문수량, SUM(saleprice)
        FROM orders
        GROUP BY custid;
        
    
    
------------------------------------------------------------------------------------------------------------------------------------
-- 질의 3-20 가격이 8천원 이상인 도서 구매 고객에 대해 고객별 주문 도서의 총 수량 구하기. 단, 두 권 이상 구매 고객만.
SELECT COUNT(*)
FROM orders
WHERE saleprice >= 8000
GROUP BY custid
HAVING COUNT(*) >= 2;



------------------------------------------------------------------------------------------------------------------------------------
-- 질의 3-21 고객과 고객의 주문에 대한 데이터를 전부 보이기
SELECT *
FROM Customer, Orders
WHERE Customer.custid=Orders.custid;



------------------------------------------------------------------------------------------------------------------------------------
-- 질의 3-22 고객과 고객의 주문에 관한 데이터를 고객번호순으로 정렬하여 보이기
SELECT *
FROM Customer, Orders
WHERE Customer.custid=Orders.custid
ORDER BY Customer.custid, Orders.orderdate;



------------------------------------------------------------------------------------------------------------------------------------
-- 질의 3-23 고객의 이름과 고객이 주문한 도서의 판매가격을 검색
SELECT name, saleprice
FROM Customer, Orders
WHERE Customer.custid = Orders.custid;



------------------------------------------------------------------------------------------------------------------------------------
-- 질의 3-24 고객별로 주문한 모든 도서의 총 판매액을 구하고, 고객이름별로 정렬
SELECT name, SUM(saleprice)
FROM Customer, Orders
WHERE Customer.custid = Orders.custid
GROUP BY name
ORDER BY name;



------------------------------------------------------------------------------------------------------------------------------------
-- 질의 3-25 고객의 이름과 고객이 주문한 도서의 이름 구하기
SELECT name, bookname
FROM Book, Customer, Orders
WHERE Customer.custid = Orders.custid AND Book.bookid = Orders.bookid;



------------------------------------------------------------------------------------------------------------------------------------
-- 질의 3-26 가격이 20,000원인 도서를 주문한 고객의 이름과 도서의 이름 구하기
SELECT name, bookname, saleprice
FROM Book, Customer, Orders
WHERE Customer.custid = Orders.custid AND Book.bookid = Orders.bookid
              AND saleprice = 20000;
              


------------------------------------------------------------------------------------------------------------------------------------
-- 질의 3-27 도서를 구매하지 않은 고객을 포함하여 고객의 이름과 고객이 주문한 도서의 판매가격 구하기
SELECT Customer.name, Orders.saleprice
FROM Customer LEFT JOIN Orders
ON Customer.custid = Orders.custid;



------------------------------------------------------------------------------------------------------------------------------------
-- 질의 3-28 가격이 가장 비싼 도서의 이름
SELECT bookname
FROM Book
WHERE price = (SELECT MAX(price)
                          FROM Book);
                          
                          
                          
------------------------------------------------------------------------------------------------------------------------------------
-- 질의 3-29 도서를 구매한 적이 있는 고객의 이름을 검색
        -- 나의 답
        SELECT DISTINCT Customer.name
        FROM Customer, Orders
        WHERE Customer.custid = Orders.custid;
        
        -- 정답
        SELECT name
        FROM Customer
        WHERE custid IN (SELECT custid
                                     FROM Orders);
                             
                             

------------------------------------------------------------------------------------------------------------------------------------
-- 질의 3-30 대한미디어에서 출판한 도서를 구매한 고객의 이름
SELECT name
FROM Customer
WHERE custid IN (SELECT custid
                            FROM Orders
                            WHERE bookid IN (SELECT bookid
                                                          FROM Book
                                                          WHERE publisher = '대한미디어'));
                                                          
                                                          
                                                          
------------------------------------------------------------------------------------------------------------------------------------
-- 질의 3-31 출판사별로 출판사의 평균 도서 가격보다 비싼 도서 구하기

>=(SELECT AVG(price)
FROM Book
GROUP BY publisher;)
