 select a.fio from authors a
 join book_autor ba on a.aut_id = ba.autor_id
 group by a.aut_id
 order by count(1) desc
 limit 1;