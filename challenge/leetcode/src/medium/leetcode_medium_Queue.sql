create table Queue
(
    person_id   int          null,
    person_name varchar(255) null,
    weight      int          null,
    turn        int          null
);

INSERT INTO leetcode_medium.Queue (person_id, person_name, weight, turn) VALUES (5, 'George Washington', 250, 1);
INSERT INTO leetcode_medium.Queue (person_id, person_name, weight, turn) VALUES (3, 'John Adams       ', 350, 2);
INSERT INTO leetcode_medium.Queue (person_id, person_name, weight, turn) VALUES (6, 'Thomas Jefferson ', 400, 3);
INSERT INTO leetcode_medium.Queue (person_id, person_name, weight, turn) VALUES (2, 'Will Johnliams   ', 200, 4);
INSERT INTO leetcode_medium.Queue (person_id, person_name, weight, turn) VALUES (4, 'Thomas Jefferson ', 175, 5);
INSERT INTO leetcode_medium.Queue (person_id, person_name, weight, turn) VALUES (1, 'James Elephant   ', 500, 6);