--queries to create database and tables

CREATE DATABASE library;

CREATE TABLE Books(bid SERIAL PRIMARY KEY, bname VARCHAR(50) NOT NULL, bauthor VARCHAR(50) NOT NULL, byear INT NOT NULL, bamount INT NOT NULL);
CREATE TABLE Readers(id INT PRIMARY KEY NOT NULL, name VARCHAR(50) NOT NULL, surname VARCHAR(50) NOT NULL, age INT NOT NULL, email VARCHAR(75) NOT NULL, phone INT NOT NULL, occupation VARCHAR(50) NOT NULL);
CREATE TABLE Borrow(id INT NOT NULL REFERENCES Readers(id) ON DELETE CASCADE ON UPDATE CASCADE, bid INT NOT NULL REFERENCES Books(bid) ON DELETE CASCADE ON UPDATE CASCADE, date DATE NOT NULL);

SELECT bname from Books WHERE book_name LIKE $1;
SELECT bauthor from Books WHERE book_author LIKE $1;
SELECT byear from Books WHERE book_year LIKE $1;
