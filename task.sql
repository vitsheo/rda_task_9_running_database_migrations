-- liquibase formatted sql

-- changeset developer:1 labels:0.0.1
CREATE TABLE Countries (
    ID INT NOT NULL AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    PRIMARY KEY (ID)
);

CREATE TABLE Products (
    ID INT NOT NULL AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    PRIMARY KEY (ID)
);

CREATE TABLE Warehouses (
    ID INT NOT NULL AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    Address VARCHAR(255),
    CountryID INT,
    PRIMARY KEY (ID),
    FOREIGN KEY (CountryID) REFERENCES Countries(ID)
);

CREATE TABLE ProductInventory (
    ID INT NOT NULL AUTO_INCREMENT,
    ProductID INT NOT NULL,
    WarehouseAmount INT NOT NULL DEFAULT 0,
    WarehouseID INT NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (ProductID) REFERENCES Products(ID),
    FOREIGN KEY (WarehouseID) REFERENCES Warehouses(ID)
);
-- rollback DROP TABLE ProductInventory;
-- rollback DROP TABLE Warehouses;
-- rollback DROP TABLE Products;
-- rollback DROP TABLE Countries;

-- changeset developer:2 labels:0.0.2
CREATE TABLE Users (
    ID INT NOT NULL AUTO_INCREMENT,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    Email VARCHAR(255) NOT NULL,
    PRIMARY KEY (ID)
);
-- rollback DROP TABLE Users;

-- changeset developer:3 labels:0.0.3
CREATE INDEX idx_users_email ON Users (Email);
-- rollback DROP INDEX idx_users_email ON Users;
