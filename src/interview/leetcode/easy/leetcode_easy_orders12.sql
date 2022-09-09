create table orders12
(
    order_id   int          null,
    order_date varchar(255) null,
    com_id     int          null,
    sales_id   int          null,
    amount     int          null
);

INSERT INTO leetcode_easy.orders12 (order_id, order_date, com_id, sales_id, amount) VALUES (1, '1/1/2014', 3, 4, 100000);
INSERT INTO leetcode_easy.orders12 (order_id, order_date, com_id, sales_id, amount) VALUES (2, '2/1/2014', 4, 5, 5000);
INSERT INTO leetcode_easy.orders12 (order_id, order_date, com_id, sales_id, amount) VALUES (3, '3/1/2014', 1, 1, 50000);
INSERT INTO leetcode_easy.orders12 (order_id, order_date, com_id, sales_id, amount) VALUES (4, '4/1/2014', 1, 4, 25000);