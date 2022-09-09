create table Delivery
(
    delivery_id                 int  null,
    customer_id                 int  null,
    order_date                  date null,
    customer_pref_delivery_date date null
);

INSERT INTO leetcode_easy.Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) VALUES (1, 1, '2019-08-01', '2019-08-02');
INSERT INTO leetcode_easy.Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) VALUES (2, 5, '2019-08-02', '2019-08-02');
INSERT INTO leetcode_easy.Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) VALUES (3, 1, '2019-08-11', '2019-08-11');
INSERT INTO leetcode_easy.Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) VALUES (4, 3, '2019-08-24', '2019-08-26');
INSERT INTO leetcode_easy.Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) VALUES (5, 4, '2019-08-21', '2019-08-22');
INSERT INTO leetcode_easy.Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) VALUES (6, 2, '2019-08-11', '2019-08-13');