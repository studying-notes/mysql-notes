---
date: 2020-10-12 10:41:51+08:00  # 创建日期
author: "Rustle Karl"  # 作者

title: "增删查改"  # 文章标题
url:  "posts/mysql/docs/grammar/crud"  # 设置网页永久链接
tags: [ "mysql", "crud" ]  # 标签
categories: [ "MySQL 学习笔记" ]  # 分类

toc: true  # 目录
draft: true  # 草稿
---

## 插入

```sql
-- 一条
insert into test(id, name)
values (1, 'newlhr');

select * from test;

-- 多条
insert into test(id, name)
values (2, 'hello'),
       (3, 'world');
```

## 查询

```sql
select *
from test
where name = 'newlhr';

select *
from test
where id > 1;
```

## 修改

```sql
update test
set name='oldhr'
where id = 1;
```

## 不存在则插入，存在则更新

MySQL 有 REPLACE INTO 实现记录已存在就更新的操作。

MySQL 的 REPLACE INTO 有3种形式：

1. REPLACE INTO TBL_NAME(COL_NAME) VALUES(/)
2. REPLACE INTO TBL_NAME(COL_NAME) SELECT/
3. REPLACE INTO TBL_NAME SET COL_NAME=VALUE/

其中，“INTO” 关键字可以省略，不过最好加上 “INTO”，这样意思更加直观。另外，对于那些没有给予值的列，MySQL 将自动为这些列赋上默认值。

```sql

```
