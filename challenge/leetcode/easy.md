---
date: 2020-10-20T23:44:24+08:00  # 创建日期
author: "Rustle Karl"  # 作者

# 文章
title: "LeetCode 数据库解题（简单级别）"  # 文章标题
url:  "posts/mysql/challenge/leetcode/easy"  # 设置网页永久链接
tags: [ "mysql", "leetcode", "sql"]  # 标签
series: [ "LeetCode 解题笔记", "MySQL 学习笔记" ]  # 系列
categories: [ "解题笔记"]  # 分类

# 章节
weight: 20 # 排序优先级
chapter: false  # 设置为章节

index: true  # 是否可以被索引
toc: true  # 是否自动生成目录
draft: false  # 草稿
---

## 找出合作多次的演员和导演

```sql
select actor_id, director_id
from ActorDirector
group by actor_id, director_id
having count(*) >= 3;
```

## 题目

```sql

```

## 题目

```sql

```

## 题目

```sql

```

## 题目

```sql

```

## 题目

```sql

```

## 题目

```sql

```

## 题目

```sql

```

## 题目

```sql

```

## 题目

```sql

```

## 题目

```sql

```
