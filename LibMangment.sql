 create database LibraryMangmentSystem
 create table Books
 (BookId int not null primary key identity(1,1),
 BookName varchar(250) not null,
 Category varchar(250) not null,
 PublishDate dateTime default( getDate()),
 NumberOfCopies int default(1) check(NumberOfCopies>=0),
 FK_AuthorId INT
 foreign key(FK_AuthorId) references Authors(AuthorId))

 


  create table Authors
  ( AuthorId int not null primary key identity(1,1), 
  AuthorName varchar(250) not null,
  Nationality varchar(250) not null,
  Email varchar(250) not null unique
  )

   Create table Members
   ( MemberId int not null primary key identity(1,1), 
  MemberName varchar(250) not null,
  Email varchar(250) not null unique,
  PhoneNo varchar(11) not null unique,
  Age int check(Age>18) not null,
   constraint chk_phone check(PhoneNo not like'%[^0-9]%'),--ignore any char at any place
   )
   
   Create table Users
   ( UserId int not null primary key identity(1,1), 
  UserName varchar(250) not null,
  Email varchar(250) not null unique,
  PhoneNo varchar(11) not null unique,
   constraint chk_user_phone check(PhoneNo not like'%[^0-9]%'),--ignore any char at any place
   )
   create   table Borwings
   ( BowringID int  not null primary key identity(1,1),
   FK_MemberId int not null,
   FK_BookId int not null,
   FK_AuthorId int not null,
   FK_UserId int not null,
   	 BowringDate datetime default(getdate()),
	 ExpactedReturnDate datetime  null,
	 InsertDate  datetime  not null,
     foreign key(FK_MemberId) references Members (MemberId),
	 foreign key (FK_BookId) references Books (BookId),
	 foreign key (FK_AuthorId) references Authors (AuthorId),
	 foreign key (FK_UserId) references Users (UserId),

    )

----------- insert Data---------
INSERT INTO Authors (AuthorName, Nationality, Email) VALUES 
('Naguib Mahfouz', 'Egyptian', 'naguib@example.com'),
('Ahmed Khaled Towfik', 'Egyptian', 'akt@example.com'),
('Agatha Christie', 'British', 'agatha@example.com'),
('Stephen King', 'American', 'king@example.com'),
('Paulo Coelho', 'Brazilian', 'paulo@example.com'),
('Taha Hussein', 'Egyptian', 'taha@example.com');

INSERT INTO Books (BookName, Category, FK_AuthorId, NumberOfCopies) VALUES 
('The Cairo Trilogy', 'Drama', 1, 5),
('Utopia', 'Sci-Fi', 2, 10),
('Murder on the Orient Express', 'Mystery', 3, 3),
('The Shining', 'Horror', 4, 7),
('The Alchemist', 'Adventure', 5, 12),
('The Days', 'Biography', 6, 4);

INSERT INTO Members (MemberName, Email, PhoneNo, Age) VALUES 
('Ahmed Ali', 'ahmed@gmail.com', '01012345678', 14),
('Sara Mohamed', 'sara@gmail.com', '01122334455', 22),
('Mona Zaki', 'mona@gmail.com', '01233445566', 30),
('Hassan Said', 'hassan@gmail.com', '01544556677', 28),
('Omar Khaled', 'omar@gmail.com', '01099887766', 19),
('Laila Ahmed', 'laila@gmail.com', '01177665544', 35);

INSERT INTO Users (UserName, Email, PhoneNo) VALUES 
('Admin_Hany', 'hany.admin@lib.com', '01000000001'),
('Librarian_Amr', 'amr.lib@lib.com', '01000000002'),
('User_Samy', 'samy@lib.com', '01000000003'),
('Staff_Maha', 'maha@lib.com', '01000000004'),
('Staff_Noor', 'noor@lib.com', '01000000005'),
('Manager_Ezz', 'ezz@lib.com', '01000000006');

INSERT INTO Borwings (FK_MemberId, FK_BookId, FK_AuthorId, FK_UserId, ExpactedReturnDate, InsertDate) VALUES
(1, 1, 1, 1, '2024-05-01', GETDATE()),
(2, 2, 2, 2, '2024-05-05', GETDATE()),
(3, 3, 3, 1, '2024-05-10', GETDATE()),
(4, 4, 4, 3, '2024-05-15', GETDATE()),
(5, 5, 5, 2, '2024-05-20', GETDATE()),
(6, 6, 6, 4, '2024-05-25', GETDATE());