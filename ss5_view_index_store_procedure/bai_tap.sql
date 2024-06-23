CREATE DATABASE DemoDB;
USE DemoDB;

CREATE TABLE Products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    `code` NVARCHAR(50) UNIQUE,
    `name` NVARCHAR(100),
    price DECIMAL(10, 2),
    amount INT,
    `description` NVARCHAR(255),
    `status` NVARCHAR(50)
);

INSERT INTO products (`Name`, Price, Amount, `Description`, `Status`)
VALUES 
('Product 1', 10.00, 100, 'Description 1', 'Available'),
('Product 2', 20.00, 50, 'Description 2', 'Out of Stock'),
('Product 3', 30.00, 75, 'Description 3', 'Available');

CREATE UNIQUE INDEX idx_product_code ON products(`Code`);

CREATE INDEX idx_product_name_product_price ON products(`Name`, Price);

-- Trước khi tạo index
SELECT * FROM Products WHERE `Name` = 'Product 1' AND Price = 10.00;

-- Sau khi tạo index
EXPLAIN SELECT * FROM Products WHERE `Name` = 'Product 1' AND Price = 10.00;

-- tạo view
CREATE VIEW product_view AS
SELECT `code`, `Name`, Price, `Status`
FROM Products;

-- sửa đổi view (thêm cột amount)
CREATE OR REPLACE VIEW product_view AS
SELECT `code`, `Name`, Price, `Status`, Amount
FROM Products;

-- xóa view
DROP VIEW ProductView;

-- Tạo stored procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
DELIMITER //
CREATE PROCEDURE get_all_products()
BEGIN
    SELECT * FROM Products;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE add_product(
    in new_code NVARCHAR(50),
    in new_name NVARCHAR(100),
    in new_price DECIMAL(10, 2),
    in new_amount INT,
    in new_description NVARCHAR(255),
    in new_status NVARCHAR(50)
    )
BEGIN
    INSERT INTO Products (`Code`, `Name`, Price, Amount, Description, Status)
    VALUES (new_code, new_name, new_price, new_amount, new_description, new_status);
END //
DELIMITER ;

CALL add_product ('P4', 'Product 4', 70.00, 95, 'Description 4', 'Available');

DELIMITER //
CREATE PROCEDURE update_product(
    in id INT,
    in new_code NVARCHAR(50),
    in new_name NVARCHAR(100),
    in new_price DECIMAL(10, 2),
    in new_amount INT,
    in new_description NVARCHAR(255),
    in new_status NVARCHAR(50)
)
BEGIN
    UPDATE Products
    SET `Code` = new_code,
        `Name` = new_name,
        `Price` = new_price,
        `Amount` = new_amount,
        `Description` = new_description,
        `Status` = new_status
    WHERE products.id = id;
END //
DELIMITER ;

CALL update_product(1, 'P1', 'Product one', 99.99, 10, 'Description one', 'not Available');

DELIMITER //
CREATE PROCEDURE DeleteProduct(
    in id INT
)
BEGIN
    DELETE FROM products
    WHERE products.id = id;
END //
DELIMITER ;

