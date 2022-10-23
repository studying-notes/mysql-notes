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

### in 和 exists 的区别

exists 查询先执行主查询，获得数据后，再放到子查询中做条件验证，根据验证结果（true 或者 false），来决定主查询的数据结果是否得意保留。

因此，我们要选择最外层循环小的，也就是，如果 B 的数据量小于 A，适合使用 in，如果 B 的数据量大于 A，即适合选择 exists，这就是 in 和 exists 的区别。

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

## 并发安全地修改同一行数据

要安全的修改同一行数据，就要保证一个线程在修改时其它线程无法更新这行记录。一般有悲观锁和乐观锁两种方案。
~

### 悲观锁

```sql
select * from user where id=2 for update
```

select 查询语句是不会加锁的，但是 select for update 除了有查询的作用外，还会加悲观锁。没用索引/主键的话就是表锁，否则就是行锁。

```sql

```
