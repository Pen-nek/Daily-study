2. MySQL 접근 구문

1) 현재 데이터베이스 목록 보기
- 나온 목록 중 sys까지는 system 계정이 관리함
- world는 샘플 데이터베이스

	show databases;


2)사용할 데이터베이스 알려주기

	use world;


3) 테이블 확인하기

	show tables;


4)  auto_increment : 컬럼에 값을 추가하면 자동으로 1씩 증가하게 함. 기본키 등에 사용.

show databases;

use world;

show tables;

desc city;

SELECT * 
	FROM city 
	WHERE POPULATION >= 5000000 
	ORDER BY population DESC;
    
use world;
show tables;
desc country;
desc countrylanguage;
