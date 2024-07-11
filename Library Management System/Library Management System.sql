/*Create a database 
library for this project.
*/
CREATE DATABASE Library;
USE Library;

/*1. Create a Tables and write SQL statements to create the authors, 
books, borrowers, and borrowed_books tables with the given structures.*/
CREATE TABLE authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    birthdate DATE
);

CREATE TABLE books (
book_id INT AUTO_INCREMENT PRIMARY KEY,
title VARCHAR(100),
author_id INT,
published_date DATE,
FOREIGN KEY (author_id) REFERENCEs authors(author_id)
);

CREATE TABLE borrowers (
borrower_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100),
membership_date date
);

CREATE TABLE borrowed_books (
borrow_id INT AUTO_INCREMENT PRIMARY KEY,
borrower_id INT,
book_id INT,
borrow_date DATE,
return_date DATE,
FOREIGN KEY (borrower_id) REFERENCES borrowers(borrower_id),
FOREIGN KEY (book_id) REFERENCES books(book_id)
 );
 
/*
2.	Insert Data:
	Insert at least 3 authors into the authors table.
	Insert at least 5 books into the books table, ensuring each book is linked to an author.
	Insert at least 3 borrowers into the borrowers table.
	Insert at least 2 borrowed book records into the borrowed_books table, ensuring each record has a borrower and a book.
*/ 
 INSERT INTO authors(name, birthdate) VALUES ('Patrick Rothfus' , '1958-10-16'),
 ('Toni Morrison','1989-04-26'), ('Brardon Sanderson', '2002-11-25');
 
 INSERT INTO authors (name, birthdate) VALUES
('Patrick Rothfuss', '1973-06-06'),
('Toni Morrison', '1931-02-18');

SELECT * FROM authors;

INSERT INTO books (title, author_id, published_date) VALUES
('The Name of the Wind', 10, '1997-11-09'),
('Beloved', 11, '2004-11-08'),
('Mistborn', 12, '2022-11-30'),
('You Are a Badass', 13, '2024-10-01'),
('Atomic Habits', 14, '2011-12-12');

SELECT * FROM books;

INSERT INTO borrowers (name, membership_date) VALUES
('Alice', '2022-01-15'),
('Bobby', '2022-03-22'),
('Charlie', '2022-05-10');

SELECT * FROM borrowers;

INSERT INTO borrowed_books (borrower_id, book_id, borrow_date, return_date) VALUES
(1, 26, '2023-01-10', '2023-01-20'),
(2, 27, '2023-02-05', NULL);

//Perform CURD Operation
/*3.Retrieve All Books: Write a query to retrieve all books, 
including the title, author name, and published date.
*/
SELECT books.title, authors.name AS author_name, 
books.published_date
FROM books
JOIN authors ON books.author_id = authors.author_id;

/*4.Update Author's Birthdate: Write a query to update 
the birthdate of an author.
*/
UPDATE authors
SET birthdate = '1998-11-25'
WHERE name = 'Tini Morrison';

SELECT * FROM authors WHERE name = 'Toni Morrison';
/*5.Delete Borrower: Write a query to delete a 
borrower from the borrowers table.
*/

DELETE FROM borrowed_books
WHERE borrower_id = (SELECT borrower_id FROM borrowers WHERE name = 'Bobby');

DELETE FROM borrowers
WHERE name = 'Bobby';

SELECT * FROM borrowers;


/* 6.	Retrieve Borrowed Books: Write a query to retrieve all borrowed books,
 including the book title, borrower's name, and borrow date. */
SELECT 
    books.title, 
    borrowers.name AS borrower_name, 
    borrowed_books.borrow_date
FROM 
    borrowed_books
JOIN 
    books ON borrowed_books.book_id = books.book_id
JOIN 
    borrowers ON borrowed_books.borrower_id = borrowers.borrower_id;

/*7.	Inner Join: Write a query to retrieve all books along with 
their authors' names using an INNER JOIN.
*/
SELECT 
    books.title, 
    authors.name AS author_name
FROM 
    books
INNER JOIN 
    authors ON books.author_id = authors.author_id;
    

/* 8.	Left Join: Write a query to retrieve all authors and their books, 
including authors who don't have any books listed, using a LEFT JOIN.
*/
SELECT 
    authors.name AS author_name, 
    books.title
FROM 
    authors
LEFT JOIN 
    books ON authors.author_id = books.author_id;
    

/* 9.	Self Join: Assume you want to find authors who were born on the same date. 
Write a query using a self join to find such authors.
*/
SELECT a1.name AS author1_name, a2.name AS author2_name, a1.birthdate
FROM authors a1 JOIN authors a2 on a1.birthdate = a2.birthdate AND a1.author_id != a2.author_id;

/*10.	Books Borrowed by Each Borrower: Write a query to retrieve the 
names of borrowers and the titles of books they have borrowed. */
SELECT borrowers.name AS borrower_name, 
books.title FROM  borrowed_books
JOIN borrowers ON borrowed_books.borrower_id = borrowers.borrower_id
JOIN books ON borrowed_books.book_id = books.book_id;

/*Challenge Questions
11.	Most Borrowed Books: Write a query to find the most borrowed books,
including the book title and the number of times it has been borrowed.

*/
SELECT books.title, COUNT(borrowed_books.book_id) AS borrow_count
FROM borrowed_books
JOIN books ON borrowed_books.book_id = books.book_id
GROUP BY books.title
ORDER BY borrow_count DESC;

/*12.	Overdue Books: Write a query to find all books that are overdue. 
Assume a book is overdue if the return_date is NULL and borrow_date is more than 30 days ago.*/
13.	Total Borrowed Books by Author: Write a query to find the total number of books borrowed for each author.
SELECT books.title, borrowers.name AS borrower_name, borrowed_books.borrow_date
FROM borrowed_books
JOIN books ON borrowed_books.book_id = books.book_id
JOIN borrowers ON borrowed_books.borrower_id = borrowers.borrower_id
WHERE borrowed_books.return_date IS NULL 
AND borrowed_books.borrow_date < NOW() - INTERVAL 30 DAY;

/*13.	Total Borrowed Books by Author: Write a query to find the total 
number of books borrowed for each author.*/
SELECT authors.name AS author_name, 
COUNT(borrowed_books.book_id) AS total_borrowed
FROM borrowed_books
JOIN books ON borrowed_books.book_id = books.book_id
JOIN authors ON books.author_id = authors.author_id
GROUP BY authors.name;

SELECT * FROM books;