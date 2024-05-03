CREATE DATABASE MyGuitarShop;

USE MyGuitarShop;

CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY IDENTITY,
    CategoryName VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY,
    CategoryID INT REFERENCES Categories(CategoryID),
    ProductCode VARCHAR(10) NOT NULL UNIQUE,
    ProductName VARCHAR(255) NOT NULL,
    Description VARCHAR(255) NOT NULL,
    ListPrice VARCHAR(20) NOT NULL,
    DiscountPercent INT DEFAULT 0,
    DateAdded DATETIME DEFAULT NULL
);

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY,
    EmailAddress VARCHAR(50) NOT NULL UNIQUE,
    Password VARCHAR(60) NOT NULL,
    FirstName VARCHAR(60) NOT NULL,
    LastName VARCHAR(60) NOT NULL,
    ShippingAddress INT DEFAULT NULL,
    BillingAddressID INT DEFAULT NULL
);

CREATE TABLE Addresses (
    AddressID INT PRIMARY KEY IDENTITY,
    CustomerID INT REFERENCES Customers(CustomerID),
    Line1 VARCHAR(60) NOT NULL,
    Line2 VARCHAR(60) DEFAULT NULL,
    City VARCHAR(40) NOT NULL,
    State VARCHAR(2) NOT NULL,
    ZipCode VARCHAR(10) NOT NULL,
    Phone VARCHAR(12) NOT NULL,
    Disabled INT NOT NULL DEFAULT 0
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY,
    CustomerID INT REFERENCES Customers(CustomerID),
    OrderDate DATETIME NOT NULL,
    ShipAmount VARCHAR(40) DEFAULT NULL,
    TaxAmount VARCHAR(40) NOT NULL,
    ShipDate DATETIME DEFAULT NULL,
    ShipAddressID INT NOT NULL,
    CardType VARCHAR(30) NOT NULL,
    CardNumber VARCHAR(16) NOT NULL,
    CardExpires VARCHAR(7) NOT NULL,
    BillingAddressID INT DEFAULT NULL
);

CREATE TABLE OrderItems (
    ItemID INT PRIMARY KEY IDENTITY,
    OrderID INT REFERENCES Orders(OrderID),
    ProductID INT REFERENCES Products(ProductID),
    ItemPrice VARCHAR(60) NOT NULL,
    DiscountAmount INT DEFAULT NULL,
    Quantity INT NOT NULL
);

CREATE TABLE Administrators (
    AdminID INT PRIMARY KEY IDENTITY,
    EmailAddress VARCHAR(70) NOT NULL,
    Password VARCHAR(50) NOT NULL,
    FirstName VARCHAR(60) NOT NULL,
    LastName VARCHAR(60) NOT NULL
);
