---
date: 2020-10-12T10:41:51+08:00  # 创建日期
author: "Rustle Karl"  # 作者

# 文章
title: "MySQL 函数"  # 文章标题
url:  "posts/mysql/docs/func"  # 设置网页永久链接
tags: [ "mysql"]  # 标签
series: [ "MySQL 学习笔记"]  # 系列
categories: [ "学习笔记"]  # 分类

# 章节
weight: 20 # 排序优先级
chapter: false  # 设置为章节

index: true  # 是否可以被索引
toc: true  # 是否自动生成目录
draft: false  # 草稿
---

## 条件判断函数

### coalesce

coalesce(expression_1, expression_2, ..., expression_n) 依次参考各参数表达式，遇到非 null 值即停止并返回该值。如果所有的表达式都是空值，最终将返回一个空值。

### case

```sql
select country_name,
       case
           when avg(weather_state) <= 15 then 'Cold'
           when avg(weather_state) >= 25 then 'Hot'
           else 'Warm' end weather_type
from Countries,
     Weather46
where Countries.country_id = Weather46.country_id
  and month(day) = 11
group by country_name;
```

## 时间函数

- NOW() 返回当前的日期和时间
- CURDATE() 返回当前的日期
- CURTIME() 返回当前的时间
- DATE() 提取日期或日期/时间表达式的日期部分
- EXTRACT() 返回日期/时间的单独部分
- DATE_ADD() 向日期添加指定的时间间隔

### DATE_SUB() 

从日期减去指定的时间间隔。

```sql
select DATE_SUB('2019-07-5', INTERVAL 1 DAY);
```

- DATEDIFF() 返回两个日期之间的天数
- DATE_FORMAT() 用不同的格式显示日期/时间

## COUNT()

> 返回行数

```sql
SELECT COUNT(*) FROM tableName;
```

```sql
SELECT COUNT(*) FROM tableName GROUP BY key_id LIMIT 10;
```

## IFNULL()

```sql
select ifnull(email, 'email'), id from users;
```

## 自定义函数

### 第 N 高的薪水

https://leetcode-cn.com/problems/nth-highest-salary/

```sql
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  SET n = N-1;
  RETURN (     
  SELECT DISTINCT Salary FROM Employee ORDER BY Salary DESC LIMIT n,1
  );
END
```

```sql

```

```sql

```

```sql

```

```sql

```

```sql

```

```sql

```

