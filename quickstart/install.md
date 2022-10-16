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

## 通过 Docker 启动 MySQL

```shell
docker pull mysql:latest
```

```bash
docker run -d --restart always --name mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=password mysql
```

- `-p 3306:3306` ：映射容器服务的 3306 端口到宿主机的 3306 端口，外部主机可以直接通过宿主机 `ip:3306` 访问到 MySQL 的服务
- `MYSQL_ROOT_PASSWORD=password`：设置 MySQL 服务 root 用户的密码

## Linux 下启动 MySQL 服务

```shell
service mysql status
```

```shell
service mysql start
```

## 在 Windows 下启动 MySQL 服务

```shell
net start mysql
```

```shell
net start mariadb
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
