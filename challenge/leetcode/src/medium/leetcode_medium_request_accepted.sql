create table request_accepted
(
    requester_id int  null,
    accepter_id  int  null,
    accept_date  date null
);

INSERT INTO leetcode_medium.request_accepted (requester_id, accepter_id, accept_date) VALUES (1, 2, '2016-06-03');
INSERT INTO leetcode_medium.request_accepted (requester_id, accepter_id, accept_date) VALUES (1, 3, '2016-06-08');
INSERT INTO leetcode_medium.request_accepted (requester_id, accepter_id, accept_date) VALUES (2, 3, '2016-06-08');
INSERT INTO leetcode_medium.request_accepted (requester_id, accepter_id, accept_date) VALUES (3, 4, '2016-06-09');