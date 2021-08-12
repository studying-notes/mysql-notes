---
date: 2020-10-19T11:06:44+08:00  # 创建日期
author: "Rustle Karl"  # 作者

# 文章
title: "MySQL 窗口函数之 RANK 函数"  # 文章标题
description: "MySQL 8.0+ 版本支持窗口函数，该类函数也称为分析函数，对于初学者来说，窗口函数特别容易与分组聚合函数混合。两者的不同之处在于，窗口函数使每一行数据都生成一个结果。"
url:  "posts/mysql/docs/rank"  # 设置网页永久链接
tags: [ "MySQL", "MySQL 窗口函数"]  # 标签
series: [ "MySQL 学习笔记"]  # 系列
categories: [ "学习笔记"]  # 分类

# 章节
weight: 20 # 排序优先级
chapter: false  # 设置为章节

index: true  # 是否可以被索引
toc: true  # 是否自动生成目录
draft: false  # 草稿
---

## 排序函数

排序函数，顾名思义就是对数据对象进行排序。

### 应用场景

- 用于分析对象记录排序
- 用于对表中不同对象分别排序
- 用于排序之后，取特定需求的数据

### 排序函数分类及基础语法

```sql
rank() over (partition by 分区字段 order by 排序字段 desc/asc);
dense_rank() over (partition by 分区字段 order by 排序字段 desc/asc);
row_number() over (partition by 分区字段 order by 排序字段 desc/asc);
```

### 三种排序函数的差异点

- rank() 函数，当指定字段数值相同，则会产生相同序号记录，且**产生序号间隙**
- dense_rank() 函数，当指定字段数值相同，则会产生相同序号记录，且**不会产生序号间隙**
- row_number() 函数，不区分是否记录相同，**产生自然序列**

### 实例比较三种排序函数

https://leetcode-cn.com/problems/rank-scores/

```sql
select Score, rank() over (order by Score desc)  as `Rank` from Scores;
```

![0vsfYj.png](https://s1.ax1x.com/2020/10/19/0vsfYj.png)

```sql
select Score, dense_rank() over (order by Score desc)  as `Rank` from Scores;
```

![0vshfs.png](https://s1.ax1x.com/2020/10/19/0vshfs.png)

```sql
select Score, row_number() over (order by Score desc)  as `Rank` from Scores;
```

![0vs5pn.png](https://s1.ax1x.com/2020/10/19/0vs5pn.png)

## 排序函数小结

- 函数、over() 是必须存在的，且 over() 括号里面的内容是可选的
- over() 用来指定函数执行窗口范围，如果后面括号内无任何内容，则指窗口范围是满足 where 条件所有行
- partition by，指定按照某字段进行分组，窗口函数是在不同的分组分别执行
- order by，指定按照某字段进行排序
