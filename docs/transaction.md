---
date: 2021-01-21T15:54:33+08:00  # 创建日期
author: "Rustle Karl"  # 作者

# 文章
title: "MySQL 事务 Transaction"  # 文章标题
url:  "posts/mysql/doc/transaction"  # 设置网页永久链接
tags: [ "mysql", "sql", "数据库理论" ]  # 标签
series: [ "MySQL 学习笔记"]  # 系列
categories: [ "学习笔记"]  # 分类

# 章节
weight: 20 # 排序优先级
chapter: false  # 设置为章节

index: true  # 是否可以被索引
toc: true  # 是否自动生成目录
draft: false  # 草稿
---

MySQL 默认开启**事务自动提交模式**，即除非显式的开启事务（BEGIN 或 START TRANSACTION），否则每条 SOL 语句都会被当做一**个单独的事务自动执行**。但

有些情况下，我们需要关闭事务自动提交来保证数据的一致性。

在 MySQL 中，可以通过  SHOW VARIABLES 语句查看当前事务自动提交模式，如下所示：

```
mysql> SHOW VARIABLES LIKE 'autocommit';
+---------------+-------+
| Variable_name | Value |
+---------------+-------+
| autocommit    | ON    |
+---------------+-------+
1 row in set, 1 warning (0.04 sec)
```

结果显示，autocommit 的值是 ON，表示系统开启自动提交模式。

在 MySQL 中，可以使用 SET autocommit 语句设置事务的自动提交模式，语法格式如下：

```mysql
SET autocommit = 0|1|ON|OFF;
```

对取值的说明：

- 值为 0 和值为 OFF：关闭事务自动提交。如果关闭自动提交，用户将会一直处于某个事务中，只有提交或回滚后才会结束当前事务，重新开始一个新事务。
- 值为 1 和值为 ON：开启事务自动提交。如果开启自动提交，则每执行一条 SQL 语句，事务都会提交一次。

## 示例

下面我们关闭事务自动提交，模拟银行转账。

使用 SET autocommit 语句关闭事务自动提交，且张三转给李四 500 元，SQL 语句和运行结果如下：

```
mysql> SET autocommit = 0;                                                      ;
Query OK, 0 rows affected (0.00 sec)
mysql> SELECT * FROM mybank.bank;
+--------------+--------------+
| customerName | currentMoney |
+--------------+--------------+
| 张三         |      1000.00 |
| 李四         |         1.00 |
+--------------+--------------+
2 rows in set (0.00 sec)
mysql> UPDATE bank SET currentMoney = currentMoney-500 WHERE customerName='张三' ;
Query OK, 1 row affected (0.02 sec)
Rows matched: 1  Changed: 1  Warnings: 0
mysql> UPDATE bank SET currentMoney = currentMoney+500 WHERE customerName='李四';
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0
```

这时重新打开一个 cmd 窗口，查看 bank 数据表中张三和李四的余额，SQL 语句和运行结果如下所示：

```
mysql> SELECT * FROM mybank.bank;
+--------------+--------------+
| customerName | currentMoney |
+--------------+--------------+
| 张三         |      1000.00 |
| 李四         |         1.00 |
+--------------+--------------+
2 rows in set (0.00 sec)
```

结果显示，张三和李四的余额是事务执行前的数据。

下面在之前的窗口中使用 COMMIT 语句提交事务，并查询 bank 数据表的数据，如下所示：

```
mysql> COMMIT;
Query OK, 0 rows affected (0.07 sec)
mysql> SELECT * FROM mybank.bank;
+--------------+--------------+
| customerName | currentMoney |
+--------------+--------------+
| 张三         |       500.00 |
| 李四         |       501.00 |
+--------------+--------------+
2 rows in set (0.00 sec)
```

结果显示，bank 数据表的数据更新成功。

在本例中，关闭自动提交后，该位置会作为一个事务起点，直到执行 COMMIT 语句和 ROLLBACK 语句后，该事务才结束。结束之后，这就是下一个事务的起点。

关闭自动提交功能后，只用当执行 COMMIT 命令后，MySQL 才将数据表中的资料提交到数据库中。如果执行 ROLLBACK 命令，数据将会被回滚。如果不提交事务，而终止 MySQL 会话，数据库将会自动执行回滚操作。

使用 BEGIN 或 START TRANSACTION 开启一个事务之后，自动提交将保持禁用状态，直到使用 COMMIT 或 ROLLBACK 结束事务。之后，自动提交模式会恢复到之前的状态，即如果 BEGIN 前 autocommit = 1，则完成本次事务后 autocommit 还是 1。如果 BEGIN 前 autocommit = 0，则完成本次事务后 autocommit 还是 0。
