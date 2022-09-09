create table Users
(
    Users_Id int auto_increment
        primary key,
    Banned   enum ('No', 'Yes')                   null,
    Role     enum ('client', 'driver', 'partner') null
);

INSERT INTO leetcode_easy.Users (Users_Id, Banned, Role) VALUES (1, 'No', 'client');
INSERT INTO leetcode_easy.Users (Users_Id, Banned, Role) VALUES (2, 'Yes', 'client');
INSERT INTO leetcode_easy.Users (Users_Id, Banned, Role) VALUES (3, 'No', 'client');
INSERT INTO leetcode_easy.Users (Users_Id, Banned, Role) VALUES (4, 'No', 'client');
INSERT INTO leetcode_easy.Users (Users_Id, Banned, Role) VALUES (10, 'No', 'driver');
INSERT INTO leetcode_easy.Users (Users_Id, Banned, Role) VALUES (11, 'No', 'driver');
INSERT INTO leetcode_easy.Users (Users_Id, Banned, Role) VALUES (12, 'No', 'driver');
INSERT INTO leetcode_easy.Users (Users_Id, Banned, Role) VALUES (13, 'No', 'driver');