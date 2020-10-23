create table Events
(
    business_id int          null,
    event_type  varchar(255) null,
    occurences  int          null
);

INSERT INTO leetcode_medium.Events (business_id, event_type, occurences) VALUES (1, 'reviews', 7);
INSERT INTO leetcode_medium.Events (business_id, event_type, occurences) VALUES (3, 'reviews', 3);
INSERT INTO leetcode_medium.Events (business_id, event_type, occurences) VALUES (1, 'ads', 11);
INSERT INTO leetcode_medium.Events (business_id, event_type, occurences) VALUES (2, 'ads', 7);
INSERT INTO leetcode_medium.Events (business_id, event_type, occurences) VALUES (3, 'ads', 6);
INSERT INTO leetcode_medium.Events (business_id, event_type, occurences) VALUES (1, 'page views', 3);
INSERT INTO leetcode_medium.Events (business_id, event_type, occurences) VALUES (2, 'page views', 12);