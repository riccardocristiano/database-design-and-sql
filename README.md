# Relational Database Design & SQL

Individual take-home project completed for the **DM505 Database Design** course at the **University of Southern Denmark (SDU)**.

## Overview

This project covers the design and analysis of relational databases, from conceptual modelling to SQL querying and schema normalization.

The work includes:

- E/R modelling and conversion to relational schemas
- weak entities and ISA hierarchies
- SQL querying and aggregation
- joins and nested queries
- relational algebra
- functional dependencies and candidate keys
- Third Normal Form (3NF)
- Boyce-Codd Normal Form (BCNF)
- database indexing

The project combines practical SQL work with the theoretical foundations of relational database design.

---

## 1. E/R Modelling & Relational Design

The first part of the project models an online restaurant ordering system involving:

- users
- restaurants
- orders
- menu items
- cuisine types
- meals and beverages
- alcoholic beverages

The conceptual model includes:

- one-to-many and many-to-many relationships
- referential integrity constraints
- ISA hierarchies
- relationship attributes
- entity and relationship keys

The E/R model was then converted into a relational schema.

### Modified Design

A second version of the model introduced two additional constraints:

1. Each restaurant belongs to exactly one cuisine type.
2. A menu-item identifier is unique only within its restaurant.

The second requirement changes `MenuItem` into a **weak entity**, identified through the composite key:

`(RestaurantID, ItemID)`

This required corresponding changes to the relational schema and foreign-key relationships.

---

## 2. SQL Queries

The SQL component involved querying a publishing database containing authors, books, genres, and publishers.

The exercises required the use of:

- `SELECT`
- `JOIN`
- `LEFT OUTER JOIN`
- `GROUP BY`
- `HAVING`
- aggregate functions
- nested queries
- correlated subqueries
- `UNION`
- `ALL`
- set-based reasoning

Example tasks included:

- counting books by genre
- finding publishers with at most a specified number of books
- identifying authors who had not written books in a particular genre
- finding authors with the maximum and minimum number of published books
- comparing publishers according to the number of books they published

---

## 3. Relational Algebra

The project also included translation between **SQL and extended relational algebra**.

Operations included:

- projection
- selection
- joins
- outer joins
- set difference
- intersection
- aggregation and grouping

This part focused on understanding the relationship between declarative SQL queries and their underlying relational operations.

---

## 4. Functional Dependencies & Normalization

A relational schema was analysed through its functional dependencies.

The workflow included:

1. identifying non-trivial functional dependencies
2. computing attribute closures
3. identifying candidate keys
4. checking Third Normal Form
5. decomposing the relation into **3NF**
6. analysing the stricter **BCNF** condition
7. constructing a BCNF decomposition

One of the key candidate-key computations involved the attribute set:

`{CuisineType, OrderTime, UserID, ItemID}`

The normalization analysis demonstrated how functional dependencies determine whether a schema contains redundancy and how decomposition can remove structural anomalies.

---

## 5. Database Indexing

The final part of the project focused on indexing and query optimization using PostgreSQL-style syntax.

Indexes were considered for:

- primary-key attributes
- junction tables
- foreign-key relationships
- columns frequently involved in joins and query predicates

Example:

```sql
CREATE INDEX BookGenreInd
ON BookGenre(ISBN, GenreID);
