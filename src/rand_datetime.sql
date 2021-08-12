CREATE
    DEFINER = `root`@`%` FUNCTION `rand_datetime`(sd DATETIME, ed DATETIME) RETURNS datetime
    DETERMINISTIC
BEGIN
    DECLARE sub INT DEFAULT 0;
    DECLARE ret DATETIME;
    SET sub = ABS(UNIX_TIMESTAMP(ed) - UNIX_TIMESTAMP(sd));
    SET ret = DATE_ADD(sd, INTERVAL FLOOR(1 + RAND() * (sub - 1)) SECOND);
    RETURN ret;
END;

-- 测试
SELECT rand_datetime(DATE_FORMAT('2017-1-1 00:00:00', '%Y-%m-%d %H:%i:%s'),
                     DATE_FORMAT('2020-12-31 23:59:59', '%Y-%m-%d %H:%i:%s')) AS t;