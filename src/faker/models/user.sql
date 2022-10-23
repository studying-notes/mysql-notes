CREATE TABLE IF NOT EXISTS `users`
(
    `id`        INTEGER AUTO_INCREMENT NOT NULL PRIMARY KEY,
    `username`  VARCHAR(255)           NOT NULL,
    `password`  VARCHAR(255)           NOT NULL,
    `email`     VARCHAR(255)           NOT NULL,
    `is_active` BOOL                   NOT NULL,
    `is_admin`  BOOL                   NOT NULL
);
