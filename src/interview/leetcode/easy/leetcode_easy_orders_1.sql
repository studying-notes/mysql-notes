create table orders
(
    `order_number (PK)` int       null,
    customer_number     int       null,
    order_date          date      null,
    required_date       date      null,
    shipped_date        date      null,
    status              char(15)  null,
    comment             char(200) null
);

INSERT INTO leetcode_easy.orders (`order_number (PK)`, customer_number, order_date, required_date, shipped_date, status, comment) VALUES (1, 1, '2017-04-09', '2017-04-13', '2017-04-12', 'Closed', null);
INSERT INTO leetcode_easy.orders (`order_number (PK)`, customer_number, order_date, required_date, shipped_date, status, comment) VALUES (2, 2, '2017-04-15', '2017-04-20', '2017-04-18', 'Closed', null);
INSERT INTO leetcode_easy.orders (`order_number (PK)`, customer_number, order_date, required_date, shipped_date, status, comment) VALUES (3, 3, '2017-04-16', '2017-04-25', '2017-04-20', 'Closed', null);
INSERT INTO leetcode_easy.orders (`order_number (PK)`, customer_number, order_date, required_date, shipped_date, status, comment) VALUES (4, 3, '2017-04-18', '2017-04-28', '2017-04-25', 'Closed', null);
INSERT INTO leetcode_easy.orders (`order_number (PK)`, customer_number, order_date, required_date, shipped_date, status, comment) VALUES (5, 2, '2017-04-16', '2017-04-25', '2017-04-20', 'Closed', null);