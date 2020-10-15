---
date: 2020-10-15T17:45:06+08:00  # 创建日期
author: "Rustle Karl"  # 作者

# 文章
title: "SQLite 执行 SQL 脚本文件"  # 文章标题
# description: "文章描述"
url:  "posts/mysql/exec/sqlite"  # 设置网页永久链接
tags: [ "sqlite", "sql"]  # 标签
series: [ "MySQL 学习笔记"]  # 系列
categories: [ "学习笔记"]  # 分类

# 章节
weight: 20 # 排序优先级
chapter: false  # 设置为章节

index: true  # 是否可以被索引
toc: false  # 是否自动生成目录
draft: false  # 草稿
---

## Powershell

```shell
Get-Content script.sql -Raw | sqlite3 script.db
```

## Linux Shell

```shell
sqlite3 script.db < script.sql
```
