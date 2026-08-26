/*
DM505 — Database Design
SQL Query Exercises
University of Southern Denmark (SDU)

Individual take-home examination
*/


/* =========================================================
   Query A
   Return the number of books per genre.
   ========================================================= */

SELECT
    genre.name,
    COUNT(*)
FROM genre
LEFT OUTER JOIN bookgenre
    ON genre.genreid = bookgenre.genreid
GROUP BY genre.name;


/* =========================================================
   Query B
   Return publishers that have published at most 10 books.
   ========================================================= */

SELECT
    publisher.name,
    COUNT(book.isbn)
FROM publisher
LEFT OUTER JOIN book
    ON publisher.publisherid = book.publisherid
GROUP BY publisher.name
HAVING COUNT(book.isbn) <= 10;


/* =========================================================
   Query C
   Return authors that have not written a book belonging
   to the genre 'Mystery'.
   ========================================================= */

SELECT
    author.name,
    author.authorid
FROM author
JOIN bookauthor
    ON author.authorid = bookauthor.authorid
JOIN bookgenre
    ON bookid = bookgenre.isbn
LEFT OUTER JOIN genre
    ON bookgenre.genreid = genre.genreid
    AND genre.name = 'Mystery'
GROUP BY
    author.authorid,
    author.name
HAVING COUNT(genre.name) = 0;


/* =========================================================
   Query D
   Return authors with the most and least written books.
   Ties are retained.
   ========================================================= */

SELECT
    author.name,
    author.authorid
FROM author
JOIN bookauthor
    ON author.authorid = bookauthor.authorid
GROUP BY
    author.authorid,
    author.name
HAVING COUNT(bookid) >= ALL (
    SELECT COUNT(bookid)
    FROM author
    JOIN bookauthor
        ON author.authorid = bookauthor.authorid
    GROUP BY author.name
)

UNION

SELECT
    author.name,
    author.authorid
FROM author
JOIN bookauthor
    ON author.authorid = bookauthor.authorid
GROUP BY
    author.authorid,
    author.name
HAVING COUNT(bookid) <= ALL (
    SELECT COUNT(bookid)
    FROM author
    JOIN bookauthor
        ON author.authorid = bookauthor.authorid
    GROUP BY author.name
);


/* =========================================================
   Query E
   For each publisher, count the publishers that have
   published more books.
   ========================================================= */

SELECT
    publisher1.name,
    (
        SELECT COUNT(*)
        FROM publisher AS publisher2
        WHERE (
            SELECT COUNT(*)
            FROM book AS book2
            WHERE book2.publisherid = publisher2.publisherid
        ) > (
            SELECT COUNT(*)
            FROM book AS book1
            WHERE book1.publisherid = publisher1.publisherid
        )
    )
FROM publisher AS publisher1;
