---
date: 2022-10-18T15:58:32+08:00  # 创建日期
author: "Rustle Karl"  # 作者

title: "触发器"  # 文章标题
url:  "posts/mysql/docs/grammar/trigger"  # 设置网页永久链接
tags: [ "mysql", "trigger" ]  # 标签
categories: [ "MySQL 学习笔记" ]  # 分类

toc: true  # 目录
draft: true  # 草稿
---

## 简介

触发器，指一段代码，当触发某个事件时，自动执行这些代码。

## 使用场景

- 可以通过数据库中的相关表实现级联更改。
- 实时监控某张表中的某个字段的更改而需要做出相应的处理。

## 触发器种类

MySQL 数据库中有六种触发器：

- Before Insert
- After Insert
- Before Update
- After Update
- Before Delete
- After Delete

```sql

```
