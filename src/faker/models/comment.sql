CREATE TABLE IF NOT EXISTS `comments`
(
    `id`      INTEGER AUTO_INCREMENT NOT NULL PRIMARY KEY,
    `content` TEXT                   NOT NULL,
    `user_id` INTEGER                NOT NULL,
    `post_id` INTEGER                NOT NULL,
    FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
    FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`)
);

CREATE INDEX `comment_user_id` ON `comments` (`user_id`);
CREATE INDEX `comment_post_id` ON `comments` (`post_id`);
