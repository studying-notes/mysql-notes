SELECT *
FROM users,
     (SELECT user_id
      FROM posts
      LIMIT 50000,200) AS p
WHERE users.id = p.user_id;