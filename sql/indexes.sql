/*
DM505 — Database Design
PostgreSQL Index Definitions
University of Southern Denmark (SDU)

Index statements included in the submitted examination.
*/


CREATE INDEX PublisheridInd
ON publisher(publisherID);


CREATE INDEX BookInd
ON book(ISBN);


CREATE INDEX GenreInd
ON genre(genreid);


CREATE INDEX BookGenreInd
ON BookGenre(ISBN, genreID);


CREATE INDEX AuthorInd
ON Author(AuthorID);


CREATE INDEX BookAuthorInd
ON bookauthor(bookID, authorID);
