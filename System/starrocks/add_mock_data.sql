USE demo;

CREATE TABLE IF NOT EXISTS customers (
  customer_id INT NOT NULL,
  name VARCHAR(100),
  email VARCHAR(100),
  country VARCHAR(50)
)
DUPLICATE KEY(customer_id)
DISTRIBUTED BY HASH(customer_id) BUCKETS 4
PROPERTIES ("replication_num" = "1");

INSERT INTO customers VALUES
  (1, 'Alice', 'alice@example.com', 'USA'),
  (2, 'Bob', 'bob@example.com', 'UK'),
  (3, 'Charlie', 'charlie@example.com', 'Canada'),
  (4, 'Diana', 'diana@example.com', 'Australia'),
  (5, 'Eve', 'eve@example.com', 'USA');

CREATE TABLE IF NOT EXISTS products (
  product_id INT NOT NULL,
  name VARCHAR(100),
  category VARCHAR(50),
  price DECIMAL(10, 2)
)
DUPLICATE KEY(product_id)
DISTRIBUTED BY HASH(product_id) BUCKETS 4
PROPERTIES ("replication_num" = "1");

INSERT INTO products VALUES
  (101, 'Laptop', 'Electronics', 1200.00),
  (102, 'Smartphone', 'Electronics', 800.00),
  (103, 'Desk Chair', 'Furniture', 150.00),
  (104, 'Monitor', 'Electronics', 300.00),
  (105, 'Coffee Mug', 'Kitchen', 15.00);

CREATE TABLE IF NOT EXISTS order_items (
  order_id INT NOT NULL,
  product_id INT NOT NULL,
  quantity INT,
  unit_price DECIMAL(10, 2)
)
DUPLICATE KEY(order_id, product_id)
DISTRIBUTED BY HASH(order_id) BUCKETS 4
PROPERTIES ("replication_num" = "1");

INSERT INTO order_items VALUES
  (1, 101, 1, 1200.00),
  (1, 105, 2, 15.00),
  (2, 102, 1, 800.00),
  (3, 103, 1, 150.00),
  (4, 104, 2, 300.00),
  (5, 101, 1, 1200.00),
  (5, 102, 1, 800.00);
