create table mvc_board(
    bid NUMBER(4) PRIMARY KEY,
    bname VARCHAR2(20),
    btitle VARCHAR2(100),
    bcontent VARCHAR2(300),
    bdate DATE DEFAULT SYSDATE,
    bhit NUMBER(4) DEFAULT 0,
    bgroup NUMBER(4), -- 댓글이 달릴 글번호
    bstep NUMBER(4),  -- 어디에 댓글이 달렸는지
    bindent NUMBER(4) -- 글 step에 맞게 앞에 indent를 준다.
);

commit;

create SEQUENCE mvc_board_seq;


commit;

insert into mvc_board values(mvc_board_seq.nextval, 'abcd', 'is title', 'is content', sysdate, 0,
    mvc_board_seq.currval, 0, 0);

commit;

select * from mvc_board;

--begin
--  for i in 1..1000 loop
--   insert into mvc_board (bId, bName, bTitle, bContent, bHit, bGroup, bStep, bIndent) values (mvc_board_seq.nextval, 'test' , '테스트', '테스트', 0, mvc_board_seq.currval, 0, 0);
--  end loop;
--end;

commit;


select * from (select rownum as rnum, m.* from mvc_board m where rownum <= 20) where rnum > 10;