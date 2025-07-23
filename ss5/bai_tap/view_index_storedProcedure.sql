-- Bước 1; Tạo cơ sở dữ liệu demo
create database if not exists demo1;

use demo1;
-- Bước 2: Tạo bảng Products với các trường dữ liệu sau:
CREATE TABLE Products (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    productCode VARCHAR(50) NOT NULL,
    productName VARCHAR(100),
    productPrice DECIMAL(10, 2),
    productAmount INT,
    productDescription TEXT,
    productStatus VARCHAR(20)
);

-- Chèn dữ liệu mẫu
INSERT INTO Products (productCode, productName, productPrice, productAmount, productDescription, productStatus)
VALUES
('P001', 'Laptop Dell', 1500.00, 10, 'Dell Inspiron 15', N'Còn hàng'),
('P002', 'Mouse Logitech', 25.00, 50, 'Wireless Mouse', N'Còn hàng'),
('P003', 'Keyboard HP', 30.00, 30, 'Wired Keyboard', N'Hết hàng'),
('P004', 'Monitor Samsung', 200.00, 20, '24 inch Monitor', N'Còn hàng');

-- Bước 3: Tạo index và so sánh truy vấn
-- Trước khi tạo index
EXPLAIN SELECT * FROM Products WHERE productCode = 'P002';
EXPLAIN SELECT * FROM Products WHERE productName = 'Laptop Dell' AND productPrice = 1500.00;

-- Tạo Unique Index trên productCode
CREATE UNIQUE INDEX idx_unique_product_code ON Products(productCode);

-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
CREATE INDEX idx_composite_name_price ON Products(productName, productPrice);

-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
EXPLAIN SELECT * FROM Products WHERE productCode = 'P002';
EXPLAIN SELECT * FROM Products WHERE productName = 'Laptop Dell' AND productPrice = 1500.00;

-- Bước 4: VIEW
-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
-- Tạo VIEW
CREATE VIEW view_product_info AS
SELECT productCode, productName, productPrice, productStatus
FROM Products;

-- Sửa VIEW
CREATE OR REPLACE VIEW view_product_info AS
SELECT productCode, productName, productPrice, productStatus, productAmount
FROM Products;

-- Xoá VIEW
DROP VIEW IF EXISTS view_product_info;

-- Bước 5: Stored Procedure
-- Lấy tất cả sản phẩm
DELIMITER //

CREATE PROCEDURE GetAllProducts()
BEGIN
    SELECT * FROM Products;
END //

DELIMITER ;

--  Thêm sản phẩm mới
DELIMITER //

CREATE PROCEDURE AddProduct(
    IN p_code VARCHAR(50),
    IN p_name VARCHAR(100),
    IN p_price DECIMAL(10,2),
    IN p_amount INT,
    IN p_description TEXT,
    IN p_status VARCHAR(20)
)
BEGIN
    INSERT INTO Products (productCode, productName, productPrice, productAmount, productDescription, productStatus)
    VALUES (p_code, p_name, p_price, p_amount, p_description, p_status);
END //

DELIMITER ;

-- Sửa sản phẩm theo Id
DELIMITER //

CREATE PROCEDURE UpdateProductById(
    IN p_id INT,
    IN p_code VARCHAR(50),
    IN p_name VARCHAR(100),
    IN p_price DECIMAL(10,2),
    IN p_amount INT,
    IN p_description TEXT,
    IN p_status VARCHAR(20)
)
BEGIN
    UPDATE Products
    SET productCode = p_code,
        productName = p_name,
        productPrice = p_price,
        productAmount = p_amount,
        productDescription = p_description,
        productStatus = p_status
    WHERE Id = p_id;
END //

DELIMITER ;

-- Xoá sản phẩm theo Id
DELIMITER $$

CREATE PROCEDURE DeleteProductById(IN p_id INT)
BEGIN
    DELETE FROM Products WHERE Id = p_id;
END $$

DELIMITER ;




