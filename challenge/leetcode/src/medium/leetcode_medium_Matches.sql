create table Matches
(
    match_id    int null,
    host_team   int null,
    guest_team  int null,
    host_goals  int null,
    guest_goals int null
);

INSERT INTO leetcode_medium.Matches (match_id, host_team, guest_team, host_goals, guest_goals) VALUES (1, 10, 20, 3, 0);
INSERT INTO leetcode_medium.Matches (match_id, host_team, guest_team, host_goals, guest_goals) VALUES (2, 30, 10, 2, 2);
INSERT INTO leetcode_medium.Matches (match_id, host_team, guest_team, host_goals, guest_goals) VALUES (3, 10, 50, 5, 1);
INSERT INTO leetcode_medium.Matches (match_id, host_team, guest_team, host_goals, guest_goals) VALUES (4, 20, 30, 1, 0);
INSERT INTO leetcode_medium.Matches (match_id, host_team, guest_team, host_goals, guest_goals) VALUES (5, 50, 30, 1, 0);