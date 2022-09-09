---
date: 2020-10-13 20:52:34+08:00  # 创建日期
author: "Rustle Karl"  # 作者

title: "SQL 基础操作命令手册"  # 文章标题
url:  "posts/mysql/docs/grammar/sql"  # 设置网页永久链接
tags: [ "mysql", "sql" ]  # 标签
categories: [ "MySQL 学习笔记" ]  # 分类

toc: true  # 目录
draft: true  # 草稿
---

- [创建数据库](#创建数据库)
- [创建数据表](#创建数据表)
- [显示数据表描述信息](#显示数据表描述信息)
- [删除数据表](#删除数据表)
- [清空数据库](#清空数据库)
  - [MySQL](#mysql)
  - [SQLite](#sqlite)
- [切换当前数据库](#切换当前数据库)
- [查询数据](#查询数据)
- [多表查询](#多表查询)
- [返回唯一不同的值](#返回唯一不同的值)
- [Where 条件过滤](#where-条件过滤)
- [AND & OR 运算符](#and--or-运算符)
- [ORDER BY 排序](#order-by-排序)
  - [升序](#升序)
  - [降序](#降序)
- [插入新记录](#插入新记录)
- [更新表中的记录](#更新表中的记录)
- [删除表中的记录](#删除表中的记录)
- [规定返回记录的数目](#规定返回记录的数目)
- [LIKE 搜索模式](#like-搜索模式)
- [SQL 通配符](#sql-通配符)
- [IN 多个值](#in-多个值)
- [BETWEEN 范围](#between-范围)
- [AS 列的别名](#as-列的别名)
- [表的别名实例](#表的别名实例)

## 创建数据库

```sql
CREATE DATABASE runoob;
```

## 创建数据表

```sql
CREATE TABLE `apps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_name` char(20) NOT NULL DEFAULT '' COMMENT '站点名称',
  `url` varchar(255) NOT NULL DEFAULT '',
  `status` enum ('completed','cancelled_by_driver','cancelled_by_client') DEFAULT NULL,
  `country` char(10) NOT NULL DEFAULT '' COMMENT '国家',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
```

- NOT NULL - 指示某列不能存储 NULL 值
- UNIQUE - 保证某列的每行必须有唯一的值
- PRIMARY KEY - NOT NULL 和 UNIQUE 的结合，唯一标识
- FOREIGN KEY - 保证一个表中的数据匹配另一个表中的值的参照完整性
- CHECK - 保证列中的值符合指定的条件
- DEFAULT - 规定没有给列赋值时的默认值

```sql
CREATE TABLE IF NOT EXISTS `tableName`;
```

## 显示数据表描述信息

```sql
describe tableName;
```

## 删除数据表

```sql
DROP TABLE IF EXISTS `apps`;
```

## 清空数据库

> 删除表内的数据，但并不删除表本身

### MySQL

```sql
TRUNCATE TABLE `tableName`;
```

### SQLite

```sql
DELETE FROM `tableName`;
```

这种方法无法将递增数归零，如果要将递增数归零，可以同时执行以下命令：

```sql
DELETE FROM sqlite_sequence WHERE name = 'tableName';
```

> 当 SQLite 数据库中包含自增列时，会自动建立一个名为 sqlite_sequence 的表。这个表包含两个列：name 和 seq。name 记录自增列所在的表，seq 记录当前序号（下一条记录的编号就是当前序号加 1）。如果想把某个自增列的序号归零，只需要修改 sqlite_sequence 表就可以了。

## 切换当前数据库

```sql
USE runoob;
```

## 查询数据

```sql
SELECT *
FROM websites;

SELECT name, country
FROM websites;

SELECT country
FROM websites;
```

## 多表查询

```sql
select common_name as 'Bird', bird_families.scientific_name as 'Family'
from birds,
     bird_families
where birds.family_id = bird_families.family_id
  and order_id = 102
  and common_name != ''
order by common_name
limit 10;
```

```sql

```


## 返回唯一不同的值

```sql
SELECT DISTINCT country
FROM websites;
```

## Where 条件过滤

```sql
# = <> > < >= <=
# BETWEEN LIKE IN
SELECT *
FROM websites
WHERE country = 'cn';
```

SQL 使用单引号来环绕文本值，默认不区分大小写，大部分数据库系统也接受双引号。

## AND & OR 运算符

```sql
SELECT *
FROM websites
WHERE country = 'cn'
  AND alexa > 50;

SELECT *
FROM websites
WHERE country = 'usa'
   OR country = 'cn';

SELECT *
FROM websites
WHERE alexa > 2
  AND (country = 'cn' OR country = 'usa'); 
```

## ORDER BY 排序

### 升序

默认按照升序对记录进行排序。

```sql
SELECT *
FROM websites
ORDER BY alexa;

SELECT *
FROM websites
ORDER BY country, alexa;
```

### 降序

```sql
SELECT *
FROM websites
ORDER BY alexa DESC;
```

## 插入新记录

```sql
INSERT INTO websites (name, url, alexa, country)
VALUES ('百度', 'https://www.baidu.com/', '4', 'CN');

# 在指定的列插入数据
INSERT INTO websites (name, url, country)
VALUES ('stackoverflow', 'http://stackoverflow.com/', 'IND');
```

## 更新表中的记录

```sql
UPDATE websites
SET alexa='5000',
    country='USA'
WHERE name = '菜鸟教程';
```

## 删除表中的记录

```sql
DELETE
FROM websites
WHERE name = 'Facebook'
  AND country = 'USA';
```

## 规定返回记录的数目

```sql
SELECT *
FROM websites
LIMIT 2;
```

## LIKE 搜索模式

```sql
SELECT *
FROM websites
WHERE name LIKE 'G%';
# "%" 符号用于在模式的前后定义通配符

SELECT *
FROM websites
WHERE name LIKE '%w';

SELECT *
FROM websites
WHERE name LIKE '%oo%';

SELECT *
FROM websites
WHERE name NOT LIKE '%oo%';
```

## SQL 通配符

```sql
# %	替代 0 个或多个字符
# _	替代一个字符
# [charlist]	字符列中的任何单一字符
# [^charlist] 或 [!charlist]	不在字符列中的任何单一字符
SELECT *
FROM websites
WHERE name LIKE '_oogle';

SELECT *
FROM websites
WHERE name REGEXP '^[GFs]';

SELECT *
FROM websites
WHERE name REGEXP '^[A-H]';

SELECT *
FROM websites
WHERE name REGEXP '^[^A-H]';
```

## IN 多个值

```sql
SELECT *
FROM websites
WHERE name IN ('Google', '菜鸟教程');
```

## BETWEEN 范围

```sql
SELECT *
FROM websites
WHERE alexa BETWEEN 1 AND 20;

SELECT *
FROM websites
WHERE alexa NOT BETWEEN 1 AND 20;

SELECT *
FROM websites
WHERE (alexa BETWEEN 1 AND 20)
  AND country NOT IN ('USA', 'IND');

SELECT *
FROM websites
WHERE name BETWEEN 'A' AND 'H';

SELECT *
FROM websites
WHERE name NOT BETWEEN 'A' AND 'H';

SELECT *
FROM access_log;

SELECT *
FROM access_log
WHERE date BETWEEN '2016-05-10' AND '2016-05-14';
```

## AS 列的别名

```sql
SELECT name AS n, country AS c
FROM websites;

SELECT name, CONCAT(url, ', ', alexa, ', ', country) AS site_info
FROM websites;
```

## 表的别名实例

```sql
SELECT w.name, w.url, a.count, a.date
FROM Websites AS w, access_log AS a
WHERE a.site_id=w.id and w.name="菜鸟教程";
```
