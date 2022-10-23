---
date: 2022-10-16T10:42:11+08:00  # 创建日期
author: "Rustle Karl"  # 作者

title: "常用日期和时间函数"  # 文章标题
url:  "posts/mysql/docs/grammar/func_datetime"  # 设置网页永久链接
tags: [ "mysql", "datetime" ]  # 标签
categories: [ "MySQL 学习笔记" ]  # 分类

toc: true  # 目录
draft: true  # 草稿
---

## 当天的星期索引

星期日索引为 1。

```sql
select dayofweek('2020-1-2');
```

## 当天是一年中的第几天

```sql
select dayofyear('2020-2-3');
```

## 时间的小时值/分钟值/秒值

```sql
select hour('10:04:23'), minute('10:04:23'), second('10:04:23');
```

## 格式化时间

```sql
select date_format('2019-03-23', '%W %M %Y');

select date_format('2019-03-23', '%d %m %y');
```

## 将字符串转换为日期类型

```sql
select str_to_date('04/30/2019', '%m/%d/%Y');
```

## 当前的日期值

以 2020-10-23 格式返回当前的日期值。

```sql
select curdate(), current_date;
```

## 当前时间值

以 20:23:34 格式返回当前时间值。

```sql
select curtime(), current_time;
```

## 当前日期时间

以 2020-12-12 12:12:12 格式返回当前日期时间。

```sql
select now(), sysdate(), current_timestamp;
```

## 秒转换时分秒

```sql
select sec_to_time(2378);
```

## 时分秒转换秒

时分秒转换秒。

```sql
select time_to_sec('12:23:12');
```

## 提取日期或日期/时间表达式的日期部分

DATE()

## 向日期添加指定的时间间隔

DATE_ADD()

## 从日期减去指定的时间间隔

```sql
select DATE_SUB('2019-07-5', INTERVAL 1 DAY);
```

### 两个日期之间的天数

```sql
select datediff('2020-11-1', '2020-7-13') as days;
```

```
111
```

### 两个日期之间差的时间

```sql
SELECT TIMEDIFF('1997-12-31 23:59:59.000001',
                '1997-12-30 01:01:01.000002');
```

```
22:58:57
```

忽略了日期部分。

##  FROM_UNIXTIME 和 UNIX_TIMESTAMP 的作用

函数 FROM_UNIXTIME 将 MySQL 中用 **10 位数字存储的时间以日期格式来显示**。

语法：FROM_UNIXTIME(unix_timestamp,format)

函数 UNIX_TIMESTAMP 返回**指定时间的 UNIX 格式数字串**，即 UNIX 时间戳（从 UTC 时间 '1970-01 -01 00:00:00' 开始的秒数），通常为十位，如 1344887103。

语法：UNIX_TIMESTAMP( date )

参数：date 可能是个 DATE 字符串，DATETIME 字符串，TIMESTAPE 字符串，或者是一个类似于 YYMMDD 或者 YYYYMMDD 的数字串。

返回：从 UTC 时间 '1970-01 -01 00:00:00' 开始到该参数之间的秒数。服务器将参数 date 转化成 UTC 格式的内部时间。客户端则可以自行设置当前时区。当 UNIX_TIMESTAMP() 用于 1 个 TIMESTAMP 列时，函数直接返回内部时间戳的值；如果传递 1 个超出范围的时间到 UNIX_TIMESTAMP()，它的返回值是零。如果 date 为空，那么将返回从 UTC 时间 ' 1970-01 -01 00:00:00' 开始到当前时间的秒数。

## DATETIME 和 TIMESTAMP 的区别

存储精度都为秒。

- DATETIME 的日期范围是 1001-9999 年；TIMESTAMP 的时间范围是 1970-2038 年
- DATETIME 存储时间与时区无关；TIMESTAMP 存储时间与时区有关，显示的值也依赖于时区
- DATETIME 的存储空间为 8 字节；TIMESTAMP 的存储空间为 4 字节
- DATETIME 的默认值为 null；TIMESTAMP 的字段默认不为空(not null)，默认值为当前时间(CURRENT_TIMESTAMP)

```sql

```
