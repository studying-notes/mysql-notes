create table Stocks
(
    stock_name    varchar(255)         null,
    operation     enum ('Sell', 'Buy') null,
    operation_day int                  null,
    price         int                  null
);

INSERT INTO leetcode_medium.Stocks (stock_name, operation, operation_day, price) VALUES ('Leetcode    ', 'Buy', 1, 1000);
INSERT INTO leetcode_medium.Stocks (stock_name, operation, operation_day, price) VALUES ('Corona Masks', 'Buy', 2, 10);
INSERT INTO leetcode_medium.Stocks (stock_name, operation, operation_day, price) VALUES ('Leetcode    ', 'Sell', 5, 9000);
INSERT INTO leetcode_medium.Stocks (stock_name, operation, operation_day, price) VALUES ('Handbags    ', 'Buy', 17, 30000);
INSERT INTO leetcode_medium.Stocks (stock_name, operation, operation_day, price) VALUES ('Corona Masks', 'Sell', 3, 1010);
INSERT INTO leetcode_medium.Stocks (stock_name, operation, operation_day, price) VALUES ('Corona Masks', 'Buy', 4, 1000);
INSERT INTO leetcode_medium.Stocks (stock_name, operation, operation_day, price) VALUES ('Corona Masks', 'Sell', 5, 500);
INSERT INTO leetcode_medium.Stocks (stock_name, operation, operation_day, price) VALUES ('Corona Masks', 'Buy', 6, 1000);
INSERT INTO leetcode_medium.Stocks (stock_name, operation, operation_day, price) VALUES ('Handbags    ', 'Sell', 29, 7000);
INSERT INTO leetcode_medium.Stocks (stock_name, operation, operation_day, price) VALUES ('Corona Masks', 'Sell', 10, 10000);