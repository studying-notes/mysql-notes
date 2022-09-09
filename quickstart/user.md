---
date: 2020-10-14 20:59:36+08:00  # 创建日期
author: "Rustle Karl"  # 作者

title: "MySQL 用户管理"  # 文章标题
url:  "posts/mysql/quickstart/user"  # 设置网页永久链接
tags: [ "mysql", "user" ]  # 标签
categories: [ "MySQL 学习笔记" ]  # 分类

toc: true  # 目录
draft: true  # 草稿
---

## 创建用户

```sql
CREATE USER 'sansa_stark';
CREATE USER 'sansa_stark'@'localhost';
```

```sql
SHOW GRANTS FOR 'sansa_stark';

GRANT ALL ON rookery.*
TO 'sansa_stark'@'%';
```

```sql
SELECT User, Host
FROM mysql.user;

SELECT User, Host
FROM mysql.user
WHERE User LIKE 'sansa_stark';

DROP USER 'sansa_stark'@'localhost';
DROP USER 'sansa_stark'@'%';

######################################################################################
```

```sql
CREATE USER 'sansa_stark'@'localhost'
  IDENTIFIED BY 'her_password_123';

GRANT USAGE ON *.* TO 'sansa_stark'@'sansa_stark_home'
IDENTIFIED BY 'her_password_123';

SHOW GRANTS FOR 'sansa_stark'@'localhost';

SELECT PASSWORD('her_password_123') AS 'Password';

######################################################################################
```

```sql
GRANT SELECT, INSERT, UPDATE ON rookery.*
TO 'sansa_stark'@'localhost';

GRANT SELECT, INSERT, UPDATE ON birdwatchers.*
TO 'sansa_stark'@'localhost';

SHOW GRANTS FOR 'sansa_stark'@'localhost';

GRANT DELETE ON rookery.*
TO 'sansa_stark'@'localhost';

GRANT DELETE ON birdwatchers.*
TO 'sansa_stark'@'localhost';

GRANT USAGE ON rookery.*
TO 'sansa_stark'@'sansa_stark_home'
IDENTIFIED BY 'her_password_123';

SHOW GRANTS FOR 'sansa_stark'@'sansa_stark_home';

DROP USER 'sansa_stark'@'sansa_stark_home';

######################################################################################
```

```sql
CREATE ROLE 'admin_import_role';

DROP ROLE 'admin_import_role';

GRANT FILE ON *.*
TO 'admin_import_role';
```
