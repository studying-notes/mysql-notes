---
date: 2020-10-24 09:09:08+08:00  # 创建日期
author: "Rustle Karl"  # 作者

title: "MySQL 变量定义和变量赋值"  # 文章标题
url:  "posts/mysql/docs/grammar/vars"  # 设置网页永久链接
tags: [ "mysql", "vars" ]  # 标签
categories: [ "MySQL 学习笔记" ]  # 分类

toc: true  # 目录
draft: true  # 草稿
---

## 定义变量与赋值

MySQL 存储过程中，定义变量有两种方式：

1. 用 set 或 select 直接赋值，变量名以 @ 开头

```sql
set @var=1;
```

```sql
set @y = (select value from Variables where name='y');
```

可以在一个会话的任何地方声明，作用域是**整个会话**，称为用户变量。

2. 以 declare 关键字声明的变量，只能在**存储过程中**使用，称为存储过程变量，例如： 

```sql
declare var1 int default 0;
```

主要用在存储过程中，或者是给存储传参数中。

两者的区别是：在调用存储过程时，以 declare 声明的变量都会被初始化为 null。而会话变量（即 @ 开头的变量）则不会被再初始化，在一个会话内，只须初始化一次，之后在会话内都是对上一次计算的结果，就相当于在是这个会话内的全局变量。

### 修改变量值

```sql
set @cnt = 0;
set @gp = 1;
select min(log_id) start_id, max(log_id) end_id
from (select log_id, if(log_id != @cnt, @gp := @gp + 1, @gp) gp, @cnt := log_id + 1
      from Logs
      order by log_id) L
group by gp;
```

MySQL 中的变量分为：局部变量 、用户变量、会话变量和全局变量，会话变量和全局变量叫系统变量。

## 局部变量

只在当前 begin / end 代码块中有效。

局部变量一般用在 sql 语句块中，比如存储过程的 begin / end。其作用域仅限于该语句块，在该语句块执行完毕后，局部变量就消失了。declare 语句专门用于定义局部变量，可以使用 default 来说明默认值。set 语句是设置不同类型的变量，包括会话变量和全局变量。

局部变量定义语法形式：

```sql
declare var_name [, var_name]... data_type [ DEFAULT value ];
```

例如在begin/end语句块中添加如下一段语句，接受函数传进来的a/b变量然后相加，通过set语句赋值给c变量。 

set语句语法形式set var_name=expr [, var_name=expr]...; set语句既可以用于局部变量的赋值，也可以用于用户变量的申明并赋值。

```sql

```

```sql

```


## 用户变量

```sql

```

```sql

```

```sql

```



## 会话变量和全局变量

```sql

```

```sql

```

```sql

```




