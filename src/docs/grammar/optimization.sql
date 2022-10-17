CREATE TABLE t_4
(
    id   INT,
    name VARCHAR(20),
    age  INT,
    INDEX MULTI (id, name, age)
);

SHOW CREATE TABLE t_4;

INSERT INTO t_4
VALUES (1, 'a', 1),
       (2, 'b', 2),
       (3, 'c', 3),
       (4, 'd', 4),
       (5, 'e', 5),
       (6, 'f', 6),
       (7, 'g', 7),
       (8, 'h', 8),
       (9, 'i', 9),
       (10, 'j', 10);

EXPLAIN
SELECT *
FROM t_4
WHERE id < 4;

SHOW VARIABLES LIKE '%profiling%';

SELECT state,
       SUM(duration)                                                                                               AS total_r,
       ROUND(100 * SUM(duration) / (SELECT SUM(duration) FROM information_schema.profiling WHERE QUERY_ID = 1),
             2)                                                                                                    AS pct_r,
       COUNT(*)                                                                                                    AS calls,
       SUM(duration) / COUNT(*)                                                                                    AS 'r/call'
FROM information_schema.profiling
WHERE QUERY_ID = 1
GROUP BY state
ORDER BY total_r DESC;

show profile source for query 1;

SHOW VARIABLES LIKE '%trace%';

