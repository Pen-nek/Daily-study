drop table tbl_board;
select seq_board.currval from dual;     --현재 시퀀스의 값
drop sequence seq_board;
create sequence seq_board;

create table tbl_board (
  bno number(10,0),
  title varchar2(200) not null,
  content varchar2(2000) not null,
  writer varchar2(50) not null,
  regdate date default sysdate, 
  updatedate date default sysdate
);

alter table tbl_board add constraint pk_board 
primary key (bno);

insert into tbl_board(bno, title, content, writer)
values(seq_board.nextval, '테스트 제목', '테스트 내용', 'user00');

select count(*) from tbl_board;

insert into tbl_board(bno, title, content, writer)
(select seq_board.nextval, title, content, writer from tbl_board);



select * from tbl_board order by bno desc;

select
/*+ INDEX_DESC(tbl_board pk_board) */
*
from
    tbl_board
    where bno > 0;
    
select
/*+ FULL(tbl_board) */
    rownum rn, bno, title
from tbl_board
where bno > 10
order by bno;

select rn, bno, title, content
from(
    select /*+ INDEX_DESC(tbl_board pk_board) */
    rownum rn, bno, title, content
    from tbl_board
    where rownum <=310
)
where rn > 300;