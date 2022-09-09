create table Trips
(
    Id         int auto_increment
        primary key,
    Client_Id  int                                                              not null,
    Driver_Id  int                                                              not null,
    City_Id    int                                                              not null,
    Status     enum ('completed', 'cancelled_by_driver', 'cancelled_by_client') null,
    Request_at date                                                             null
);

INSERT INTO leetcode_easy.Trips (Id, Client_Id, Driver_Id, City_Id, Status, Request_at) VALUES (1, 1, 10, 1, 'completed', '2013-10-01');
INSERT INTO leetcode_easy.Trips (Id, Client_Id, Driver_Id, City_Id, Status, Request_at) VALUES (2, 2, 11, 1, 'cancelled_by_driver', '2013-10-01');
INSERT INTO leetcode_easy.Trips (Id, Client_Id, Driver_Id, City_Id, Status, Request_at) VALUES (3, 3, 12, 6, 'completed', '2013-10-01');
INSERT INTO leetcode_easy.Trips (Id, Client_Id, Driver_Id, City_Id, Status, Request_at) VALUES (4, 4, 13, 6, 'cancelled_by_driver', '2013-10-01');
INSERT INTO leetcode_easy.Trips (Id, Client_Id, Driver_Id, City_Id, Status, Request_at) VALUES (5, 1, 10, 1, 'completed', '2013-10-02');
INSERT INTO leetcode_easy.Trips (Id, Client_Id, Driver_Id, City_Id, Status, Request_at) VALUES (6, 2, 11, 6, 'completed', '2013-10-02');
INSERT INTO leetcode_easy.Trips (Id, Client_Id, Driver_Id, City_Id, Status, Request_at) VALUES (7, 3, 12, 6, 'completed', '2013-10-02');
INSERT INTO leetcode_easy.Trips (Id, Client_Id, Driver_Id, City_Id, Status, Request_at) VALUES (8, 2, 12, 12, 'completed', '2013-10-03');
INSERT INTO leetcode_easy.Trips (Id, Client_Id, Driver_Id, City_Id, Status, Request_at) VALUES (9, 3, 10, 12, 'completed', '2013-10-03');
INSERT INTO leetcode_easy.Trips (Id, Client_Id, Driver_Id, City_Id, Status, Request_at) VALUES (10, 4, 13, 12, 'cancelled_by_driver', '2013-10-03');