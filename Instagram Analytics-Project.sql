
USE ig_clone;
-- 1st question 
SELECT * FROM users ORDER BY created_at ASC limit 1,5;


-- 2nd question
SELECT u.* ,p.id
FROM users u
LEFT JOIN photos p ON u.id = p.user_id 
WHERE p.user_id is null
order by u.username;



-- 3rd question
WITH CTE1 AS(
SELECT l.photo_id,u.username,count(l.User_id) as likes_by_user
from likes l
INNER JOIN photos p 
ON l.photo_id=p.id
INNER JOIN users u
ON p.user_id=u.id
group by l.photo_id,u.username
order by likes_by_user DESC 
limit 2)
select username from CTE1;


-- 4th question
SELECT t.tag_name,COUNT(p.photo_id) AS number_of_tags 
FROM photo_tags p
INNER JOIN tags t
ON p.tag_id=t.id
 group by tag_name 
 order by number_of_tags DESC
 LIMIT 5;

 
 -- 5th question
 select dayname(created_at) as Register_day,COUNT(*) AS Occurrence
 from users
 group by Register_day
 order by 2 DESC;


 -- 6th Question
 WITH CTE AS (
 SELECT 
 u.id AS userid,
 count(p.id) AS photoid
 FROM users u
 LEFT JOIN 
 photos p 
 ON u.id = p.user_id
 GROUP BY 
 u.id)
 SELECT SUM(photoid)/COUNT(userid) AS post_per_user
 FROM CTE
 WHERE
 photoid>0;
 
 
-- 7th question 
 select user_id,
 COUNT(photo_id) AS number_of_likes
 FROM likes
 GROUP BY user_id
 HAVING COUNT(photo_id) = (select count(*) from photos);
 