---
date: 2020-10-12 10:41:51+08:00  # 创建日期
author: "Rustle Karl"  # 作者

title: "函数"  # 文章标题
url:  "posts/mysql/docs/grammar/func"  # 设置网页永久链接
tags: [ "mysql", "func" ]  # 标签
categories: [ "MySQL 学习笔记" ]  # 分类

toc: true  # 目录
draft: true  # 草稿
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

### IFNULL()

```sql
select ifnull(email, 'email'), id from users;
```

- null 和任何值都不能比较。
- null 只能用 is null 或者 is not null 来判断，不能用 = 或者 = 来判断。
- 对于 varchar 数据类型，无论是空字符串还是 NULL 值都不占用任何空间。
- 对于 char 类型，无论是空字符串还是 NULL 值会占用空间，所占用空间大小取决于建表时候指定的 char 数据类型的大小。

使用 IFNULL() 方法能使 MySQL 中的查询更加精确。IFNULL() 方法将会测试它的第一个参数，若不为 NULL 则返回该参数的值，否则返回第二个参数的值。

```sql
select vote_id, ifnull(vote_id, 'unknown') as `id`
from vote_record;
```

### IF()

三位运算符

```sql
select if(email, 'email', 'noemail'), id from users;
```

SQLite 不支持 IF 函数

```sql
select case when email is not null then 'email' else 'noemail' end as email, id from users;
```

### any / all / in / some

用于子查询，子查询就是指在一个 select 语句中嵌套另一个 select 语句。

any / all 关键字必须与一个比较操作符一起使用。any 表示有任何一个满足就返回 true，all 表示全部都满足才返回 true。

语句 some 是 any 的别名，用法相同。

not in 是 “<>all” 的别名，用法相同。

语句 in 与 “=any” 是相同的。

## COUNT()

> 返回行数

```sql
SELECT COUNT(*) FROM tableName;
```

```sql
SELECT COUNT(*) FROM tableName GROUP BY key_id LIMIT 10;
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
