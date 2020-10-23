create table Products
(
    product_id       int          null,
    product_name     varchar(255) null,
    product_category varchar(255) null
);

INSERT INTO leetcode_easy.Products (product_id, product_name, product_category) VALUES (1, 'Leetcode Solutions', 'Book');
INSERT INTO leetcode_easy.Products (product_id, product_name, product_category) VALUES (2, 'Jewels of Stringology', 'Book');
INSERT INTO leetcode_easy.Products (product_id, product_name, product_category) VALUES (3, 'HP', 'Laptop');
INSERT INTO leetcode_easy.Products (product_id, product_name, product_category) VALUES (4, 'Lenovo', 'Laptop');
INSERT INTO leetcode_easy.Products (product_id, product_name, product_category) VALUES (5, 'Leetcode Kit', 'T-shirt');