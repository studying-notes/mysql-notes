create table Weather
(
    id          int auto_increment
        primary key,
    recordDate  date not null,
    temperature int  not null
);

INSERT INTO leetcode_easy.Weather (id, recordDate, temperature) VALUES (1, '2020-10-20', 12);
INSERT INTO leetcode_easy.Weather (id, recordDate, temperature) VALUES (2, '2020-10-19', 13);
INSERT INTO leetcode_easy.Weather (id, recordDate, temperature) VALUES (3, '2020-10-18', 15);
INSERT INTO leetcode_easy.Weather (id, recordDate, temperature) VALUES (4, '2020-10-17', 16);
INSERT INTO leetcode_easy.Weather (id, recordDate, temperature) VALUES (5, '2020-10-16', 10);