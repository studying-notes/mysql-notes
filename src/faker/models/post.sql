CREATE TABLE IF NOT EXISTS `posts`
(
    `id`      INTEGER AUTO_INCREMENT NOT NULL PRIMARY KEY,
    `title`   VARCHAR(255)           NOT NULL,
    `content` TEXT                   NOT NULL,
    `user_id` INTEGER                NOT NULL,
    FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
);

CREATE INDEX `post_user_id` ON `posts` (`user_id`);

