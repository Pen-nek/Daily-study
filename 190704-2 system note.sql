-- <DB ���̺� ����>
    -- ���̺� �����̽� �����
    CREATE tablespace madang
        datafile 'd:\HongGilDong\madang.dbf'
        size 50M
        autoextend on next 10M
        maxsize unlimited;
    
    -- ���̺� �����̽� ����    
    DROP tablespace madang;
    
    -- ����� ���� �����
    CREATE user madang identified by madang     -- CREATE user ���̵� identified by ���
        default tablespace madang;
        
    -- ����� ������ ���� �ο��ϱ�
    GRANT connect, resource, dba to madang;     -- GRANT ���Ѹ���Ʈ TO ���̵�;
    
    /* ���Ѹ���Ʈ
    - connect : �α��� ����
    - resource : �ڿ��� ����� �� �ִ� ����
    - dba : db ������ ����
    */