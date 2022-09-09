---
date: 2020-10-15 18:23:12+08:00  # 创建日期
author: "Rustle Karl"  # 作者

title: "MySQL 修改表的属性、增加行列等"  # 文章标题
url:  "posts/mysql/docs/grammar/alter"  # 设置网页永久链接
tags: [ "mysql", "alter" ]  # 标签
categories: [ "MySQL 学习笔记" ]  # 分类

toc: true  # 目录
draft: true  # 草稿
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

## 修改行的字符集

```sql
ALTER TABLE status
    MODIFY COLUMN serial_number varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
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

