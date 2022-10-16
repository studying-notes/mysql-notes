---
date: 2022-10-16T10:32:54+08:00  # 创建日期
author: "Rustle Karl"  # 作者

title: "数据表操作"  # 文章标题
url:  "posts/mysql/docs/grammar/table"  # 设置网页永久链接
tags: [ "mysql", "table" ]  # 标签
categories: [ "MySQL 学习笔记" ]  # 分类

toc: true  # 目录
draft: true  # 草稿
---

## 创建数据表

```sql
CREATE TABLE IF NOT EXISTS base.user (
    id INT(11) NOT NULL AUTO_INCREMENT,
    name VARCHAR(20) NOT NULL,
    age INT(11) NOT NULL,
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
```

## 创建 B 表，完整复制 A 表的结构和索引，而且不要数据

```sql
CREATE TABLE b LIKE a;
```

## 快速地复制一张表及其数据

可以使用 like 关键字，但是 like 只复制了表结构及其索引，而其数据没有复制，所以，需要使用 insert 来插入。

```sql
insert into new_table
select *
from old_table;
```

## 删除数据表

```sql
DROP TABLE IF EXISTS base.user;
```

## 清空数据表

> 删除表内的数据，但并不删除表本身

```sql
TRUNCATE TABLE base.user;
```

## 获取表内所有列的名称和类型

1. DESC

```sql
DESC user;

DESCRIBE user;
```

2. SHOW COLUMNS

> 显示指定表所有列的详细信息。

```sql
SHOW FULL COLUMNS FROM user;
```

- Field：字段名。
- Type：该字段类型。
- Collation：描述了如何对查询出来的数据进行比较和排序。
- Null：是否允许为空，NO 表示不允许，YES 表示允许。
- Key：键，表示该列是否有索引，例如：主键（PRI），唯一键（UNI），非唯一键或多列唯一键（MUL）等。如果该列为空，那么表示该列没有索引或该列作为多列索引的非第1列。若表中没有主键，但是某个列创建了唯一索引，且不能包含空值，则该列会显示为PRI。若某个列含有多个键，则会按照优先级显示：PRI>UNI>MUL。
- Default：该字段默认值。
- Extra：附加信息，如自增主键上的（auto_increment）。
- Privileges：权限，有 select、update 等。
- Comment：字段注释。

3. SHOW TABLE

> 显示建表命令。

```sql
SHOW CREATE TABLE user;
```

## 获取表的详细信息

例如存储引擎、行数、更新时间等。

可以使用 `SHOW TABLE STATUS` 获取表的详细信息。

```sql
SHOW TABLE STATUS FROM base;

SHOW TABLE STATUS FROM base LIKE 'user';
```

不加 `LIKE` 时，会显示所有表的信息。

1. `show table status from db_name` 查询 db_name 数据库里所有表的信息。
2. `show table status from db_name like 'lhrusr'\G;` 查询 db_name 里 lhrusr 表的信息。
3. `show table status from db_name like 'uc%'` 查询 db_name 数据库里表名以 uc 开头的表的信息。

![](../../assets/images/docs/grammar/maintenance/table_status.png)

也可以使用 `information_schema.tables` 表来查询。

```sql
SELECT * FROM information_schema.tables WHERE table_schema = 'base' AND table_name = 'user';
```

## 查看视图（VIEW）的定义

```sql
SHOW CREATE VIEW VIEW_NAME;
SHOW CREATE TABLE VIEW_NAME;
```

直接查询 `INFORMATION_SCHEMA.VIEWS` 表来获取视图（VIEW）的定义。

## 查询指定数据库中指定表的所有字段名

可以通过查询 INFORMATION_SCHEMA.COLUMNS 表来获取所有字段名，查询的 SQL 为：

```sql
select *
from information_schema.columns
where table_schema = 'information_schema'
  and table_name = 'columns';
```

## 增加列

```sql
alter table tableName add column newColumn int;
```

## 在表的指定位置添加列

```sql
-- 在字段 id 前插入 age 字段，类型 tinyint(4)
alter table tableName
    add `age` tinyint(4) not null default 0 after id;
```

## 修改列

```sql
ALTER TABLE tableName CHANGE COLUMN column newColumn int;
```

## 修改列的字符集

```sql
ALTER TABLE status
    MODIFY COLUMN serial_number varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
```

## 删除列

```sql
alter table test drop column age;
```

## 对一张表同时进行查询和更新

MySQL 不允许对同一张表同时进行查询和更新，可以使用临时表的方式来处理。

```sql

```
