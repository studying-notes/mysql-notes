---
date: 2020-10-15 21:49:26+08:00  # 创建日期
author: "Rustle Karl"  # 作者

title: "LeetCode 数据库解题（免费部分）"  # 文章标题
url:  "posts/mysql/interview/leetcode/free"  # 设置网页永久链接
tags: [ "mysql", "leetcode" ]  # 标签
categories: [ "Mysql 学习笔记" ]  # 分类

toc: true  # 目录
draft: true  # 草稿
---

- [组合两个表](#组合两个表)
- [第二高的薪水](#第二高的薪水)
  - [错误](#错误)
  - [LIMIT](#limit)
  - [正确方法一](#正确方法一)
  - [正确方法二](#正确方法二)
- [第 N 高的薪水](#第-n-高的薪水)
- [分数排名](#分数排名)
- [连续出现的数字](#连续出现的数字)
- [超过经理收入的员工](#超过经理收入的员工)
- [查找重复的电子邮箱](#查找重复的电子邮箱)
- [从不订购的客户](#从不订购的客户)
- [部门工资最高的员工](#部门工资最高的员工)
- [部门工资前三高的所有员工](#部门工资前三高的所有员工)
- [删除重复的电子邮箱](#删除重复的电子邮箱)
- [上升的温度](#上升的温度)
- [行程和用户](#行程和用户)
- [超过 5 名学生的课](#超过-5-名学生的课)
- [体育馆的人流量](#体育馆的人流量)
- [换座位](#换座位)
- [行转列](#行转列)

## 组合两个表

https://leetcode-cn.com/problems/combine-two-tables/

```sql
select Person.FirstName, Person.LastName, Address.City, Address.State
from Person
         LEFT JOIN Address
                 ON Person.PersonId = Address.PersonId;
```

## 第二高的薪水

https://leetcode-cn.com/problems/second-highest-salary/

### 错误

```sql
SELECT DISTINCT
    Salary AS SecondHighestSalary
FROM
    Employee
ORDER BY Salary DESC
LIMIT 1 OFFSET 1
```

### LIMIT

```sql
LIMIT n, m
```

> n 是偏移量，m 是返回数量。

### 正确方法一

```sql
SELECT
    (SELECT DISTINCT
            Salary
        FROM
            Employee
        ORDER BY Salary DESC
        LIMIT 1 OFFSET 1) AS SecondHighestSalary;
```

### 正确方法二

```sql
SELECT
    IFNULL(
      (SELECT DISTINCT Salary
       FROM Employee
       ORDER BY Salary DESC
        LIMIT 1 OFFSET 1),
    NULL) AS SecondHighestSalary;
```

## 第 N 高的薪水

https://leetcode-cn.com/problems/nth-highest-salary/

```sql
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  SET n = N-1;
  RETURN (     
  SELECT DISTINCT Salary FROM Employee ORDER BY Salary DESC LIMIT n,1
  );
END
```

## 分数排名

https://leetcode-cn.com/problems/rank-scores/

```sql
select a.Score as Score, (select count(distinct b.Score) from Scores b where b.Score >= a.Score) as 'Rank' from Scores a order by a.Score DESC;
```

```sql
select Score, dense_rank() over (order by Score desc)  as `Rank`
from Scores;
```

## 连续出现的数字

https://leetcode-cn.com/problems/consecutive-numbers/

```sql
SELECT DISTINCT
    l1.Num AS ConsecutiveNums
FROM
    Logs l1,
    Logs l2,
    Logs l3
WHERE
    l1.Id = l2.Id - 1
    AND l2.Id = l3.Id - 1
    AND l1.Num = l2.Num
    AND l2.Num = l3.Num;
```

## 超过经理收入的员工

https://leetcode-cn.com/problems/employees-earning-more-than-their-managers/

```sql
SELECT
    a.Name AS 'Employee'
FROM
    Employee AS a,
    Employee AS b
WHERE
    a.ManagerId = b.Id
        AND a.Salary > b.Salary;
```

```sql
SELECT
     a.NAME AS Employee
FROM Employee AS a JOIN Employee AS b
     ON a.ManagerId = b.Id
     AND a.Salary > b.Salary;
```

## 查找重复的电子邮箱

https://leetcode-cn.com/problems/duplicate-emails/

```sql
select Email
from (select Email, count(Email) as cnt from Person group by Email) as statistic
where cnt > 1;
```

```sql
SELECT DISTINCT (a.Email) AS Email
FROM Person AS a
         JOIN Person AS b
              ON a.Email = b.Email
                  AND a.Id <> b.Id;
```

```sql
select Email
from Person
group by Email
having count(Email) > 1;
```

## 从不订购的客户

https://leetcode-cn.com/problems/customers-who-never-order/

```sql
select Name as 'Customers'
from Customers
where Id not in (select CustomerId from Orders);
```

## 部门工资最高的员工

https://leetcode-cn.com/problems/department-highest-salary/

```sql
select d.name as 'Department', e.Name as 'Employee', e.salary as Salary
from Department as d,
     Employee as e
where e.DepartmentId = d.id
  and e.salary = (select max(salary) from Employee where DepartmentId = d.id);
```

```sql
SELECT
    Department.name AS 'Department',
    Employee.name AS 'Employee',
    Salary
FROM
    Employee
        JOIN
    Department ON Employee.DepartmentId = Department.Id
WHERE
    (Employee.DepartmentId , Salary) IN
    (   SELECT
            DepartmentId, MAX(Salary)
        FROM
            Employee
        GROUP BY DepartmentId
	);
```

## 部门工资前三高的所有员工

https://leetcode-cn.com/problems/department-top-three-salaries/

公司里前 3 高的薪水意味着有不超过 3 个工资比这些值大

```sql
select e1.Name as 'Employee', e1.Salary
from Employee e1
where 3 >
(
    select count(distinct e2.Salary)
    from Employee e2
    where e2.Salary > e1.Salary
);
```

然后，我们需要把表 Employee 和表 Department 连接来获得部门信息。

```sql
SELECT
    d.Name AS 'Department', e1.Name AS 'Employee', e1.Salary
FROM
    Employee e1
        JOIN
    Department d ON e1.DepartmentId = d.Id
WHERE
    3 > (SELECT
            COUNT(DISTINCT e2.Salary)
        FROM
            Employee e2
        WHERE
            e2.Salary > e1.Salary
                AND e1.DepartmentId = e2.DepartmentId
        );
```

```sql
/**
对 Employee 表进行部门分组工资排名，再关联 Department 表查询部门名称，再使用 WHERE 筛选出排名小于等于 3 的数据（也就是每个部门排名前 3 的工资）。
**/
SELECT 
B.Name AS Department,
A.Name AS Employee,
A.Salary
FROM (SELECT DENSE_RANK() OVER (partition by DepartmentId order by Salary desc) AS ranking,DepartmentId,Name,Salary
      FROM Employee) AS A
JOIN Department AS B ON A.DepartmentId=B.id
WHERE A.ranking<=3
```

## 删除重复的电子邮箱

https://leetcode-cn.com/problems/delete-duplicate-emails/

```sql
delete p1
from Person p1
         inner join Person p2 on p1.Email = p2.Email and p1.Id > p2.Id;
```

## 上升的温度

https://leetcode-cn.com/problems/rising-temperature/

```sql
select today.id as id
from Weather today
         join Weather yesterday
              on today.temperature > yesterday.temperature and today.recordDate = yesterday.recordDate + interval 1 day;
```

## 行程和用户

https://leetcode-cn.com/problems/trips-and-users/

```sql
DROP TABLE Trips;
CREATE TABLE `Trips`
(
    `Id`         int NOT NULL auto_increment,
    `Client_Id`  int NOT NULL,
    `Driver_Id`  int NOT NULL,
    `City_Id`    int NOT NULL,
    `Status`     enum ('completed','cancelled_by_driver','cancelled_by_client') DEFAULT NULL,
    `Request_at` date                                                           DEFAULT NULL,
    PRIMARY KEY (`Id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
INSERT INTO gorm_test.Trips (Id, Client_Id, Driver_Id, City_Id, Status, Request_at)
VALUES (1, 1, 10, 1, 'completed', '2013-10-01');
INSERT INTO gorm_test.Trips (Id, Client_Id, Driver_Id, City_Id, Status, Request_at)
VALUES (2, 2, 11, 1, 'cancelled_by_driver', '2013-10-01');
INSERT INTO gorm_test.Trips (Id, Client_Id, Driver_Id, City_Id, Status, Request_at)
VALUES (3, 3, 12, 6, 'completed', '2013-10-01');
INSERT INTO gorm_test.Trips (Id, Client_Id, Driver_Id, City_Id, Status, Request_at)
VALUES (4, 4, 13, 6, 'cancelled_by_driver', '2013-10-01');
INSERT INTO gorm_test.Trips (Id, Client_Id, Driver_Id, City_Id, Status, Request_at)
VALUES (5, 1, 10, 1, 'completed', '2013-10-02');
INSERT INTO gorm_test.Trips (Id, Client_Id, Driver_Id, City_Id, Status, Request_at)
VALUES (6, 2, 11, 6, 'completed', '2013-10-02');
INSERT INTO gorm_test.Trips (Id, Client_Id, Driver_Id, City_Id, Status, Request_at)
VALUES (7, 3, 12, 6, 'completed', '2013-10-02');
INSERT INTO gorm_test.Trips (Id, Client_Id, Driver_Id, City_Id, Status, Request_at)
VALUES (8, 2, 12, 12, 'completed', '2013-10-03');
INSERT INTO gorm_test.Trips (Id, Client_Id, Driver_Id, City_Id, Status, Request_at)
VALUES (9, 3, 10, 12, 'completed', '2013-10-03');
INSERT INTO gorm_test.Trips (Id, Client_Id, Driver_Id, City_Id, Status, Request_at)
VALUES (10, 4, 13, 12, 'cancelled_by_driver', '2013-10-03');

DROP TABLE Users;
CREATE TABLE `Users`
(
    `Users_Id` int NOT NULL auto_increment,
    `Banned`   enum ('No', 'Yes')                   DEFAULT NULL,
    `Role`     enum ('client', 'driver', 'partner') DEFAULT NULL,
    PRIMARY KEY (`Users_Id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
INSERT INTO gorm_test.Users (Users_Id, Banned, Role)
VALUES (1, 'No', 'client');
INSERT INTO gorm_test.Users (Users_Id, Banned, Role)
VALUES (2, 'Yes', 'client');
INSERT INTO gorm_test.Users (Users_Id, Banned, Role)
VALUES (3, 'No', 'client');
INSERT INTO gorm_test.Users (Users_Id, Banned, Role)
VALUES (4, 'No', 'client');
INSERT INTO gorm_test.Users (Users_Id, Banned, Role)
VALUES (10, 'No', 'driver');
INSERT INTO gorm_test.Users (Users_Id, Banned, Role)
VALUES (11, 'No', 'driver');
INSERT INTO gorm_test.Users (Users_Id, Banned, Role)
VALUES (12, 'No', 'driver');
INSERT INTO gorm_test.Users (Users_Id, Banned, Role)
VALUES (13, 'No', 'driver');
```

```sql
select t1.Day as Day, round(count(t2.Cancel) / count(t1.Status), 2) as `Cancellation Rate`
from (select Trips.Id, Trips.Status as Status, Trips.Request_at as Day
      from Trips
               join Users u1 on Trips.Client_Id = u1.Users_Id
          and u1.Banned = 'No'
               join Users u2 on Trips.Driver_Id = u2.Users_Id
          and u1.Banned = 'No') as t1
         left join
     (select Trips.Id, Trips.Status as Cancel, Trips.Request_at as Day
      from Trips
               join Users u1 on Trips.Client_Id = u1.Users_Id
          and u1.Banned = 'No'
               join Users u2 on Trips.Driver_Id = u2.Users_Id
          and u1.Banned = 'No'
      where Trips.Status != 'completed') as t2
     on t1.Id = t2.Id
where t1.Day between '2013-10-01' and '2013-10-03'
group by Day
order by 1;
```

```sql
SELECT T.request_at                                                      AS `Day`,
       ROUND(SUM(IF(T.STATUS = 'completed', 0, 1)) / COUNT(T.STATUS), 2) AS `Cancellation Rate`
FROM Trips AS T
         JOIN Users AS U1 ON (T.client_id = U1.users_id AND U1.banned = 'No')
         JOIN Users AS U2 ON (T.driver_id = U2.users_id AND U2.banned = 'No')
WHERE T.request_at BETWEEN '2013-10-01' AND '2013-10-03'
GROUP BY T.request_at
```

## 超过 5 名学生的课

https://leetcode-cn.com/problems/classes-more-than-5-students

```sql
select class
from (select distinct (student), class from courses) as T
group by class
having count(class) >= 5;
```

```sql
select class
from courses
group by class
having count(distinct student) >= 5;
```

## 体育馆的人流量

https://leetcode-cn.com/problems/human-traffic-of-stadium/

```sql
select s1.*
from Stadium s1,
     Stadium s2,
     Stadium s3
where s1.people >= 100
  and s2.people >= 100
  and s3.people >= 100
  and s1.id = s2.id - 1
  and s2.id = s3.id - 1
union
select s2.*
from Stadium s1,
     Stadium s2,
     Stadium s3
where s1.people >= 100
  and s2.people >= 100
  and s3.people >= 100
  and s1.id = s2.id - 1
  and s2.id = s3.id - 1
union
select s3.*
from Stadium s1,
     Stadium s2,
     Stadium s3
where s1.people >= 100
  and s2.people >= 100
  and s3.people >= 100
  and s1.id = s2.id - 1
  and s2.id = s3.id - 1
order by id;
```

```sql
select distinct t1.*
from Stadium t1,
     Stadium t2,
     Stadium t3
where t1.people >= 100
  and t2.people >= 100
  and t3.people >= 100
  and (
        (t1.id - t2.id = 1 and t1.id - t3.id = 2 and t2.id - t3.id = 1) -- t1, t2, t3
        or
        (t2.id - t1.id = 1 and t2.id - t3.id = 2 and t1.id - t3.id = 1) -- t2, t1, t3
        or
        (t3.id - t2.id = 1 and t2.id - t1.id = 1 and t3.id - t1.id = 2) -- t3, t2, t1
    )
order by t1.id;
```

## 换座位

https://leetcode-cn.com/problems/exchange-seats/

```sql
select if(mod(id, 2) = 0, id - 1, if(id != (select count(*) from seat), id + 1, id)) as id, student
from seat
order by id;
```

## 行转列

https://leetcode-cn.com/problems/reformat-department-table/

```sql
SELECT id,
SUM(CASE `month` WHEN 'Jan' THEN revenue END) Jan_Revenue,
SUM(CASE `month` WHEN 'Feb' THEN revenue END) Feb_Revenue,
SUM(CASE `month` WHEN 'Mar' THEN revenue END) Mar_Revenue,
SUM(CASE `month` WHEN 'Apr' THEN revenue END) Apr_Revenue,
SUM(CASE `month` WHEN 'May' THEN revenue END) May_Revenue,
SUM(CASE `month` WHEN 'Jun' THEN revenue END) Jun_Revenue,
SUM(CASE `month` WHEN 'Jul' THEN revenue END) Jul_Revenue,
SUM(CASE `month` WHEN 'Aug' THEN revenue END) Aug_Revenue,
SUM(CASE `month` WHEN 'Sep' THEN revenue END) Sep_Revenue,
SUM(CASE `month` WHEN 'Oct' THEN revenue END) Oct_Revenue,
SUM(CASE `month` WHEN 'Nov' THEN revenue END) Nov_Revenue,
SUM(CASE `month` WHEN 'Dec' THEN revenue END) Dec_Revenue
FROM Department
GROUP BY id;
```
