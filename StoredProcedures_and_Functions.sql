create database OnlineStoreDB;
use OnlineStoreDB;
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    JoinDate DATE
);
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Price DECIMAL(10,2),
    Stock INT
);
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
CREATE TABLE OrderItems (
    OrderItemID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    PriceEach DECIMAL(10,2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
-- Customers
INSERT INTO Customers VALUES
(1, 'Alice', 'alice@example.com', '2022-01-01'),
(2, 'Bob', 'bob@example.com', '2022-02-15'),
(3, 'Charlie', 'charlie@example.com', '2022-03-10');

-- Products
INSERT INTO Products VALUES
(101, 'Laptop', 50000.00, 10),
(102, 'Mouse', 500.00, 50),
(103, 'Keyboard', 1000.00, 30);

-- Orders
INSERT INTO Orders VALUES
(1001, 1, '2022-03-01', 50500.00),
(1002, 2, '2022-04-05', 1500.00),
(1003, 1, '2022-04-10', 500.00);

-- OrderItems
INSERT INTO OrderItems VALUES
(1, 1001, 101, 1, 50000.00),
(2, 1001, 102, 1, 500.00),
(3, 1002, 103, 1, 1000.00),
(4, 1002, 102, 1, 500.00),
(5, 1003, 102, 1, 500.00);


-- Create a stored procedure to add a new product to the Products table.
drop procedure if exists AddProduct;
DELIMITER //
create procedure AddProduct(
IN Product_ID INT,
IN Product_Name VARCHAR(100),
IN Price DECIMAL(10,2),
IN Stock INT
)
BEGIN
	insert into products(ProductID,ProductName,Price,Stock)
	values(Product_ID,Product_Name,Price,Stock);
END //
DELIMITER ;

call AddProduct(104,"Printer",1100.00,20);
select * from products where Stock=20;

-- Create a stored procedure to update stock of a product by ProductID.
set sql_safe_updates=0;
DELIMITER @@
create procedure up_pro(in Product_ID int)
begin
update products set stock=100 where Product_ID=ProductID;
end@@
DELIMITER ;
call up_pro(104);
select * from products;

-- Create a stored procedure that accepts a CustomerID and returns all orders placed by that customer.
DELIMITER $$
create procedure sel(in Customer_ID int)
begin
select * from orders where CustomerID=CustomerID;
end$$
Delimiter ;
call sel(3);

-- Create a stored procedure to delete an order and its items (from Orders and OrderItems).
drop procedure del;
delimiter @@
create procedure del(in Order_ID int )
begin
delete from orderitems where OrderID=Order_ID;
delete from orders where OrderID=Order_ID;
end@@
delimiter ;
call del(1001); 

-- Create a scalar UDF that returns the number of days since a customer joined.
 DELIMITER @@
 create function NumberOfDays(
 JD date)
 returns int
 deterministic
 begin
 return datediff(curdate(),JD);
 end@@
 DELIMITER ;
 select *,NumberOfDays(JoinDate) from customers;
 drop function NumberOfDays;
 select *,datediff(curdate(),JoinDate) as DaysJoined from customers;
 -- Create a scalar UDF that returns the total number of orders for a given CustomerID.
Delimiter @@
create function total_orders(
CustID int)
returns int
deterministic
begin
declare Order_Count int;
select count(OrderID) into Order_Count from orders where CustomerID=CustID;
return Order_Count;
end@@
Delimiter ;
drop function total_orders;
select *,total_orders(CustomerID) from customers;
