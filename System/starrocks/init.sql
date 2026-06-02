CREATE DATABASE IF NOT EXISTS demo;
USE demo;

CREATE TABLE IF NOT EXISTS orders (
  order_id    INT NOT NULL,
  customer    VARCHAR(100),
  amount      DECIMAL(10, 2),
  order_date  DATE,
  status      VARCHAR(20)
)
DUPLICATE KEY(order_id)
DISTRIBUTED BY HASH(order_id) BUCKETS 4
PROPERTIES ("replication_num" = "1");

INSERT INTO orders VALUES
  (1, 'Alice',   150.00, '2024-01-15', 'completed'),
  (2, 'Bob',     230.50, '2024-01-16', 'pending'),
  (3, 'Charlie', 89.99,  '2024-01-17', 'completed'),
  (4, 'Diana',   320.00, '2024-01-18', 'cancelled'),
  (5, 'Eve',     410.75, '2024-01-19', 'completed');
