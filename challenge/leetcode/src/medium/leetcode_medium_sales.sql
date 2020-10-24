create table sales
(
    sale_date date                       null,
    fruit     enum ('apples', 'oranges') null,
    sold_num  int                        null
);

INSERT INTO leetcode_medium.sales (sale_date, fruit, sold_num) VALUES ('2020-05-01', 'apples', 10);
INSERT INTO leetcode_medium.sales (sale_date, fruit, sold_num) VALUES ('2020-05-01', 'oranges', 8);
INSERT INTO leetcode_medium.sales (sale_date, fruit, sold_num) VALUES ('2020-05-02', 'apples', 15);
INSERT INTO leetcode_medium.sales (sale_date, fruit, sold_num) VALUES ('2020-05-02', 'oranges', 15);
INSERT INTO leetcode_medium.sales (sale_date, fruit, sold_num) VALUES ('2020-05-03', 'apples', 20);
INSERT INTO leetcode_medium.sales (sale_date, fruit, sold_num) VALUES ('2020-05-03', 'oranges', 0);
INSERT INTO leetcode_medium.sales (sale_date, fruit, sold_num) VALUES ('2020-05-04', 'apples', 15);
INSERT INTO leetcode_medium.sales (sale_date, fruit, sold_num) VALUES ('2020-05-04', 'oranges', 16);