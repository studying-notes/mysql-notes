create table Ads
(
    ad_id   int                                   null,
    user_id int                                   null,
    action  enum ('Clicked', 'Viewed', 'Ignored') null
);

INSERT INTO leetcode_easy.Ads (ad_id, user_id, action) VALUES (1, 1, 'Clicked');
INSERT INTO leetcode_easy.Ads (ad_id, user_id, action) VALUES (2, 2, 'Clicked');
INSERT INTO leetcode_easy.Ads (ad_id, user_id, action) VALUES (3, 3, 'Viewed');
INSERT INTO leetcode_easy.Ads (ad_id, user_id, action) VALUES (5, 5, 'Ignored');
INSERT INTO leetcode_easy.Ads (ad_id, user_id, action) VALUES (1, 7, 'Ignored');
INSERT INTO leetcode_easy.Ads (ad_id, user_id, action) VALUES (2, 7, 'Viewed');
INSERT INTO leetcode_easy.Ads (ad_id, user_id, action) VALUES (3, 5, 'Clicked');
INSERT INTO leetcode_easy.Ads (ad_id, user_id, action) VALUES (1, 4, 'Viewed');
INSERT INTO leetcode_easy.Ads (ad_id, user_id, action) VALUES (2, 11, 'Viewed');
INSERT INTO leetcode_easy.Ads (ad_id, user_id, action) VALUES (1, 2, 'Clicked');