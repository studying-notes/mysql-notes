create table friend_request
(
    sender_id    int  null,
    send_to_id   int  null,
    request_date date null
);

INSERT INTO leetcode_easy.friend_request (sender_id, send_to_id, request_date) VALUES (1, 2, '2016-06-01');
INSERT INTO leetcode_easy.friend_request (sender_id, send_to_id, request_date) VALUES (1, 3, '2016-06-01');
INSERT INTO leetcode_easy.friend_request (sender_id, send_to_id, request_date) VALUES (1, 4, '2016-06-01');
INSERT INTO leetcode_easy.friend_request (sender_id, send_to_id, request_date) VALUES (2, 3, '2016-06-02');
INSERT INTO leetcode_easy.friend_request (sender_id, send_to_id, request_date) VALUES (3, 4, '2016-06-09');