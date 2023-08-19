select * from (
    select rownum as rnum, m.* from (
        select * from mvc_board order by bgroup desc, bstep asc
    ) m where rownum <= 20
)
where rnum >10;

