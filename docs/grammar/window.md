---
date: 2020-10-21 09:52:19+08:00  # 创建日期
author: "Rustle Karl"  # 作者

title: "MySQL 窗口函数"  # 文章标题
url:  "posts/mysql/docs/grammar/window"  # 设置网页永久链接
tags: [ "mysql", "window" ]  # 标签
categories: [ "MySQL 学习笔记" ]  # 分类

toc: true  # 目录
draft: true  # 草稿
---

## 窗口函数简介

MySQL 8.0+ 版本支持窗口函数，该类函数也称为分析函数，对于初学者来说，窗口函数特别容易与分组聚合函数混合。两者的不同之处在于，窗口函数使每一行数据都生成一个结果。

### 应用场景

- 周环比如何计算？
- 如何把数据分成 N 组？
- 如何计算某个用户或某个店铺在某段时间内产生的最大/小的订单金额？
- 如何计算各产品的累计售出占比？

### 窗口函数分类

- 排序函数：row_number() / rank() / dense_rank() 对分析对象进行排序
- 分布函数：percent_rank() / cume_dist() 对分析对象记录进行比较，类似于统计学中的中位数或四分位数
- 前后函数：lag() / lead() 对分析对象自身前面/后面一定顺序的数据进行分析
- 头尾函数：first_val() / last_val() 分析对象第一/最后值进行分析
- 其他函数：nth_value() / nfile() 用于给分析对象进行分段

### 基本语法

```
函数名（[expr]）over 子句
```

## 前后函数

### LAG() / LEAD()

```sql
LAG(<expression>[,offset[, default_value]]) OVER (
    PARTITION BY expr,...
    ORDER BY expr [ASC|DESC],...
) 
```

### expression

`LAG()` 函数返回 `expression` 当前行之前的行的值，其值为 `offset` 其分区或结果集中的行数。

### offset

`offset` 是从当前行返回的行数，以获取值。`offset` 必须是零或文字正整数。如果 `offset` 为零，则 `LAG()` 函数计算 `expression` 当前行的值。如果未指定 `offset`，则 `LAG()` 默认情况下函数使用一个。

### default_value

如果没有前一行，则 `LAG()` 函数返回 `default_value`。例如，如果 offset 为 2，则第一行的返回值为 `default_value`。如果省略 `default_value`，则默认 `LAG()` 返回函数 `NULL`。

### `PARTITION BY` 子句

`PARTITION BY` 子句将结果集中的行划分 `LAG()` 为应用函数的分区。如果省略 `PARTITION BY` 子句，`LAG()` 函数会将整个结果集视为单个分区。

### `ORDER BY` 子句

`ORDER BY` 子句指定在 `LAG()` 应用函数之前每个分区中的行的顺序。

`LAG()` 函数可用于计算当前行和上一行之间的差异。

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

```sql

```
