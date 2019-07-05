-- 테이블 생성 시 걸 수 있는 제약 조건

        -- 테이블 생성 시 제약조건이 전혀 없음.
        CREATE TABLE ex (
                id NUMBER(3),
                name VARCHAR(30),
                salary NUMBER(7)
        );
        
        
        -- 테이블 생성. id 속성에 기본키 제약조건을 걺.
        CREATE TABLE ex (
                id NUMBER(3),
                name VARCHAR(30),
                salary NUMBER(7),
                PRIMARY KEY(id)
        );
        
        
        -- 테이블 생성. id 속성에 기본키, name 속성에 UNIQUE 제약.
        CREATE TABLE ex (
                id NUMBER(3),
                name VARCHAR(30) UNIQUE,
                salary NUMBER(7),
                PRIMARY KEY(id)
        );
        
        
        -- 테이블 생성. id 속성에 기본키, name 속성에 UNIQUE, salary에 CHECK 제약.
        CREATE TABLE ex (
                id NUMBER(3),
                name VARCHAR(30) UNIQUE,
                salary NUMBER(7) CHECK(salary BETWEEN 300 AND 1000),
                PRIMARY KEY(id)
        );
        
        
        -- 테이블 생성. 제약조건의 이름 짓기
        CREATE TABLE ex (
                id NUMBER(3),
                name VARCHAR(30) CONSTRAINT CNAME_unique UNIQUE,
                salary NUMBER(7) CONSTRAINT '' CHECK(salary BETWEEN 300 AND 1000),
                PRIMARY KEY(id)
        );
        
        
        -- 현재 제약조건의 목록 확인
        SELECT CONSTRAINT_NAME FROM USER_CONSTRAINTS;
        
        
        -- 제약조건 시험해보기        
        INSERT INTO ex VALUES(1, '홍길동', 300);
        INSERT INTO ex VALUES(2, '박문수', 2000);
        INSERT INTO ex VALUES(3, '성춘향', 500);
        
        

-----------------------------------------------------------------------------------------------
-- 테이블 변경하기

        -- 테이블 이름 변경
        RENAME example TO ex;
        
        
        -- 테이블에 컬럼 추가
            -- ALTER TABLE ADD(새로운컬럼이름, 타입)
         ALTER TABLE ex ADD(dept_id NUMBER(3));
        
        
        -- 테이블 컬럼의 속성 바꾸기
        ALTER TABLE ex MODIFY(name VARCHAR(50));
        
        
        -- 테이블의 컬럼 삭제
        ALTER TABLE ex DROP COLUMN dept_id;
        
        
        -- 테이블의 컬럼 이름 변경
        ALTER TABLE ex RENAME COLUMN salary TO pay;
        
        
        -- 테이블 속성 확인
        DESC ex;
        
        