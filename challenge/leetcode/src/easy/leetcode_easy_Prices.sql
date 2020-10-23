create table Prices
(
    product_id int  null,
    start_date date null,
    end_date   date null,
    price      int  null
);

INSERT INTO leetcode_easy.Prices (product_id, start_date, end_date, price) VALUES (1, '2019-02-17', '2019-02-28', 5);
INSERT INTO leetcode_easy.Prices (product_id, start_date, end_date, price) VALUES (1, '2019-03-01', '2019-03-22', 20);
INSERT INTO leetcode_easy.Prices (product_id, start_date, end_date, price) VALUES (2, '2019-02-01', '2019-02-20', 15);
INSERT INTO leetcode_easy.Prices (product_id, start_date, end_date, price) VALUES (2, '2019-02-21', '2019-03-31', 30);