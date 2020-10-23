create table views
(
    article_id int  null,
    author_id  int  null,
    viewer_id  int  null,
    view_date  date null
);

INSERT INTO leetcode_easy.views (article_id, author_id, viewer_id, view_date) VALUES (1, 3, 5, '2019-08-01');
INSERT INTO leetcode_easy.views (article_id, author_id, viewer_id, view_date) VALUES (1, 3, 6, '2019-08-02');
INSERT INTO leetcode_easy.views (article_id, author_id, viewer_id, view_date) VALUES (2, 7, 7, '2019-08-01');
INSERT INTO leetcode_easy.views (article_id, author_id, viewer_id, view_date) VALUES (2, 7, 6, '2019-08-02');
INSERT INTO leetcode_easy.views (article_id, author_id, viewer_id, view_date) VALUES (4, 7, 1, '2019-07-22');
INSERT INTO leetcode_easy.views (article_id, author_id, viewer_id, view_date) VALUES (3, 4, 4, '2019-07-21');
INSERT INTO leetcode_easy.views (article_id, author_id, viewer_id, view_date) VALUES (3, 4, 4, '2019-07-21');