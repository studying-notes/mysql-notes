create table UnitsSold
(
    product_id    int  null,
    purchase_date date null,
    units         int  null
);

INSERT INTO leetcode_easy.UnitsSold (product_id, purchase_date, units) VALUES (1, '2019-02-25', 100);
INSERT INTO leetcode_easy.UnitsSold (product_id, purchase_date, units) VALUES (1, '2019-03-01', 15);
INSERT INTO leetcode_easy.UnitsSold (product_id, purchase_date, units) VALUES (2, '2019-02-10', 200);
INSERT INTO leetcode_easy.UnitsSold (product_id, purchase_date, units) VALUES (2, '2019-03-22', 30);