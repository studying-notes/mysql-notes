create table Orders
(
    product_id int  null,
    order_date date null,
    unit       int  null
);

INSERT INTO leetcode_easy.Orders (product_id, order_date, unit) VALUES (1, '2020-02-05', 60);
INSERT INTO leetcode_easy.Orders (product_id, order_date, unit) VALUES (1, '2020-02-10', 70);
INSERT INTO leetcode_easy.Orders (product_id, order_date, unit) VALUES (2, '2020-01-18', 30);
INSERT INTO leetcode_easy.Orders (product_id, order_date, unit) VALUES (2, '2020-02-11', 80);
INSERT INTO leetcode_easy.Orders (product_id, order_date, unit) VALUES (3, '2020-02-17', 2);
INSERT INTO leetcode_easy.Orders (product_id, order_date, unit) VALUES (3, '2020-02-24', 3);
INSERT INTO leetcode_easy.Orders (product_id, order_date, unit) VALUES (4, '2020-03-01', 20);
INSERT INTO leetcode_easy.Orders (product_id, order_date, unit) VALUES (4, '2020-03-04', 30);
INSERT INTO leetcode_easy.Orders (product_id, order_date, unit) VALUES (4, '2020-03-04', 60);
INSERT INTO leetcode_easy.Orders (product_id, order_date, unit) VALUES (5, '2020-02-25', 50);
INSERT INTO leetcode_easy.Orders (product_id, order_date, unit) VALUES (5, '2020-02-27', 50);
INSERT INTO leetcode_easy.Orders (product_id, order_date, unit) VALUES (5, '2020-03-01', 50);