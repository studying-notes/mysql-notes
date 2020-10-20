---
date: 2020-10-20T15:42:08+08:00  # 创建日期
author: "Rustle Karl"  # 作者

# 文章
title: "MySQL 数值函数详解"  # 文章标题
url:  "posts/mysql/docs/numerical"  # 设置网页永久链接
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

## 格式化小数

### format

```sql
select format(3.14159, 3);
select format(3.14, 3);
```

### truncate

```sql
select truncate(3.14159, 3);
```

### convert

```sql
select convert(3.14159, decimal(10, 3));
```

### round

```sql
select round(3.14159, 3);
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
- MOD() - 取余数



