# 广告点击率
select ad_id,
       round(ifnull(sum(if(action = 'Clicked', 1, 0)) /
                    sum(if(action != 'Ignored', 1, 0)) * 100, 0), 2) as ctr
from Ads
group by ad_id;

# 平均销售价格
select Prices.product_id, round(sum(price * units) / sum(units), 2) as average_price
from Prices,
     UnitsSold
where UnitsSold.purchase_date between start_date and end_date
  and Prices.product_id = UnitsSold.product_id
group by Prices.product_id;

# 找出只出现单次的最大值
select num
from my_numbers
group by num
having count(*) = 1
order by num desc
limit 1;

# 相邻空座位
select distinct c1.seat_id as seat_id
from cinema c1
         join cinema c2
              on (c1.seat_id = c2.seat_id - 1 or c1.seat_id = c2.seat_id + 1)
                  and c1.free = 1
                  and c2.free = 1
order by seat_id;

select seat_id
from (select seat_id,
             free,
             lead(free, 1) over () as next,
             lag(free, 1) over ()  as prev
      from cinema) s
where s.free = 1
  and (s.next = 1
    or s.prev = 1)
order by seat_id;

# 区间统计
(Select '[0-5>'                          as bin,
        sum(if(duration / 60 < 5, 1, 0)) as total
 from Sessions)
union
(Select '[5-10>'                                                       as bin,
        sum(if(((duration / 60 >= 5) and (duration / 60 < 10)), 1, 0)) as total
 from Sessions)
union
(Select '[10-15>'                                                       as bin,
        sum(if(((duration / 60 >= 10) and (duration / 60 < 15)), 1, 0)) as total
 from Sessions)
union
(Select '15 or more'                       as bin,
        sum(if(duration / 60 >= 15, 1, 0)) as total
 from Sessions);

# 点餐最多的顾客
select customer_number
from orders
group by customer_number
having count(*) = (select count(*) cnt
                   from orders
                   group by customer_number
                   order by cnt desc
                   limit 1);

select customer_number
from (select customer_number,
             rank() over (order by count(customer_number) desc) as rk
      from orders
      group by customer_number) c
where c.rk = 1;

# 团队人数
select em1.employee_id as employee_id, em2.cnt as team_size
from Employee em1,
     (select e2.team_id team_id, count(*) cnt
      from Employee e2
      group by e2.team_id) em2
where em1.team_id = em2.team_id
order by em1.employee_id;

select employee_id, em2.cnt as team_size
from Employee em1
         join (select team_id, count(team_id) cnt
               from Employee
               group by team_id) em2
              on em1.team_id = em2.team_id;

# 好友申请通过率
select ifnull(round((select count(distinct requester_id, accepter_id)
                     from request_accepted) /
                    (select count(distinct sender_id, send_to_id)
                     from friend_request), 2), 0) as accept_rate;

# 第一次登录的时间
select player_id, min(event_date) first_login
from Activity
group by player_id;

# 第一次登录用的设备
select act1.player_id, act1.device_id
from Activity act1
         join (select player_id, min(event_date) first_login
               from Activity
               group by player_id) act2
              on act1.player_id = act2.player_id
                  and act1.event_date = act2.first_login;

select player_id, device_id
from (
         select player_id,
                device_id,
                rank() over (
                    partition by player_id
                    order by event_date
                    ) rk
         from Activity
     ) act
where rk = 1;

# 统计某天销售的数量和商品名称
select sell_date,
       count(distinct product)                      as num_sold,
       group_concat(distinct product separator ',') as products
from Activities
group by sell_date;

# 立即配送比例
select round(sum(if(order_date = customer_pref_delivery_date, 1, 0))
                 / sum(1) * 100, 2)
           as immediate_percentage
from Delivery;

select round(avg(
                     if(order_date = customer_pref_delivery_date, 1, 0)), 2)
           as immediate_percentage
from Delivery;

select product_name, sum(unit) unit
from Products
         join Orders O
              on Products.product_id = O.product_id
                  and O.order_date
                     between '2020-2-1'
                     and '2020-2-29'
group by product_name
having sum(unit) >= 100;

use gorm_test;

# 找出文章评论数量
select sb.sub_id post_id, count(distinct sm.sub_id) number_of_comments
from Submissions sm
         right join (select distinct sub_id from Submissions where parent_id is null) sb
                    on sm.parent_id = sb.sub_id
group by sb.sub_id;

# 统计不同年份的售价
select product_name, year, price
from Sales,
     Product
where Sales.product_id = Product.product_id;

select product_id, sum(quantity)
from Sales
group by product_id;

# 统计项目人员平均工作经验
select project_id, avg(experience_years) experience_years
from Project
         join Employee on Project.employee_id = Employee.employee_id
group by project_id;

# 找出人员最多的项目
select project_id
from (select project_id,
             rank() over (order by count(employee_id) desc ) rk
      from Project
      group by project_id) pj
where pj.rk = 1;

# 质量百分比
select query_name,
       round(avg(rating / position), 2)          quality,
       round(avg(if(rating < 3, 1, 0)) * 100, 2) poor_query_percentage
from Queries
group by query_name;

# 时间减法
select extra report_reason, count(distinct post_id) report_count
from Actions
where extra is not null
  and action = 'report'
  and action_date = DATE_SUB('2019-07-5', INTERVAL 1 DAY)
group by extra;

select DATE_SUB('2019-07-5', INTERVAL 1 DAY);

# 销售数据分析
select seller_id
from (select seller_id, rank() over (order by sum(price) desc ) rk from sales_27 group by seller_id) s
where rk = 1;

select buyer_id
from sales_27,
     product_27
where sales_27.product_id = product_27.product_id
group by buyer_id
having sum(if(product_name = 'S8', 1, 0)) > 0
   and sum(if(product_name = 'iPhone', 1, 0)) = 0;

select product_27.product_id
from product_27,
     sales_27
where sales_27.product_id = product_27.product_id
group by product_27.product_id
having any_value(sale_date) between '2019-01-01' and '2019-03-31';

# 没有卖给过某公司的销售员
select s.name name
from salesperson s
         left join orders12 o on s.sales_id = o.sales_id
         left join company c on o.com_id = c.com_id
group by s.name
having sum(if(c.name = 'RED', 1, 0)) = 0;

# 第二高的薪水
select Salary
from (
         select Salary, dense_rank() over (order by salary) rk
         from Salary) s
where rk = 2;

select Salary
from Salary
order by Salary desc
limit 2,1;

# 最短距离
select min(abs(p1.x - p2.x)) shortest
from points p1
         join points p2 on p1.x != p2.x;

# 学生与考试
select S.student_id                student_id,
       S.student_name              student_name,
       S.subject_name              subject_name,
       ifnull(U.attended_exams, 0) attended_exams
from (select stu.student_id, stu.student_name, sub.subject_name
      from Students stu,
           Subjects sub) S
         left join (select S.student_id, student_name, E.subject_name, count(*) attended_exams
                    from Students S
                             join Examinations E on S.student_id = E.student_id
                    group by S.student_id, student_name, E.subject_name
                    order by S.student_id) U on S.student_id = U.student_id
    and S.subject_name = U.subject_name
order by student_id;

# 旅途长短
select name, ifnull(sum(distance), 0) travelled_distance
from users1
         left join Rides
                   on user_id = users1.id
group by name
order by travelled_distance desc, name;

# 三角形边长
select x, y, z, if(x + y > z, 'Yes', 'No') triangle
from triangle;

# 各国气温
select country_name,
       case
           when avg(weather_state) <= 15 then 'Cold'
           when avg(weather_state) >= 25 then 'Hot'
           else 'Warm' end weather_type
from Countries,
     Weather46
where Countries.country_id = Weather46.country_id
  and month(day) = 11
group by country_name;
