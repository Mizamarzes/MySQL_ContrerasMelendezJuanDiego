CREATE DATABASE stories;
use stories;

CREATE TABLE Downloads(
	DownloadID INT PRIMARY KEY,
	FileName VARCHAR(60)   NOT NULL,
	ShipDate       DATETIME  DEFAULT NULL
);

CREATE TABLE Users(
	UserID INT PRIMARY KEY,
	FirstName  VARCHAR(60)  NOT NULL,
	LastName  VARCHAR(60)   NOT NULL,
	EmailAddress  VARCHAR(255) NOT NULL UNIQUE,
	DownloadID INT,
	FOREIGN KEY(DownloadID) REFERENCES Downloads(DownloadID)
);

CREATE TABLE Products(
	ProductID INT PRIMARY KEY,
	Name VARCHAR(60)  NOT NULL,
	DownloadID INT,
	FOREIGN KEY(DownloadID) REFERENCES Downloads(DownloadID)
);

INSERT INTO Downloads (DownloadID, FileName, ShipDate)
VALUES
    (1, 'file1.pdf', '2024-04-30 08:00:00'),
    (2, 'file2.pdf', '2024-04-30 08:00:00'),
    (3, 'file3.pdf', '2024-04-30 08:00:00'),
    (4, 'file4.pdf', '2024-04-30 08:00:00'),
    (5, 'file5.pdf', '2024-04-30 08:00:00'),
    (6, 'file6.pdf', '2024-04-30 08:00:00'),
    (7, 'file7.pdf', '2024-04-30 08:00:00'),
    (8, 'file8.pdf', '2024-04-30 08:00:00'),
    (9, 'file9.pdf', '2024-04-30 08:00:00'),
    (10, 'file10.pdf', '2024-04-30 08:00:00');

INSERT INTO Users (UserID, FirstName, LastName, EmailAddress, DownloadID)
VALUES
    (1, 'John', 'Doe', 'john.doe@example.com', 1),
    (2, 'Jane', 'Smith', 'jane.smith@example.com', 2),
    (3, 'Michael', 'Johnson', 'michael.johnson@example.com', 3),
    (4, 'Emily', 'Williams', 'emily.williams@example.com', 4),
    (5, 'William', 'Brown', 'william.brown@example.com', 5),
    (6, 'Sophia', 'Jones', 'sophia.jones@example.com', 6),
    (7, 'Jacob', 'Garcia', 'jacob.garcia@example.com', 7),
    (8, 'Olivia', 'Martinez', 'olivia.martinez@example.com', 8),
    (9, 'Daniel', 'Hernandez', 'daniel.hernandez@example.com', 9),
    (10, 'Isabella', 'Lopez', 'isabella.lopez@example.com', 10);

INSERT INTO Products (ProductID, Name, DownloadID)
VALUES
    (1, 'Product 1', 1),
    (2, 'Product 2', 2),
    (3, 'Product 3', 3),
    (4, 'Product 4', 4),
    (5, 'Product 5', 5),
    (6, 'Product 6', 6),
    (7, 'Product 7', 7),
    (8, 'Product 8', 8),
    (9, 'Product 9', 9),
    (10, 'Product 10', 10);
    
select * from downloads d  