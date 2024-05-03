use Downloads;

CREATE TABLE User (
    User_ID INT PRIMARY KEY AUTO_INCREMENT,
    Download_ID INT,
    First_Name VARCHAR(20) NOT NULL,
    Last_Name VARCHAR(20) NOT NULL,
    email VARCHAR(255) NOT NULL,
    FOREIGN KEY (Download_ID) REFERENCES Download(Download_ID)
);

CREATE TABLE Download (
    Download_ID INT PRIMARY KEY AUTO_INCREMENT,
    id_product INT,
    filename VARCHAR(255) NOT NULL,
    downloadTime VARCHAR(60) NOT NULL,
    FOREIGN KEY (id_product) REFERENCES product(id_product)
);

create table product(
    id_product int PRIMARY key auto_increment,
    name varchar(255) not null
)

INSERT INTO product (id_product, name) VALUES
(1, 'Product 1'),
(2, 'Product 2'),
(3, 'Product 3'),
(4, 'Product 4'),
(5, 'Product 5'),
(6, 'Product 6'),
(7, 'Product 7'),
(8, 'Product 8'),
(9, 'Product 9'),
(10, 'Product 10');

INSERT INTO Download (Download_ID, id_product, filename, downloadTime) VALUES
(1, 1, 'file1.pdf', '2022-01-01 10:00:00'),
(2, 2, 'file2.zip', '2022-01-02 11:30:00'),
(3, 3, 'file3.docx', '2022-01-03 09:45:00'),
(4, 4, 'file4.txt', '2022-01-04 15:20:00'),
(5, 5, 'file5.jpg', '2022-01-05 14:10:00'),
(6, 6, 'file6.mp4', '2022-01-06 12:05:00'),
(7, 7, 'file7.xlsx', '2022-01-07 08:55:00'),
(8, 8, 'file8.png', '2022-01-08 16:30:00'),
(9, 9, 'file9.rar', '2022-01-09 13:45:00'),
(10, 10, 'file10.pdf', '2022-01-10 10:20:00');

INSERT INTO User (User_ID, Download_ID, First_Name, Last_Name, email) VALUES
(1, 1, 'John', 'Doe', 'john.doe@example.com'),
(2, 2, 'Jane', 'Smith', 'jane.smith@example.com'),
(3, 3, 'Michael', 'Johnson', 'michael.johnson@example.com'),
(4, 4, 'Emily', 'Williams', 'emily.williams@example.com'),
(5, 5, 'Daniel', 'Brown', 'daniel.brown@example.com'),
(6, 6, 'Jessica', 'Jones', 'jessica.jones@example.com'),
(7, 7, 'David', 'Garcia', 'david.garcia@example.com'),
(8, 8, 'Jennifer', 'Martinez', 'jennifer.martinez@example.com'),
(9, 9, 'James', 'Hernandez', 'james.hernandez@example.com'),
(10, 10, 'Olivia', 'Lopez', 'olivia.lopez@example.com');

show tables;