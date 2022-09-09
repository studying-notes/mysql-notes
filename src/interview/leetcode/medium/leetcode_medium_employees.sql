create table employees
(
    employee_id   int          null,
    employee_name varchar(255) null,
    manager_id    int          null
);

INSERT INTO leetcode_medium.employees (employee_id, employee_name, manager_id) VALUES (1, 'Boss', 1);
INSERT INTO leetcode_medium.employees (employee_id, employee_name, manager_id) VALUES (3, 'Alice', 3);
INSERT INTO leetcode_medium.employees (employee_id, employee_name, manager_id) VALUES (2, 'Bob', 1);
INSERT INTO leetcode_medium.employees (employee_id, employee_name, manager_id) VALUES (4, 'Daniel', 2);
INSERT INTO leetcode_medium.employees (employee_id, employee_name, manager_id) VALUES (7, 'Luis', 4);
INSERT INTO leetcode_medium.employees (employee_id, employee_name, manager_id) VALUES (8, 'Jhon', 3);
INSERT INTO leetcode_medium.employees (employee_id, employee_name, manager_id) VALUES (9, 'Angela', 8);
INSERT INTO leetcode_medium.employees (employee_id, employee_name, manager_id) VALUES (77, 'Robert', 1);