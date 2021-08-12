---
date: 2020-10-12T10:41:51+08:00  # 创建日期
author: "Rustle Karl"  # 作者

# 文章
title: "MySQL 数据库介绍"  # 文章标题
url:  "posts/mysql/docs/intro"  # 设置网页永久链接
tags: [ "mysql", "intro"]  # 标签
series: [ "MySQL 学习笔记"]  # 系列
categories: [ "学习笔记"]  # 分类

# 章节
weight: 20 # 排序优先级
chapter: false  # 设置为章节

index: true  # 是否可以被索引
toc: true  # 是否自动生成目录
draft: false  # 草稿
---

## 简介

MySQL 是一个小型的关系型数据库，开发者为瑞典 MySQL AB 公司，现在已经被 Oracle 收购，它支持 FreeBSD、Linux、MAC、Windows 等多种操作系统。MySQL 数据库可支持要求最苛刻的 Web、电子商务和联机事务处理（ OLTP ）应用程序。它是一个全面集成、事务安全、符合 ACID 的数据库，具备全面的提交、回滚、崩溃恢复和行级锁定功能。MySQL 凭借其易用性、扩展力和性能，成为全球最受欢迎的开源数据库。全球许多流量最大的网站都依托于 MySQL 来支持其业务关键的应用程序，其中，包括 Facebook、Google、Ticketmaster 和 eBay。MySQL 5.6 显著提高了性能和可用性，可支持下一代 Web、嵌入式和云计算应用程序。

MySQL 被设计为一个单进程多线程架构的数据库（通过` ps-Lf mysqld 进程号` 或 `pstack mysqld 进程号` 可以查看多线程结构），这点与 SQL Server 类似，但与 Oracle 多进程的架构有所不同（ Oracle 的 Windows 版本也属于单进程多线程架构）。这也就是说，MySQL 数据库实例在系统上的表现就是一个进程。

## MySQL 的优点

- 可以处理拥有上千万条记录的大型数据。
- 支持常见的 SQL 语句规范。
- 可移植性高，安装简单小巧。
- 良好的运行效率，有丰富信息的网络支持。
- 调试、管理，优化简单（相对其他大型数据库）。
- 复制全局事务标识可支持自我修复式集群。
- 复制无崩溃从机可提高可用性。
- 复制多线程从机可提高性能。
- 对 InnoDB 进行 NoSQL 访问，可快速完成键值操作以及快速提取数据来完成大数据部署。
- 在 Linux 上的性能提升高达 230%。
- 在当今的多核、多 CPU 硬件上具备更高的扩展力。
- InnoDB 性能改进，可更加高效地处理事务和只读负载。
- 更快速地执行查询命令，具备增强的诊断功能。
- Performance Schema 可监视各个用户和应用程序的资源占用情况。
- 通过基于策略的密码管理和实施来确保安全性。
- 复制功能支持灵活的拓扑架构，可实现向外扩展和高可用性。
- 分区有助于提高性能和管理超大型数据库环境。
- ACID 事务支持构建安全可靠的关键业务应用程序。
- Information Schema 有助于方便地访问元数据。
- 插入式存储引擎架构可最大限度发挥灵活性。

## 在 Linux 下安装 MySQL 的方式

![02aFSJ.png](https://s1.ax1x.com/2020/10/12/02aFSJ.png)

## 通过 Docker 启动 MySQL

```shell
docker pull mysql:latest
```

```shell
docker run --restart=always -itd --name mysql-test -p 3306:3306 -e MYSQL_ROOT_PASSWORD=123456 mysql
```

- `-p 3306:3306` ：映射容器服务的 3306 端口到宿主机的 3306 端口，外部主机可以直接通过宿主机 `ip:3306` 访问到 MySQL 的服务
- `MYSQL_ROOT_PASSWORD=123456`：设置 MySQL 服务 root 用户的密码

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

## 基本操作

### 连接到 MySQL 数据库

```shell
mysql -p
```

```shell
mysql -uroot -p
```

```shell
mysql -uroot -proot
```

### 查看所有数据库

```sql
show databases;
```

### 切换到某个特定的数据库

```sql
use database_name;
```

```sql
use sql_test;
```

### 列出数据库内所有的表

```sql
show tables;
```

### 在 MySQL 里执行 OS 命令

可以通过 system 或 “\!” 来执行。
