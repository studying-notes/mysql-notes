---
date: 2022-10-17T16:45:57+08:00  # 创建日期
author: "Rustle Karl"  # 作者

title: "如何选择合适的分布式主键方案"  # 文章标题
url:  "posts/mysql/docs/deployment/distributed_primary_key"  # 设置网页永久链接
tags: [ "mysql", "distributed-id" ]  # 标签
categories: [ "MySQL 学习笔记" ]  # 分类

toc: true  # 目录
draft: true  # 草稿
---

## 常见的分布式主键方案

- 数据库自增长序列或字段
- UUID
- Redis 生成 ID
- Twitter 的 snowflake 算法
- 利用 zookeeper 生成唯 -ID
- MongoDB 的 ObjectId

## 数据库自增长序列或字段

简单，易于实现。如果需要作为分布式系统的 ID，必须采用不同起始值，相同步长方式自增，否则会产生冲突，但是 ID 可能用完。

## UUID

UUID 是一种通用唯一识别码，由 32 个 16 进制数字组成，通常由 5 段数字和 4 段字母组成，如：`3d3c68e0-8d5a-11e8-9eb6-529269fb1459`。UUID 的优点是全球范围内唯一，缺点是生成的 ID 长度较长，且不是数字，不利于排序。

## Redis 生成 ID

Redis 的 INCR 命令可以实现自增，但是需要保证 Redis 的高可用，否则会出现 ID 重复的情况。

## Twitter 的 snowflake 算法

Twitter 的 snowflake 算法是 Twitter 开源的分布式 ID 生成算法，结果是一个 long 型（64位）的 ID，其结构如下（每部分用 - 分开）：

- 1 位不用
- 41 位时间戳（毫秒级）
- 10 位的机器标识
- 12 位序列号

默认情况下 41 bit 的时间戳可以支持该算法使用到 2082 年，10 bit 的工作机器 id 可以支持 1024 台机器，序列号支持 1 毫秒产生 4096 个自增序列 id。SnowFlake 的优点是，整体上按照时间自增排序，并且整个分布式系统内不会产生 ID 碰撞(由数据中心 ID 和机器 ID 作区分)，并且效率较高，经测试，SnowFlake 每秒能够产生 26 万 ID 左右。

依赖服务器时间，如果服务器时间回拨，会导致生成的 id 重复或者服务会处于不可用状态。

## 利用 zookeeper 生成唯 ID

利用 zookeeper 的临时顺序节点，每次生成一个唯一的 ID，但是需要保证 zookeeper 的高可用，否则会出现 ID 重复的情况。

## MongoDB 的 ObjectId

MongoDB 的 ObjectId 是一个 12 字节的 BSON 类型，结构如下（每部分用 - 分开）：

- 4 个字节的当前时间戳
- 3 个字节的机器标识
- 2 个字节的进程 ID
- 3 个字节的计数器

```sql

```
