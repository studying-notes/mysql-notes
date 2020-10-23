create database leetcode_medium;
use leetcode_medium;

# 活跃商家
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

# 连续5天登录的用户
select distinct a.id, a.name
from Accounts a
         join(select id,
                     login_date,
                     lead(login_date, 4) over (partition by id order by login_date) date_5
              from (select distinct * from Logins) b) c on a.id = c.id
where datediff(c.date_5, login_date) = 4
order by id;

# 非最大值和最小值
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

# 多层关系链
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

# 销售数量差值
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

# 同一天同一个人看了多篇文章
select viewer_id id
from (select distinct article_id, viewer_id, view_date
      from Views) A
group by viewer_id, view_date
having count(id) > 1;

select viewer_id id
from Views
group by viewer_id, view_date
having count(distinct article_id) > 1;



