---
date: 2022-10-16T10:31:01+08:00  # 创建日期
author: "Rustle Karl"  # 作者

title: "数据库操作"  # 文章标题
url:  "posts/mysql/docs/grammar/database"  # 设置网页永久链接
tags: [ "mysql", "database" ]  # 标签
categories: [ "MySQL 学习笔记" ]  # 分类

toc: true  # 目录
draft: true  # 草稿
---

## 创建数据库

```sql
CREATE DATABASE IF NOT EXISTS base;
```

## 切换当前数据库

```sql
USE base;
```

## 删除数据库

```sql
DROP DATABASE IF EXISTS base;
```

## 查看数据库的版本、当前登录用户和当前的数据库名称

```sql
select version(), @@version, user(), database();
```

```shell
mysql -V
```

```sql

```
