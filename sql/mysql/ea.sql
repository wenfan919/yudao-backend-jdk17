CREATE TABLE IF NOT EXISTS `ea_doc` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `content` longtext,
  `paragraph_count` int DEFAULT 0,
  `status` int DEFAULT 10,
  `lock_flag` bit(1) DEFAULT b'0',
  `current_version_id` bigint DEFAULT 0,
  `creator` varchar(64) DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `tenant_id` bigint NOT NULL DEFAULT 1,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `idx_ea_doc_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `ea_doc_paragraph` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `doc_id` bigint NOT NULL,
  `paragraph_no` int NOT NULL,
  `content` longtext,
  `creator` varchar(64) DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `tenant_id` bigint NOT NULL DEFAULT 1,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `idx_ea_doc_paragraph_doc` (`doc_id`,`paragraph_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `ea_gen_run` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `scope_type` varchar(64) NOT NULL,
  `strategy` varchar(64) NOT NULL,
  `status` int NOT NULL,
  `progress` int NOT NULL DEFAULT 0,
  `summary` varchar(512) DEFAULT '',
  `creator` varchar(64) DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `tenant_id` bigint NOT NULL DEFAULT 1,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `idx_ea_gen_run_status` (`status`,`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `ea_gen_task` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `run_id` bigint NOT NULL,
  `task_code` varchar(64) NOT NULL,
  `status` int NOT NULL,
  `sort_no` int NOT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `tenant_id` bigint NOT NULL DEFAULT 1,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `idx_ea_gen_task_run` (`run_id`,`sort_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `ea_gen_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `run_id` bigint NOT NULL,
  `task_id` bigint NOT NULL DEFAULT 0,
  `level` varchar(16) NOT NULL,
  `content` text,
  `creator` varchar(64) DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `tenant_id` bigint NOT NULL DEFAULT 1,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `idx_ea_gen_log_run` (`run_id`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
