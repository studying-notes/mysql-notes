create table Movie_Rating
(
    movie_id   int  null,
    user_id    int  null,
    rating     int  null,
    created_at date null
);

INSERT INTO leetcode_medium.Movie_Rating (movie_id, user_id, rating, created_at) VALUES (1, 1, 3, '2020-01-12');
INSERT INTO leetcode_medium.Movie_Rating (movie_id, user_id, rating, created_at) VALUES (1, 2, 4, '2020-02-11');
INSERT INTO leetcode_medium.Movie_Rating (movie_id, user_id, rating, created_at) VALUES (1, 3, 2, '2020-02-12');
INSERT INTO leetcode_medium.Movie_Rating (movie_id, user_id, rating, created_at) VALUES (1, 4, 1, '2020-01-01');
INSERT INTO leetcode_medium.Movie_Rating (movie_id, user_id, rating, created_at) VALUES (2, 1, 5, '2020-02-17');
INSERT INTO leetcode_medium.Movie_Rating (movie_id, user_id, rating, created_at) VALUES (2, 2, 2, '2020-02-01');
INSERT INTO leetcode_medium.Movie_Rating (movie_id, user_id, rating, created_at) VALUES (2, 3, 2, '2020-03-01');
INSERT INTO leetcode_medium.Movie_Rating (movie_id, user_id, rating, created_at) VALUES (3, 1, 3, '2020-02-22');
INSERT INTO leetcode_medium.Movie_Rating (movie_id, user_id, rating, created_at) VALUES (3, 2, 4, '2020-02-25');