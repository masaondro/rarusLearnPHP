select title, fio from books, authors
where isbn in (select book_id from book_genre
where genre_id = 1) and aut_id in (select autor_id from book_autor
where book_id = isbn);