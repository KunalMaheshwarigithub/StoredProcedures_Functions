# 🛒 OnlineStoreDB – SQL Project

This project showcases a structured relational database system for a fictional **Online Store**, built using MySQL. It includes schema design, sample data, stored procedures, and user-defined functions to simulate common e-commerce operations such as managing customers, products, orders, and order items.

---

## 📌 Features

- Creation of 4 core tables: `Customers`, `Products`, `Orders`, and `OrderItems`
- Sample data insertion for testing and demo purposes
- Stored procedures for inserting, updating, retrieving, and deleting data
- Scalar functions for calculating customer-related metrics
- Foreign key relationships with referential integrity

---

## 🗃️ Database Structure

### 1. `Customers`
| Field       | Type         |
|-------------|--------------|
| CustomerID  | INT (PK)     |
| Name        | VARCHAR(100) |
| Email       | VARCHAR(100) |
| JoinDate    | DATE         |

### 2. `Products`
| Field       | Type           |
|-------------|----------------|
| ProductID   | INT (PK)       |
| ProductName | VARCHAR(100)   |
| Price       | DECIMAL(10,2)  |
| Stock       | INT            |

### 3. `Orders`
| Field       | Type           |
|-------------|----------------|
| OrderID     | INT (PK)       |
| CustomerID  | INT (FK)       |
| OrderDate   | DATE           |
| TotalAmount | DECIMAL(10,2)  |

### 4. `OrderItems`
| Field        | Type           |
|--------------|----------------|
| OrderItemID  | INT (PK)       |
| OrderID      | INT (FK)       |
| ProductID    | INT (FK)       |
| Quantity     | INT            |
| PriceEach    | DECIMAL(10,2)  |

---

## 📥 Sample Data

Sample data is inserted for quick testing and practice:

- 👥 3 Customers
- 📦 3 Products
- 🧾 3 Orders
- 🛍️ 5 Order Items

---

## ⚙️ Stored Procedures

### ➕ `AddProduct`  
Adds a new product to the Products table.

```sql
CALL AddProduct(104, 'Printer', 1100.00, 20);
```

---

### 🔁 `up_pro`  
Updates stock to 100 for a specific product ID.

```sql
CALL up_pro(104);
```

---

### 📋 `sel`  
Retrieves all orders placed by a given customer ID.

```sql
CALL sel(1);
```

---

### ❌ `del`  
Deletes a specific order and its items from `Orders` and `OrderItems`.

```sql
CALL del(1001);
```

---

## 🧠 User Defined Functions (UDFs)

### 📅 `NumberOfDays(JD)`  
Returns the number of days since a customer joined.

```sql
SELECT *, NumberOfDays(JoinDate) FROM Customers;
```

---

### 🔢 `total_orders(CustID)`  
Returns the total number of orders for a customer.

```sql
SELECT *, total_orders(CustomerID) FROM Customers;
```

---

## 🧑‍💻 How to Run

1. Open your MySQL client (e.g., MySQL Workbench, phpMyAdmin).
2. Run the full script to create the database and tables.
3. Insert sample records.
4. Execute procedures and functions to test.

---

## 🚀 Future Enhancements

- Add triggers for automatic stock update after orders
- Add indexes for performance tuning
- Integrate with frontend UI (e.g., Streamlit, Flask)
- Generate analytics reports using JOINs or views

---

## 📚 Skills Practiced

- SQL Schema Design
- Normalization and Foreign Key Constraints
- Stored Procedures and UDFs
- DDL, DML, and aggregate functions
- Real-world data modeling for e-commerce

---

## 📁 Project Structure

```
/OnlineStoreDB
│
├── StoredProcedures_and_Functions.sql      # Full SQL script (schema, data, procedures, functions)
└── README.md              # Project documentation
```

---

## Author
Kunal Maheshwari | SQL Ennthusiast
