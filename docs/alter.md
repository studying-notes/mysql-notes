---
date: 2020-10-15T18:23:12+08:00  # 创建日期
author: "Rustle Karl"  # 作者

# 文章
title: "MySQL 修改表的属性、增加行列等"  # 文章标题
# description: "文章描述"
url:  "posts/mysql/docs/alter"  # 设置网页永久链接
tags: [ "mysql", "alter"]  # 标签
series: [ "MySQL 学习笔记"]  # 系列
categories: [ "学习笔记"]  # 分类

# 章节
weight: 20 # 排序优先级
chapter: false  # 设置为章节

index: true  # 是否可以被索引
toc: true  # 是否自动生成目录
draft: false  # 草稿
---

## 增加行

```sql
alter table tableName add column newColumn int;
```

## 创建一个相同结构的表

```sql
create table tableNew like tableOld;
```

## 修改行

```sql
ALTER TABLE tableName CHANGE COLUMN column newColumn int;
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

