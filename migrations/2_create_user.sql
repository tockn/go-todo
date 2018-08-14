-- +migrate Up
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) NOT NULL COMMENT 'ユーザー名',
  `created` datetime NOT NULL DEFAULT NOW() COMMENT '登録日',
  `updated` datetime DEFAULT NULL COMMENT '更新日',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='ユーザー一覧';

-- +migrate Down
DROP TABLE users;
