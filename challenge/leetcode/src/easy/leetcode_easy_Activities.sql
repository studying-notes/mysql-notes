create database leetcode_easy;
use leetcode_easy;

create table Activities
(
    sell_date date         null,
    product   varchar(255) null
);

INSERT INTO leetcode_easy.Activities (sell_date, product)
VALUES ('2020-05-30', 'Headphone');
INSERT INTO leetcode_easy.Activities (sell_date, product)
VALUES ('2020-06-01', 'Pencil');
INSERT INTO leetcode_easy.Activities (sell_date, product)
VALUES ('2020-06-02', 'Mask');
INSERT INTO leetcode_easy.Activities (sell_date, product)
VALUES ('2020-05-30', 'Basketball');
INSERT INTO leetcode_easy.Activities (sell_date, product)
VALUES ('2020-06-01', 'Bible');
INSERT INTO leetcode_easy.Activities (sell_date, product)
VALUES ('2020-06-02', 'Mask');
INSERT INTO leetcode_easy.Activities (sell_date, product)
VALUES ('2020-05-30', 'T-Shirt');