create table salesperson
(
    sales_id        int          null,
    name            varchar(255) null,
    salary          int          null,
    commission_rate int          null,
    hire_date       varchar(255) null
);

INSERT INTO leetcode_easy.salesperson (sales_id, name, salary, commission_rate, hire_date) VALUES (1, 'John', 100000, 6, '4/1/2006');
INSERT INTO leetcode_easy.salesperson (sales_id, name, salary, commission_rate, hire_date) VALUES (2, 'Amy', 120000, 5, '5/1/2010');
INSERT INTO leetcode_easy.salesperson (sales_id, name, salary, commission_rate, hire_date) VALUES (3, 'Mark', 65000, 12, '12/25/2008');
INSERT INTO leetcode_easy.salesperson (sales_id, name, salary, commission_rate, hire_date) VALUES (4, 'Pam', 25000, 25, '1/1/2005');
INSERT INTO leetcode_easy.salesperson (sales_id, name, salary, commission_rate, hire_date) VALUES (5, 'Alex', 50000, 10, '2/3/2007');