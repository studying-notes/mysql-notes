create table company
(
    city   varchar(255) null,
    name   varchar(255) null,
    com_id int          null
);

INSERT INTO leetcode_easy.company (city, name, com_id) VALUES ('Boston', 'RED', 1);
INSERT INTO leetcode_easy.company (city, name, com_id) VALUES ('New York', 'ORANGE', 2);
INSERT INTO leetcode_easy.company (city, name, com_id) VALUES ('Boston', 'YELLOW', 3);
INSERT INTO leetcode_easy.company (city, name, com_id) VALUES ('Austin', 'GREEN', 4);