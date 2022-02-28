CREATE TABLE genres(
g_num INTEGER not null,
g_name VARCHAR(50) not null,
CONSTRAINT pk_genres PRIMARY KEY(g_num));

CREATE TABLE authors(
aut_id INTEGER not null,
fio VARCHAR(50),
CONSTRAINT pk_authors PRIMARY KEY(aut_id));

CREATE TABLE books(
isbn VARCHAR(17) not null,
title VARCHAR(50) not null,
pages INTEGER not null check(pages > 0),
publishig_date date not null,
CONSTRAINT pk_books PRIMARY KEY(isbn));

CREATE TABLE book_genre(
book_id VARCHAR(17) not null,
genre_id INTEGER not null,
CONSTRAINT pk_book_genre PRIMARY KEY(book_id, genre_id),
CONSTRAINT fk_book FOREIGN KEY(book_id) REFERENCES books(isbn)
ON DELETE CASCADE
ON UPDATE CASCADE,
CONSTRAINT fk_genre FOREIGN KEY(genre_id) REFERENCES genres(g_num)
ON DELETE CASCADE
ON UPDATE CASCADE);

CREATE TABLE book_autor(
book_id VARCHAR(17) not null,
autor_id INTEGER not null,
CONSTRAINT pk_book_autor PRIMARY KEY(book_id, autor_id),
CONSTRAINT fk_book_a FOREIGN KEY(book_id) REFERENCES books(isbn)
ON DELETE CASCADE
ON UPDATE CASCADE,
CONSTRAINT fk_autor FOREIGN KEY(autor_id) REFERENCES authors(aut_id)
ON DELETE CASCADE
ON UPDATE CASCADE);
