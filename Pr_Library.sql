
---*Creating Database*

create database Library
 use Library

 create table Books(Book_id int primary key,Title varchar(260) not null,Author_id int,Genre varchar(100), Publish_year int,Price money)


---*Creating tables*

 select*
 from Books

delete from Books where Book_id=1

insert into Books(Book_id,Title,Author_id,Genre,Publish_year,Price)
values 
(8,'Harry Potter and the Sorcerer’s Stone',8,'Fantasy',1997,19.99),
(9,'The Lord of the Rings',7,'Fantasy',1954,22.99),
(10,'The Da Vinci Code',9,'Mystery/Thriller',2003,15.99),
(11,'Animal Farm',2,'Political Allegory',1945,6.99),
(12,'Fahrenheit 451',10,'Dystopian',1953,13.49),
(13,'Brave New World',11,'Dystopian',1932,9.49),
(14,'The Chronicles of Narnia',12,'Fantasy',1950,10.49),
(15,'The Shining',13,'Horror',1977,14.99),
(16,'Crime and Punishment',14,'Fiction',1866,8.49),
(17,'Wuthering Heights',15,'Romance',1847,7.49),
(18,'Jane Eyre',16,'Gothic Fiction',1847,9.99),
(19,'The Catcher in the Rye',6,'Fiction',1951,9.99),
(20,'Les Misérables',17,'Historical Fiction',1862,12.99)

create table Author(Author_ID int primary key, First_Name varchar(100),Last_Name varchar(100),Birth_year int,Country varchar(100))

insert into Author(Author_ID,First_Name,Last_Name,Birth_year,Country)
values
(2,'George','Orwell',1903,'UK'),
(3,'Jane','Austen',1775,'UK'),
(4,'F. Scott','Fitzgerald',1896,'USA'),
(5,'Herman','Melville',1819,'USA'),
(6,'J.D.','Salinger',1919,'USA'),
(7,'J.R.R.','Tolkien',1892,'UK'),
(8,'J.K.','Rowling',1965,'UK'),
(9,'Dan','Brown',1964,'USA'),
(10,'George','Orwell',1903,'UK'),
(11,'Aldous','Huxley',1894,'UK'),
(12,'C.S.','Lewis',1898,'UK'),
(13,'Stephen','King',1947,'USA'),
(14,'Fyodor','Dostoevsky',1821,'Russia'),
(15,'Emily','Brontë',1818,'UK'),
(16,'Charlotte','Brontë',1816,'UK'),
(17,'Victor','Hugo',1802,'France'),
(18,'Leo','Tolstoy',1828,'Russia'),
(19,'J.D.','Salinger',1919,'USA'),
(20,'Victor','Hugo',1802,'France')

select*
from Author

create table Readers(reader_id int primary key,First_Name varchar(200),Last_Name varchar(200),Phone varchar(20),Registration_Date date)

select*
from Readers

insert into Readers(reader_id,First_Name,Last_Name,Phone,Registration_Date)
values
(2,'Jane','Smith','234-567-8901','2020-06-21'),
(3,'Alice','Johnson','345-678-9012','2019-07-10'),
(4,'Bob','Brown','456-789-0123','2018-08-22'),
(5,'Charlie','Davis','567-890-1234','2022-01-30'),
(6,'Emily','Wilson','678-901-2345','2021-11-18'),
(7,'Michael','Miller','789-012-3456','2020-03-14'),
(8,'Sarah','Moore','890-123-4567','2019-09-25'),
(9,'David','Taylor','901-234-5678','2022-02-05'),
(10,'Olivia','Anderson','012-345-6789','2020-12-01'),
(11,'Daniel','Thomas','123-234-5679','2021-10-11'),
(12,'Isabella','Jackson','234-345-6780','2022-03-22'),
(13,'Lucas','White','345-456-7891','2021-07-30'),
(14,'Sophia','Harris','456-567-8902','2020-04-18'),
(15,'Ethan','Clark','567-678-9013','2019-08-05'),
(16,'Mia','Lewis','678-789-0124','2022-04-02'),
(17,'William','Robinson','789-890-1235','2021-02-28'),
(18,'Emma','Walker','890-901-2346','2020-09-12'),
(19,'Noah','Allen','901-012-3457','2019-06-15'),
(20,'Ava','King','012-123-4568','2021-05-05')

create table Rent(Rental_Id int primary key,Reader_ID int,Book_Id int, Rental_Date date, Return_date date null,"Status" varchar(50),Rating int null,Review text null) 

select*
from Rent

insert into Rent(Rental_Id,Reader_ID,Book_Id,Rental_Date,Return_date,Status,Rating,Review)
values
(4,4,4,'2023-04-05','2023-04-12','Returned',3,'The plot was confusing.'),
(5,5,2,'2023-05-10',NULL,'Rented',NULL,NULL),
(6,6,6,'2023-06-01','2023-06-10','Returned',4,'Interesting, but a bit slow.'),
(7,7,7,'2023-07-15',NULL,'Rented',NULL,NULL),
(8,8,8,'2023-08-20',NULL,'Rented',NULL,NULL),
(9,9,9,'2023-09-25','2023-10-02','Returned',5,'Excellent! Couldn’t put it down!'),
(10,10,10,'2023-10-05',NULL,'Rented',NULL,NULL),
(11,11,6,'2023-11-10','2023-11-15','Returned',4,'Great for fans of the genre.'),
(12,12,1,'2023-12-01',NULL,'Rented',NULL,NULL),
(13,13,5,'2023-01-20','2023-01-27','Returned',3,'The book was okay.'),
(14,14,4,'2023-02-18','2023-02-25','Returned',5,'Amazing, very captivating.'),
(15,15,3,'2023-03-10',NULL,'Rented',NULL,NULL),
(16,16,7,'2023-04-15','2023-04-20','Returned',4,'Good book, well-written.'),
(17,17,8,'2023-05-20',NULL,'Rented',NULL,NULL),
(18,18,9,'2023-06-10','2023-06-17','Returned',2,'Not my favorite. Too slow.'),
(19,19,10,'2023-07-05',NULL,'Rented',NULL,NULL),
(20,20,2,'2023-08-01',NULL,'Rented',NULL,NULL)

--*adding and fixing constraints*;


alter table Rent
add constraint fk_reader
foreign key (Reader_ID) references Readers(Reader_ID)

alter table Rent
add constraint fk_Books
foreign key (Book_Id) references Books (Book_Id)

alter table Books
add constraint fk_authorid
foreign key(Author_id) references Author(Author_id)

alter table Rent
add constraint check_rating check (Rating between 1 and 5);

alter table rent
alter column Rental_date Date not null

create index idx_book_title on Books (title)

---*final check*
 select*
 from Books

 select*
from Author
 
select*
from Readers

select*
from Rent


INSERT INTO Rent (Rental_Id, Reader_ID, Book_Id, Rental_Date, Return_date, Status, Rating, Review)
VALUES
(21, 2, 12, '2023-01-05', '2023-01-12', 'Returned', 5, 'Absolutely loved it.'),
(22, 3, 13, '2023-01-15', NULL, 'Rented', NULL, NULL),
(23, 4, 14, '2023-02-01', '2023-02-10', 'Returned', 4, 'Very imaginative.'),
(24, 5, 15, '2023-02-20', NULL, 'Rented', NULL, NULL),
(25, 6, 16, '2023-03-05', '2023-03-12', 'Returned', 3, 'Not bad.'),
(26, 7, 17, '2023-03-18', NULL, 'Rented', NULL, NULL),
(27, 8, 18, '2023-04-02', '2023-04-09', 'Returned', 5, 'Classic and timeless.'),
(28, 9, 19, '2023-04-15', NULL, 'Rented', NULL, NULL),
(29, 10, 20, '2023-05-01', '2023-05-08', 'Returned', 4, 'Very touching.'),
(30, 11, 2, '2023-05-12', NULL, 'Rented', NULL, NULL),
(31, 12, 3, '2023-06-03', '2023-06-10', 'Returned', 2, 'Too slow for me.'),
(32, 13, 4, '2023-06-18', NULL, 'Rented', NULL, NULL),
(33, 14, 5, '2023-07-01', '2023-07-08', 'Returned', 5, 'Masterpiece.'),
(34, 15, 6, '2023-07-12', NULL, 'Rented', NULL, NULL),
(35, 16, 7, '2023-08-05', '2023-08-12', 'Returned', 4, 'Interesting story.'),
(36, 17, 8, '2023-08-20', NULL, 'Rented', NULL, NULL),
(37, 18, 9, '2023-09-01', '2023-09-08', 'Returned', 3, 'Could be better.'),
(38, 19, 10, '2023-09-15', NULL, 'Rented', NULL, NULL),
(39, 20, 11, '2023-10-03', '2023-10-10', 'Returned', 4, 'Solid read.'),
(40, 2, 12, '2023-10-18', NULL, 'Rented', NULL, NULL);


CREATE TABLE Payments (
    Payment_ID INT PRIMARY KEY,
    Rental_ID INT NOT NULL,
    Payment_Date DATE NOT NULL,
    Amount MONEY NOT NULL,
    Method VARCHAR(50),
    FOREIGN KEY (Rental_ID) REFERENCES Rent(Rental_ID)
);

INSERT INTO Payments (Payment_ID, Rental_ID, Payment_Date, Amount, Method)
VALUES 
(1, 4,  '2023-04-05', 4.99, 'Credit Card'),
(2, 6,  '2023-06-01', 5.49, 'PayPal'),
(3, 9,  '2023-09-25', 6.99, 'Cash'),
(4, 11, '2023-11-10', 4.49, 'Credit Card'),
(5, 13, '2023-01-20', 3.99, 'Credit Card'),
(6, 14, '2023-02-18', 4.99, 'Cash'),
(7, 16, '2023-04-15', 5.99, 'PayPal'),
(8, 18, '2023-06-10', 3.49, 'Credit Card'),
(9, 21, '2023-01-05', 4.99, 'Credit Card'),
(10, 23, '2023-02-01', 5.99, 'PayPal'),
(11, 25, '2023-03-05', 3.49, 'Credit Card'),
(12, 27, '2023-04-02', 6.49, 'Credit Card'),
(13, 29, '2023-05-01', 5.29, 'PayPal'),
(14, 31, '2023-06-03', 2.99, 'Cash'),
(15, 33, '2023-07-01', 6.29, 'Credit Card'),
(16, 35, '2023-08-05', 4.59, 'PayPal'),
(17, 37, '2023-09-01', 3.99, 'Cash'),
(18, 39, '2023-10-03', 5.49, 'Credit Card'),
(19, 24, '2023-02-20', 5.89, 'PayPal'),
(20, 28, '2023-04-15', 4.79, 'Credit Card');

select*
from Payments

ALTER TABLE Books
ADD Rent_Price MONEY;

UPDATE Books
SET Rent_Price = CAST(Price * 0.3 AS MONEY);

UPDATE Books
SET Rent_Price = ROUND(Rent_Price, 2);

ALTER TABLE Payments
ADD Payment_Type VARCHAR(20);

UPDATE Payments
SET Payment_Type = 'Rent'
WHERE Rental_ID IS NOT NULL;

ALTER TABLE Payments
ALTER COLUMN Rental_ID INT NULL;

ALTER TABLE Payments
ADD Book_ID INT;

ALTER TABLE Payments
ADD CONSTRAINT fk_book_payment FOREIGN KEY (Book_ID) REFERENCES Books(Book_ID);

INSERT INTO Payments (Payment_ID, Rental_ID, Book_ID, Payment_Date, Amount, Method, Payment_Type)
VALUES 
(101, NULL, 5, '2023-12-01', 11.50, 'Credit Card', 'Purchase'),
(102, NULL, 6, '2023-12-05', 9.99, 'PayPal', 'Purchase'),
(103, NULL, 20, '2023-12-08', 12.99, 'Cash', 'Purchase'),
(104, NULL, 8, '2023-12-12', 19.99, 'Credit Card', 'Purchase'),
(105, NULL, 10, '2023-12-15', 15.99, 'PayPal', 'Purchase');

UPDATE Payments
SET Book_ID = r.Book_Id
FROM Payments p
JOIN Rent r ON p.Rental_ID = r.Rental_Id
WHERE p.Payment_Type = 'Rent';

ALTER TABLE Payments
ADD Reader_ID INT;


UPDATE Payments
SET Reader_ID = r.Reader_ID
FROM Payments p
JOIN Rent r ON p.Rental_ID = r.Rental_ID
WHERE p.Payment_Type = 'Rent';


UPDATE Payments SET Reader_ID = 5 WHERE Payment_ID = 101;
UPDATE Payments SET Reader_ID = 6 WHERE Payment_ID = 102;
UPDATE Payments SET Reader_ID = 7 WHERE Payment_ID = 103;
UPDATE Payments SET Reader_ID = 8 WHERE Payment_ID = 104;
UPDATE Payments SET Reader_ID = 9 WHERE Payment_ID = 105;


