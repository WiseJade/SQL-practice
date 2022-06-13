CREATE TABLE `role` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL
);

CREATE TABLE `user` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `roleId` int
);

CREATE TABLE `content` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `body` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT (_GENERATED),
  `userId` int
);

CREATE TABLE `category` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL
);

CREATE TABLE `content_category` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `contentId` int NOT NULL,
  `categoryId` int NOT NULL
);

ALTER TABLE `user` ADD FOREIGN KEY (`roleId`) REFERENCES `role` (`id`) ON UPDATE CASCADE;

ALTER TABLE `content` ADD FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON UPDATE CASCADE;

ALTER TABLE `content_category` ADD FOREIGN KEY (`contentId`) REFERENCES `content` (`id`) ON UPDATE CASCADE;

ALTER TABLE `content_category` ADD FOREIGN KEY (`categoryId`) REFERENCES `category` (`id`) ON UPDATE CASCADE;
