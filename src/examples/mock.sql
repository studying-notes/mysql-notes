CREATE DATABASE IF NOT EXISTS base;

use base;

drop table if exists `vote_record`;

create table if not exists `vote_record`
(
    `id`          int(11)     not null auto_increment,
    `user_id`     varchar(20) not null,
    `vote_id`     int(11)     not null,
    `group_id`    int(11)     not null,
    `create_time` datetime    not null,
    primary key (`id`),
    key `index_user_id` (`user_id`)
) engine = innodb
  default charset = utf8mb4;

create table if not exists `vote_record_memory`
(
    `id`          int(11)     not null auto_increment,
    `user_id`     varchar(20) not null,
    `vote_id`     int(11)     not null,
    `group_id`    int(11)     not null,
    `create_time` datetime    not null,
    primary key (`id`),
    key `index_user_id` (`user_id`)
) engine = memory
  default charset = utf8mb4;

create
    definer = `root`@`%` function `rand_string`(n int) returns varchar(255) charset utf8mb4
    deterministic
begin
    declare chars_str varchar(100) default 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    declare return_str varchar(255) default '';
    declare i int default 0;
    while i < n
        do
            set return_str = concat(return_str, substring(chars_str, floor(1 + rand() * 62), 1));
            set i = i + 1;
        end while;
    return return_str;
end;

create
    definer = `root`@`%` procedure `add_vote_memory`(in n int)
begin
    declare i int default 1;
    while (i <= n)
        do
            insert into vote_record_memory (user_id, vote_id, group_id, create_time)
            values (rand_string(20), floor(rand() * 1000), floor(rand() * 100), now());
            set i = i + 1;
        end while;
end;

call add_vote_memory(100000);

insert into vote_record
select *
from vote_record_memory;

drop table vote_record_memory;
