-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'surveys'
-- Tabela de pesquisas
-- ---

DROP TABLE IF EXISTS `surveys`;
		
CREATE TABLE `surveys` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `title` VARCHAR(50) NULL DEFAULT NULL,
  `description` MEDIUMTEXT(4000) NULL DEFAULT NULL,
  `createdAt` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) COMMENT 'Tabela de pesquisas';

-- ---
-- Table 'category'
-- Tabela de categorias
-- ---

DROP TABLE IF EXISTS `category`;
		
CREATE TABLE `category` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `id_surveys` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) COMMENT 'Tabela de categorias';

-- ---
-- Table 'user_answers'
-- Tabela de respostas dos usuários
-- ---

DROP TABLE IF EXISTS `user_answers`;
		
CREATE TABLE `user_answers` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `id_surveys` INTEGER NULL DEFAULT NULL,
  `id_questions` INTEGER NULL DEFAULT NULL,
  `id_premade_answers` INTEGER NULL DEFAULT NULL,
  `id_category` INTEGER NULL DEFAULT NULL,
  `id_users` INTEGER NULL DEFAULT NULL,
  `answer` MEDIUMTEXT(4000) NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) COMMENT 'Tabela de respostas dos usuários';

-- ---
-- Table 'users'
-- Tabela de usuários
-- ---

DROP TABLE IF EXISTS `users`;
		
CREATE TABLE `users` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `name` VARCHAR(50) NULL DEFAULT NULL,
  `email` VARCHAR(255) NULL DEFAULT NULL,
  `cellphone` INTEGER(20) NULL DEFAULT NULL,
  `is_adm` BINARY NULL DEFAULT NULL,
  `id_category` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) COMMENT 'Tabela de usuários';

-- ---
-- Table 'questions'
-- Tabela de questões
-- ---

DROP TABLE IF EXISTS `questions`;
		
CREATE TABLE `questions` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `id_surveys` INTEGER NULL DEFAULT NULL,
  `type` VARCHAR(50) NULL DEFAULT NULL,
  `id_category` INTEGER NULL DEFAULT NULL,
  `question_text` MEDIUMTEXT(4000) NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) COMMENT 'Tabela de questões';

-- ---
-- Table 'premade_answers'
-- Tabela de respostas pré-definidas
-- ---

DROP TABLE IF EXISTS `premade_answers`;
		
CREATE TABLE `premade_answers` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `id_surveys` INTEGER NULL DEFAULT NULL,
  `premade_answer_text` MEDIUMTEXT(4000) NULL DEFAULT NULL,
  `id_category` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) COMMENT 'Tabela de respostas pré-definidas';

-- ---
-- Table 'surveys_users'
-- Tabela de relacionamento entre "surveys" e "users"
-- ---

DROP TABLE IF EXISTS `surveys_users`;
		
CREATE TABLE `surveys_users` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `id_users` INTEGER NULL DEFAULT NULL,
  `id_surveys` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) COMMENT 'Tabela de relacionamento entre "surveys" e "users"';

-- ---
-- Foreign Keys 
-- ---

ALTER TABLE `category` ADD FOREIGN KEY (id_surveys) REFERENCES `surveys` (`id`);
ALTER TABLE `user_answers` ADD FOREIGN KEY (id_surveys) REFERENCES `surveys` (`id`);
ALTER TABLE `user_answers` ADD FOREIGN KEY (id_questions) REFERENCES `questions` (`id`);
ALTER TABLE `user_answers` ADD FOREIGN KEY (id_premade_answers) REFERENCES `premade_answers` (`id`);
ALTER TABLE `user_answers` ADD FOREIGN KEY (id_category) REFERENCES `category` (`id`);
ALTER TABLE `user_answers` ADD FOREIGN KEY (id_users) REFERENCES `users` (`id`);
ALTER TABLE `users` ADD FOREIGN KEY (id_category) REFERENCES `category` (`id`);
ALTER TABLE `questions` ADD FOREIGN KEY (id_surveys) REFERENCES `surveys` (`id`);
ALTER TABLE `questions` ADD FOREIGN KEY (id_category) REFERENCES `category` (`id`);
ALTER TABLE `premade_answers` ADD FOREIGN KEY (id_surveys) REFERENCES `surveys` (`id`);
ALTER TABLE `premade_answers` ADD FOREIGN KEY (id_category) REFERENCES `category` (`id`);
ALTER TABLE `surveys_users` ADD FOREIGN KEY (id_users) REFERENCES `users` (`id`);
ALTER TABLE `surveys_users` ADD FOREIGN KEY (id_surveys) REFERENCES `surveys` (`id`);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `surveys` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `category` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `user_answers` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `users` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `questions` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `premade_answers` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `surveys_users` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `surveys` (`id`,`title`,`description`,`createdAt`) VALUES
-- ('','','','');
-- INSERT INTO `category` (`id`,`id_surveys`) VALUES
-- ('','');
-- INSERT INTO `user_answers` (`id`,`id_surveys`,`id_questions`,`id_premade_answers`,`id_category`,`id_users`,`answer`) VALUES
-- ('','','','','','','');
-- INSERT INTO `users` (`id`,`name`,`email`,`cellphone`,`is_adm`,`id_category`) VALUES
-- ('','','','','','');
-- INSERT INTO `questions` (`id`,`id_surveys`,`type`,`id_category`,`question_text`) VALUES
-- ('','','','','');
-- INSERT INTO `premade_answers` (`id`,`id_surveys`,`premade_answer_text`,`id_category`) VALUES
-- ('','','','');
-- INSERT INTO `surveys_users` (`id`,`id_users`,`id_surveys`) VALUES
-- ('','','');