CREATE DATABASE Task

USE Task

CREATE TABLE Roles(
Id INT PRIMARY KEY IDENTITY,
Name VARCHAR(25)
)

CREATE TABLE Users(
Id INT PRIMARY KEY IDENTITY,
Username VARCHAR(100),
Password VARCHAR(50),
RoleId INT REFERENCES Roles(Id) NOT NULL
)


INSERT INTO Roles VALUES
('Admin'),
('Moderator'),
('Member')

INSERT INTO Users VALUES
('Nigar','nigar123',1),
('Zuzu','zuzu123',2),
('Shamama','samama123',3)


SELECT u.Id,u.Username,r.Name Role FROM Users u
JOIN Roles r
ON u.RoleId=r.Id


------------------------------------------------------------------------


CREATE TABLE Colors(
Id INT PRIMARY KEY IDENTITY,
Name NVARCHAR(25)
)

CREATE TABLE Categories(
Id INT PRIMARY KEY IDENTITY,
Name NVARCHAR(25)
)


CREATE TABLE Products(
Id INT PRIMARY KEY IDENTITY,
Name NVARCHAR(25) NOT NULL,
Price DECIMAL(6,2) NOT NULL,
Cost INT NOT NULL,
CategoryId INT REFERENCES Categories(Id)
)

CREATE TABLE ProductColors(
ProductId INT REFERENCES Products(Id),
ColorId INT REFERENCES Colors(Id)
)



INSERT INTO Categories VALUES 
('Dress'),
('T-shirt'),
('Sweat')

INSERT INTO Colors VALUES 
('Red'),
('Black'),
('Green'),
('Grey')

INSERT INTO Products VALUES 
('PULL&BEAR','75',15,1),
('MAVI','30.5',13,2),
('BERSHKA','90.0',20,3)


INSERT INTO ProductColors VALUES
(1,1),
(1,2),
(1,3),
(1,4),
(2,2),
(2,3),
(3,1),
(3,2),
(3,4)


SELECT p.Name,ca.Name Category,co.Name Color,p.Price FROM Products p
JOIN Categories ca
ON p.CategoryId=ca.Id
JOIN ProductColors pc
ON pc.ProductId=p.Id
JOIN Colors co
ON  pc.ColorId=co.Id