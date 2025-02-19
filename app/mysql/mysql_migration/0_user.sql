-- このファイルに記述されたSQLコマンドが、マイグレーション時に実行されます。
ALTER TABLE user ADD INDEX user_index (entry_date ASC, kana ASC);
ALTER TABLE user ADD INDEX usericon_index (user_icon_id);
ALTER TABLE user ADD INDEX office_id_index (office_id);
ALTER TABLE user ADD INDEX emp_index (employee_id);
ALTER TABLE user ADD INDEX mailpass_index (mail, password);

ALTER TABLE `user` DROP PRIMARY KEY,
ADD COLUMN `id` INT NOT NULL AUTO_INCREMENT FIRST,
ADD PRIMARY KEY (`id`),
ADD UNIQUE (`user_id`);
ALTER TABLE `user` ADD INDEX `user_id_index` (`user_id`);


CREATE FULLTEXT INDEX idx_ngram_user_name ON user (user_name) WITH PARSER ngram;
CREATE FULLTEXT INDEX idx_ngram_kana ON user (kana) WITH PARSER ngram;
CREATE FULLTEXT INDEX idx_ngram_mail ON user (mail) WITH PARSER ngram;
CREATE FULLTEXT INDEX idx_ngram_goal ON user (goal) WITH PARSER ngram;
