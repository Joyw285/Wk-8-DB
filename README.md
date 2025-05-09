# 📚 Library Management System (MySQL Database)

This project is a complete relational database implementation of a **Library Management System**, built using MySQL. It allows tracking of books, authors, members, borrowing activity, and book returns.

---

## ✅ Features

- Manage library members and their contact information.
- Store book details and their associated authors.
- Support many-to-many relationships between books and authors.
- Record borrowing activities by members.
- Track book returns and return notes.

---

## 🗃️ Database Tables

1. `Members`
Stores library members' personal information.
 2. `Authors`
Stores book authors.
 3. `Books`
Stores book details.
 4. `BookAuthors`
Bridge table for many-to-many relationship between books and authors.
 5. `Borrowing`
Records books borrowed by members.
 6. `Returns`
Tracks returned books.

---

## 🚀 How to Use

1. Import `library_management.sql` into your MySQL database (via phpMyAdmin or MySQL Workbench).
2. Explore the tables, modify sample data, or build queries for borrowing reports, overdue books, etc.

---

## 📊 ER Diagram

A visual ERD is included in this project as `library_erd.png`.

---