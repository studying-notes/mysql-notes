---
date: 2020-10-14T20:48:27+08:00  # 创建日期
author: "Rustle Karl"  # 作者

# 文章
title: "MySQL 函数"  # 文章标题
# description: "文章描述"
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

## 时间函数

- NOW() 返回当前的日期和时间
- CURDATE() 返回当前的日期
- CURTIME() 返回当前的时间
- DATE() 提取日期或日期/时间表达式的日期部分
- EXTRACT() 返回日期/时间的单独部分
- DATE_ADD() 向日期添加指定的时间间隔
- DATE_SUB() 从日期减去指定的时间间隔
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

- AVG() - 返回平均值
- FIRST() - 返回第一个记录的值
- LAST() - 返回最后一个记录的值
- MAX() - 返回最大值
- MIN() - 返回最小值
- SUM() - 返回总和
