create table Activity
(
    player_id    int  null,
    device_id    int  null,
    event_date   date null,
    games_played int  null
);

INSERT INTO leetcode_medium.Activity (player_id, device_id, event_date, games_played) VALUES (1, 2, '2016-03-01', 5);
INSERT INTO leetcode_medium.Activity (player_id, device_id, event_date, games_played) VALUES (1, 2, '2016-05-02', 6);
INSERT INTO leetcode_medium.Activity (player_id, device_id, event_date, games_played) VALUES (1, 3, '2017-06-25', 1);
INSERT INTO leetcode_medium.Activity (player_id, device_id, event_date, games_played) VALUES (3, 1, '2016-03-02', 0);
INSERT INTO leetcode_medium.Activity (player_id, device_id, event_date, games_played) VALUES (3, 4, '2018-07-03', 5);