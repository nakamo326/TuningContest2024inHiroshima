ALTER TABLE match_group_member ADD INDEX match_user_index (user_id);
ALTER TABLE match_group_member ADD INDEX match_group_id_index (match_group_id);
