---
date: 2020-10-24 16:41:33+08:00  # 创建日期
author: "Rustle Karl"  # 作者

title: "LeetCode 数据库解题（中等级别）"  # 文章标题
url:  "posts/mysql/interview/leetcode/medium"  # 设置网页永久链接
tags: [ "mysql", "leetcode" ]  # 标签
categories: [ "MySQL 学习笔记" ]  # 分类

toc: true  # 目录
draft: true  # 草稿
---

```sql
create database leetcode_medium;
use leetcode_medium;
```

- [活跃商家](#活跃商家)
- [连续5天登录的用户](#连续5天登录的用户)
- [非最大值和最小值](#非最大值和最小值)
- [多层关系链](#多层关系链)
- [销售数量差值](#销售数量差值)
- [同一天同一个人看了多篇文章](#同一天同一个人看了多篇文章)
- [计算税后工资](#计算税后工资)
- [股票盈亏情况](#股票盈亏情况)
- [部门学生数量](#部门学生数量)
- [票数最多的人](#票数最多的人)
- [不受欢迎的书](#不受欢迎的书)
- [打印二叉树](#打印二叉树)
- [表达式计算](#表达式计算)
- [找出连续自然数的开始和结束](#找出连续自然数的开始和结束)
- [加好友最多的人](#加好友最多的人)
- [累进求和](#累进求和)
- [能进电梯的最后一个人](#能进电梯的最后一个人)

## 活跃商家

```sql
select e.business_id
from (select business_id, event_type, occurences, average
      from Events a
               join (select event_type event, round(avg(occurences), 2) average
                     from Events b
                     group by event_type) c
      where a.event_type = c.event) e
where e.occurences > e.average
group by business_id
having count(event_type) > 1;
```

## 连续5天登录的用户

```sql
select distinct a.id, a.name
from Accounts a
         join(select id,
                     login_date,
                     lead(login_date, 4) over (partition by id order by login_date) date_5
              from (select distinct * from Logins) b) c on a.id = c.id
where datediff(c.date_5, login_date) = 4
order by id;
```

## 非最大值和最小值

```sql
with A as (
    select activity, sum(if(f.activity = a.name, 1, 0)) cnt
    from Friends f,
         Activities a
    group by activity
)
select activity
from A
where cnt != (select max(cnt) from A)
  and cnt != (select min(cnt) from A);
```

## 多层关系链

```sql
select employee_id
from employees
where manager_id = 1
  and employee_id != 1
union
select employee_id
from employees
where manager_id = any (select employee_id
                        from employees
                        where manager_id = 1
                          and employee_id != 1)
union
select employee_id
from employees
where manager_id = any (select employee_id
                        from employees
                        where manager_id = any (select employee_id
                                                from employees
                                                where manager_id = 1
                                                  and employee_id != 1));
```

## 销售数量差值

```sql
select sale_date, sum(if(fruit = 'apples', sold_num, -sold_num)) diff
from sales
group by sale_date;

select sale_date,
       sum(
               case
                   when fruit = 'apples' then sold_num
                   when fruit = 'oranges' then -sold_num
                   end) diff
from sales
group by sale_date;
```

## 同一天同一个人看了多篇文章

```sql
select viewer_id id
from (select distinct article_id, viewer_id, view_date
      from Views) A
group by viewer_id, view_date
having count(id) > 1;

select viewer_id id
from Views
group by viewer_id, view_date
having count(distinct article_id) > 1;
```

## 计算税后工资

```sql
select S1.company_id     company_id,
       S1.employee_id    employee_id,
       S1.employee_name  employee_name,
       round(case
                 when max_salary < 1000 then salary
                 when max_salary > 10000 then salary * (1 - 0.49)
                 else salary * (1 - 0.24)
                 end, 0) salary
from Salaries S1,
     (select company_id, max(salary) max_salary
      from Salaries
      group by company_id) S2
where S1.company_id = S2.company_id;
```

## 股票盈亏情况

```sql
select stock_name, sum(if(operation = 'Buy', -price, price)) capital_gain_loss
from Stocks
group by stock_name
order by capital_gain_loss desc;
```

## 部门学生数量

```sql
select dept_name, sum(if(student_id is null, 0, 1)) student_number
from department
         left join student s on department.dept_id = s.dept_id
group by dept_name;
```

## 票数最多的人

```sql
select name
from Candidate
where id = (select candidate_id
            from Vote
            group by candidate_id
            order by count(*) desc
            limit 1);
```

## 不受欢迎的书

```sql
select B1.book_id
from Books B1
         left join (
    select book_id, sum(if(dispatch_date between '2018-06-23' and '2019-05-23', quantity, 0)) quantity
    from Orders
    group by book_id) B2 on B1.book_id = B2.book_id
where available_from < date_sub('2019-06-23', interval 1 month)
  and ifnull(B2.quantity, 0) < 10;
```

## 打印二叉树

```sql
select id,
       case
           when p_id is null then 'Root'
           when id not in (select p_id from tree where p_id is not null group by p_id) then 'Leaf'
           else 'Inner'
           end as Type
from tree
order by id;
```

## 表达式计算

```sql
set @y = (select value
          from Variables
          where name = 'y');
set @x = (select value
          from Variables
          where name = 'x');
select left_operand,
       operator,
       right_operand,
       case
           when operator = '>'
               then if(if(left_operand = 'x', @x, @y) > if(right_operand = 'x', @x, @y), 'true',
                       'false')
           when operator = '='
               then if(if(left_operand = 'x', @x, @y) = if(right_operand = 'x', @x, @y), 'true',
                       'false')
           when operator = '<'
               then if(if(left_operand = 'x', @x, @y) < if(right_operand = 'x', @x, @y), 'true',
                       'false')
           end value
from Expressions;

with T as (
    select e.left_operand, e.operator, e.right_operand, v1.value as left_val, v2.value as right_val
    from Expressions e
             join Variables v1
                  on v1.name = e.left_operand
             join Variables v2
                  on v2.name = e.right_operand
)
select T.left_operand,
       T.operator,
       T.right_operand,
       case
           when T.operator = '<' then (select T.left_val < T.right_val)
           when T.operator = '>' then (select T.left_val > T.right_val)
           when T.operator = '=' then (select T.left_val = T.right_val)
           end value
from T;
```

## 找出连续自然数的开始和结束

```sql
set @cnt = 0;
set @gp = 1;
select min(log_id) start_id, max(log_id) end_id
from (select log_id, if(log_id != @cnt, @gp := @gp + 1, @gp) gp, @cnt := log_id + 1
      from Logs
      order by log_id) L
group by gp;

select min(log_id) start_id, max(log_id) end_id
from (
         select log_id, log_id - row_number() over (order by log_id) as rk
         from Logs) L
group by rk
```

## 加好友最多的人

```sql
select id, sum(num) num
from (select requester_id id, count(*) num
      from request_accepted
      group by requester_id
      union all
      select accepter_id id, count(*) num
      from request_accepted
      group by accepter_id) A
group by id
order by num desc
limit 1;
```

## 累进求和

```sql
select player_id,
       event_date,
       sum(games_played)
           over (
               partition by player_id
               order by event_date
               ) games_played_so_far
from Activity
order by 1, 2;
```

## 能进电梯的最后一个人

```sql
select person_name
from (
         select person_name,
                turn,
                sum(weight) over (order by turn) total
         from Queue
     ) Q
where Q.total <= 1000
order by Q.turn desc
limit 1;
```
