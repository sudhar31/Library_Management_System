Library Management System

You are tasked with managing a database for a library. The database should store information about books, authors, and borrowers. Additionally, it should track which books have been borrowed by which borrowers.

Structures
1.	authors
	author_id: INT, AUTO_INCREMENT, PRIMARY KEY
	name: VARCHAR(100)
	birthdate: DATE
2.	books
	book_id: INT, AUTO_INCREMENT, PRIMARY KEY
	title: VARCHAR(100)
	author_id: INT, FOREIGN KEY referencing authors(author_id)
	published_date: DATE
3.	borrowers
	borrower_id: INT, AUTO_INCREMENT, PRIMARY KEY
	name: VARCHAR(100)
	membership_date: DATE
4.	borrowed_books
	borrow_id: INT, AUTO_INCREMENT, PRIMARY KEY
	borrower_id: INT, FOREIGN KEY referencing borrowers(borrower_id)
	book_id: INT, FOREIGN KEY referencing books(book_id)
	borrow_date: DATE
	return_date: DATE (nullable)

Table Structures
-- Creating authors table
CREATE TABLE authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    birthdate DATE
);

-- Creating books table
CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100),
    author_id INT,
    published_date DATE,
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
);

-- Creating borrowers table
CREATE TABLE borrowers (
    borrower_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    membership_date DATE
);

-- Creating borrowed_books table
CREATE TABLE borrowed_books (
    borrow_id INT AUTO_INCREMENT PRIMARY KEY,
    borrower_id INT,
    book_id INT,
    borrow_date DATE,
    return_date DATE,
    FOREIGN KEY (borrower_id) REFERENCES borrowers(borrower_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);



Questions:
Creating Tables and Adding Data:
1.	Create Tables: Write SQL statements to create the authors, books, borrowers, and borrowed_books tables with the given structures.
2.	Insert Data:
	Insert at least 3 authors into the authors table.
	Insert at least 5 books into the books table, ensuring each book is linked to an author.
	Insert at least 3 borrowers into the borrowers table.
	Insert at least 2 borrowed book records into the borrowed_books table, ensuring each record has a borrower and a book.

CRUD Operations:
3.	Retrieve All Books: Write a query to retrieve all books, including the title, author name, and published date.
4.	Update Author's Birthdate: Write a query to update the birthdate of an author.
5.	Delete Borrower: Write a query to delete a borrower from the borrowers table.

Keys and Joins:
6.	Retrieve Borrowed Books: Write a query to retrieve all borrowed books, including the book title, borrower's name, and borrow date.
7.	Inner Join: Write a query to retrieve all books along with their authors' names using an INNER JOIN.
8.	Left Join: Write a query to retrieve all authors and their books, including authors who don't have any books listed, using a LEFT JOIN.
9.	Self Join: Assume you want to find authors who were born on the same date. Write a query using a self join to find such authors.
10.	Books Borrowed by Each Borrower: Write a query to retrieve the names of borrowers and the titles of books they have borrowed.

Challenge Questions:
11.	Most Borrowed Books: Write a query to find the most borrowed books, including the book title and the number of times it has been borrowed.
12.	Overdue Books: Write a query to find all books that are overdue. Assume a book is overdue if the return_date is NULL and borrow_date is more than 30 days ago.
13.	Total Borrowed Books by Author: Write a query to find the total number of books borrowed for each author.
