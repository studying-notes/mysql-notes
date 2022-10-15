---
date: 2022-10-14T15:21:30+08:00  # 创建日期
author: "Rustle Karl"  # 作者

title: "安装 MySQL 数据库"  # 文章标题
url:  "posts/mysql/quickstart/install"  # 设置网页永久链接
tags: [ "mysql", "install" ]  # 标签
categories: [ "MySQL 学习笔记" ]  # 分类

toc: true  # 目录
draft: true  # 草稿
---

## Docker 方式

```bash
docker run -d --restart always --name mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=password mysql
```

## 测试

```shell
apt install -y mysql-client-core-8.0
```

```shell
mysql -h127.0.0.1 -P3306 -uroot -p
```

```shell
CREATE DATABASE universe;
```

`src\install\universe.sql`
