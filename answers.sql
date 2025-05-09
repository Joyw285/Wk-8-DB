-- Step 1: Create the database
CREATE DATABASE IF NOT EXISTS LibraryDB;

-- Use the database
USE LibraryDB;
CREATE TABLE Members (
    MemberID INT AUTO_INCREMENT PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(15),
    JoinDate DATE DEFAULT (CURRENT_DATE)
);

-- Authors Table
CREATE TABLE Authors (
    AuthorID INT AUTO_INCREMENT PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    Bio TEXT
);

-- Books Table
CREATE TABLE Books (
    BookID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(200) NOT NULL,
    ISBN VARCHAR(20) UNIQUE,
    Publisher VARCHAR(100),
    PublishedYear YEAR,
    CopiesAvailable INT DEFAULT 1
);

-- M:M Relationship: BookAuthors
CREATE TABLE BookAuthors (
    BookID INT,
    AuthorID INT,
    PRIMARY KEY (BookID, AuthorID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

-- Borrowing Table
CREATE TABLE Borrowing (
    BorrowingID INT AUTO_INCREMENT PRIMARY KEY,
    MemberID INT NOT NULL,
    BookID INT NOT NULL,
    BorrowDate DATE NOT NULL DEFAULT (CURRENT_DATE),
    DueDate DATE NOT NULL,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

-- Returns Table
CREATE TABLE Returns (
    ReturnID INT AUTO_INCREMENT PRIMARY KEY,
    BorrowingID INT UNIQUE,
    ReturnDate DATE NOT NULL,
    Notes TEXT,
    FOREIGN KEY (BorrowingID) REFERENCES Borrowing(BorrowingID)
);

-- Sample Data

-- Members
INSERT INTO Members (FullName, Email, Phone) VALUES
('Emma Watson', 'emma.watson@gmail.com', '555-1000'),
('Daniel Craig', 'daniel.craig@gmail.com', '555-2000');

-- Authors
INSERT INTO Authors (FullName, Bio) VALUES
('J.K. Rowling', 'British author, best known for the Harry Potter series'),
('George Orwell', 'English novelist, essayist, journalist');

-- Books
INSERT INTO Books (Title, ISBN, Publisher, PublishedYear, CopiesAvailable) VALUES
('Harry Potter and the Sorcerer\'s Stone', '9780439708180', 'Scholastic', 1997, 3),
('1984', '9780451524935', 'Plume', 1949, 2);

-- BookAuthors
INSERT INTO BookAuthors (BookID, AuthorID) VALUES
(1, 1), -- Harry Potter by J.K. Rowling
(2, 2); -- 1984 by George Orwell

-- Borrowing Records
INSERT INTO Borrowing (MemberID, BookID, BorrowDate, DueDate) VALUES
(1, 1, '2025-05-01', '2025-05-15'),
(2, 2, '2025-05-03', '2025-05-17');

-- Returns
INSERT INTO Returns (BorrowingID, ReturnDate, Notes) VALUES
(1, '2025-05-10', 'Returned in good condition');
