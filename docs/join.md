---
date: 2020-10-15T20:52:34+08:00  # 创建日期
author: "Rustle Karl"  # 作者

# 文章
title: "MySQL JOIN 方法理解"  # 文章标题
url:  "posts/mysql/docs/join"  # 设置网页永久链接
tags: [ "sql", "mysql"]  # 标签
series: [ "MySQL 学习笔记"]  # 系列
categories: [ "学习笔记"]  # 分类

# 章节
weight: 20 # 排序优先级
chapter: false  # 设置为章节

index: true  # 是否可以被索引
toc: true  # 是否自动生成目录
draft: false  # 草稿
---

## JOIN 简介

- `INNER JOIN`：如果表中有至少一个匹配，则返回行
- `LEFT JOIN`：即使右表中没有匹配，也从左表返回所有的行
- `RIGHT JOIN`：即使左表中没有匹配，也从右表返回所有的行
- `FULL JOIN`：只要其中一个表中存在匹配，则返回行，MySQL 不支持该方法

## INNER JOIN / JOIN

如果表中有至少一个匹配，则返回行。

[![BS017F.gif](https://s1.ax1x.com/2020/10/20/BS017F.gif)](https://imgchr.com/i/BS017F)

```sql
SELECT websites.id, websites.name, access_log.count, access_log.date
FROM websites
         INNER JOIN access_log
                    ON websites.id = access_log.site_id;
```

## LEFT JOIN

即使右表中没有匹配，也从左表返回所有的行。

```sql
SELECT websites.name, access_log.count, access_log.date
FROM websites
         LEFT JOIN access_log
                   ON websites.id = access_log.site_id
ORDER BY access_log.count DESC;
```

### Leetcode 题目示例

https://leetcode-cn.com/problems/combine-two-tables/

## RIGHT JOIN

即使左表中没有匹配，也从右表返回所有的行。

```sql
SELECT websites.name, access_log.count, access_log.date
FROM websites
         RIGHT JOIN access_log
                    ON websites.id = access_log.site_id
ORDER BY access_log.count DESC;
```

### ON 和 WHERE 的区别

数据库在通过连接两张或多张表来返回记录时，都会生成一张中间的临时表，然后再将这张临时表返回给用户。在使用 left join 时，on 和 where 条件的区别如下：

- on 条件是在生成临时表时使用的条件，它不管 on 中的条件是否为真，都会返回左边表中的记录。
- where 条件是在临时表生成好后，再对临时表进行过滤的条件。这时已经没有 left join 的含义（必须返回左边表的记录）了，条件不为真的就全部过滤掉。

## UNION

> 将一个表的行添加到另一个表的下面，操作符合并两个或多个 SELECT 语句的结果，UNION 内部的每个 SELECT 语句必须拥有相同数量的列。列也必须拥有相似的数据类型。同时，每个 SELECT 语句中的列的顺序必须相同。

### 只会选取不同的值

> 相同行只留一行。

```sql
SELECT country
FROM websites
UNION
SELECT country
FROM apps
ORDER BY country;
```

### 选取所有的值

> 保留全部相同行。

```sql
SELECT country, name
FROM websites
WHERE country = 'cn'
UNION ALL
SELECT country, app_name
FROM apps
WHERE country = 'cn'
ORDER BY country;
```

## 从一个表复制信息到另一个表

> 语句从一个表复制数据，然后把数据插入到一个新创建的表中

### CREATE TABLE

```sql
CREATE TABLE websites_backup
SELECT *
FROM websites;
```

### INSERT INTO SELECT

> 语句从一个表复制数据，然后把数据插入到一个已存在的表中

```sql
INSERT INTO websites (name, country)
SELECT app_name, country
FROM apps;

INSERT INTO websites (name, country)
SELECT app_name, country
FROM apps
WHERE id = 1;
```
