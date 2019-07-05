-- <DB 테이블 관리>
    -- 테이블 스페이스 만들기
    CREATE tablespace madang
        datafile 'd:\HongGilDong\madang.dbf'
        size 50M
        autoextend on next 10M
        maxsize unlimited;
    
    -- 테이블 스페이스 삭제    
    DROP tablespace madang;
    
    -- 사용자 계정 만들기
    CREATE user madang identified by madang     -- CREATE user 아이디 identified by 비번
        default tablespace madang;
        
    -- 사용자 계정에 권한 부여하기
    GRANT connect, resource, dba to madang;     -- GRANT 권한리스트 TO 아이디;
    
    /* 권한리스트
    - connect : 로그인 권한
    - resource : 자원을 사용할 수 있는 권한
    - dba : db 관리자 권한
    */