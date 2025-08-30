-- =========================================================
-- Library Management System Database with Sample Data
-- =========================================================

-- Create the database
CREATE DATABASE IF NOT EXISTS LibraryDB;
USE LibraryDB;

-- =========================================================
-- Table: Authors
-- =========================================================
CREATE TABLE Authors (
    authorID INT AUTO_INCREMENT PRIMARY KEY,
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    UNIQUE (firstName, lastName)
);

-- Sample data
INSERT INTO Authors (firstName, lastName) VALUES
('J.K.', 'Rowling'),
('George', 'Orwell'),
('Jane', 'Austen'),
('Mark', 'Twain');

-- =========================================================
-- Table: Categories
-- =========================================================
CREATE TABLE Categories (
    categoryID INT AUTO_INCREMENT PRIMARY KEY,
    categoryName VARCHAR(50) NOT NULL UNIQUE
);

-- Sample data
INSERT INTO Categories (categoryName) VALUES
('Fiction'),
('Science Fiction'),
('Fantasy'),
('Biography');

-- =========================================================
-- Table: Books
-- =========================================================
CREATE TABLE Books (
    bookID INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    authorID INT NOT NULL,
    categoryID INT NOT NULL,
    publishedYear YEAR,
    isbn VARCHAR(20) UNIQUE,
    copiesAvailable INT DEFAULT 0,
    FOREIGN KEY (authorID) REFERENCES Authors(authorID),
    FOREIGN KEY (categoryID) REFERENCES Categories(categoryID)
);

-- Sample data
INSERT INTO Books (title, authorID, categoryID, publishedYear, isbn, copiesAvailable) VALUES
('Harry Potter and the Philosopher''s Stone', 1, 3, 1997, '9780747532699', 5),
('1984', 2, 2, 1949, '9780451524935', 3),
('Pride and Prejudice', 3, 1, 1813, '9780141439518', 4),
('Adventures of Huckleberry Finn', 4, 1, 1884, '9780486280615', 2);

-- =========================================================
-- Table: Members
-- =========================================================
CREATE TABLE Members (
    memberID INT AUTO_INCREMENT PRIMARY KEY,
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    membershipDate DATE DEFAULT CURRENT_DATE
);

-- Sample data
INSERT INTO Members (firstName, lastName, email, phone) VALUES
('Alice', 'Johnson', 'alice.johnson@example.com', '555-1234'),
('Bob', 'Smith', 'bob.smith@example.com', '555-5678'),
('Carol', 'Williams', 'carol.williams@example.com', '555-8765');

-- =========================================================
-- Table: Loans
-- =========================================================
CREATE TABLE Loans (
    loanID INT AUTO_INCREMENT PRIMARY KEY,
    bookID INT NOT NULL,
    memberID INT NOT NULL,
    loanDate DATE DEFAULT CURRENT_DATE,
    dueDate DATE NOT NULL,
    returnDate DATE,
    FOREIGN KEY (bookID) REFERENCES Books(bookID),
    FOREIGN KEY (memberID) REFERENCES Members(memberID)
);

-- Sample data
INSERT INTO Loans (bookID, memberID, loanDate, dueDate) VALUES
(1, 1, '2025-08-10', '2025-08-24'),
(2, 2, '2025-08-11', '2025-08-25'),
(3, 3, '2025-08-12', '2025-08-26');

-- =========================================================
-- Table: BookAuthors (many-to-many)
-- =========================================================
CREATE TABLE BookAuthors (
    bookID INT NOT NULL,
    authorID INT NOT NULL,
    PRIMARY KEY (bookID, authorID),
    FOREIGN KEY (bookID) REFERENCES Books(bookID),
    FOREIGN KEY (authorID) REFERENCES Authors(authorID)
);

-- Sample data
INSERT INTO BookAuthors (bookID, authorID) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);

-- =========================================================
-- Table: BookCategories (optional M-M)
-- =========================================================
CREATE TABLE BookCategories (
    bookID INT NOT NULL,
    categoryID INT NOT NULL,
    PRIMARY KEY (bookID, categoryID),
    FOREIGN KEY (bookID) REFERENCES Books(bookID),
    FOREIGN KEY (categoryID) REFERENCES Categories(categoryID)
);

-- Sample data
INSERT INTO BookCategories (bookID, categoryID) VALUES
(1, 3),
(2, 2),
(3, 1),
(4, 1);

-- =========================================================
-- End of Library Management System SQL Script with Sample Data
-- =========================================================
