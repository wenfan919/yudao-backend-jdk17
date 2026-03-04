DROP TABLE IF EXISTS `ai_api_key`;
CREATE TABLE `ai_api_key` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `api_key` varchar(512) DEFAULT NULL COMMENT '密钥',
  `platform` varchar(64) DEFAULT NULL COMMENT '平台',
  `url` varchar(255) DEFAULT NULL COMMENT 'API 地址',
  `status` int DEFAULT NULL COMMENT '状态',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  `creator` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='AI API 密钥';

DROP TABLE IF EXISTS `ai_model`;
CREATE TABLE `ai_model` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `key_id` bigint DEFAULT NULL COMMENT 'API 秘钥编号',
  `name` varchar(100) DEFAULT NULL COMMENT '模型名称',
  `model` varchar(128) DEFAULT NULL COMMENT '模型标志',
  `platform` varchar(64) DEFAULT NULL COMMENT '平台',
  `type` int DEFAULT NULL COMMENT '类型',
  `sort` int DEFAULT NULL COMMENT '排序值',
  `status` int DEFAULT NULL COMMENT '状态',
  `temperature` double DEFAULT NULL COMMENT '温度参数',
  `max_tokens` int DEFAULT NULL COMMENT '单条回复最大 Token',
  `max_contexts` int DEFAULT NULL COMMENT '上下文最大 Message 数',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  `creator` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='AI 模型';

DROP TABLE IF EXISTS `ai_tool`;
CREATE TABLE `ai_tool` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '工具编号',
  `name` varchar(100) DEFAULT NULL COMMENT '工具名称',
  `description` text COMMENT '工具描述',
  `status` int DEFAULT NULL COMMENT '状态',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  `creator` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='AI 工具';

DROP TABLE IF EXISTS `ai_chat_role`;
CREATE TABLE `ai_chat_role` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `avatar` varchar(512) DEFAULT NULL COMMENT '角色头像',
  `category` varchar(100) DEFAULT NULL COMMENT '角色分类',
  `description` text COMMENT '角色描述',
  `system_message` text COMMENT '角色设定',
  `user_id` bigint DEFAULT NULL COMMENT '用户编号',
  `model_id` bigint DEFAULT NULL COMMENT '模型编号',
  `knowledge_ids` varchar(1000) DEFAULT NULL COMMENT '知识库编号列表(逗号分隔)',
  `tool_ids` varchar(1000) DEFAULT NULL COMMENT '工具编号列表(逗号分隔)',
  `mcp_client_names` varchar(1000) DEFAULT NULL COMMENT 'MCP Client 名字列表(逗号分隔)',
  `public_status` tinyint(1) DEFAULT NULL COMMENT '是否公开',
  `sort` int DEFAULT NULL COMMENT '排序值',
  `status` int DEFAULT NULL COMMENT '状态',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  `creator` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='AI 聊天角色';

DROP TABLE IF EXISTS `ai_chat_conversation`;
CREATE TABLE `ai_chat_conversation` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '对话编号',
  `user_id` bigint DEFAULT NULL COMMENT '用户编号',
  `title` varchar(255) DEFAULT NULL COMMENT '对话标题',
  `pinned` tinyint(1) DEFAULT NULL COMMENT '是否置顶',
  `pinned_time` datetime DEFAULT NULL COMMENT '置顶时间',
  `role_id` bigint DEFAULT NULL COMMENT '角色编号',
  `model_id` bigint DEFAULT NULL COMMENT '模型编号',
  `model` varchar(128) DEFAULT NULL COMMENT '模型标志',
  `system_message` text COMMENT '角色设定',
  `temperature` double DEFAULT NULL COMMENT '温度参数',
  `max_tokens` int DEFAULT NULL COMMENT '单条回复最大 Token',
  `max_contexts` int DEFAULT NULL COMMENT '上下文最大 Message 数',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  `creator` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='AI Chat 对话';

DROP TABLE IF EXISTS `ai_chat_message`;
CREATE TABLE `ai_chat_message` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '消息编号',
  `conversation_id` bigint DEFAULT NULL COMMENT '对话编号',
  `reply_id` bigint DEFAULT NULL COMMENT '回复消息编号',
  `type` varchar(32) DEFAULT NULL COMMENT '消息类型',
  `user_id` bigint DEFAULT NULL COMMENT '用户编号',
  `role_id` bigint DEFAULT NULL COMMENT '角色编号',
  `model` varchar(128) DEFAULT NULL COMMENT '模型标志',
  `model_id` bigint DEFAULT NULL COMMENT '模型编号',
  `content` longtext COMMENT '聊天内容',
  `reasoning_content` longtext COMMENT '推理内容',
  `use_context` tinyint(1) DEFAULT NULL COMMENT '是否携带上下文',
  `segment_ids` varchar(1000) DEFAULT NULL COMMENT '知识库段落编号列表(逗号分隔)',
  `web_search_pages` json COMMENT '联网搜索网页内容',
  `attachment_urls` varchar(2000) DEFAULT NULL COMMENT '附件 URL 列表(逗号分隔)',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  `creator` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='AI Chat 消息';

DROP TABLE IF EXISTS `ai_image`;
CREATE TABLE `ai_image` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint DEFAULT NULL COMMENT '用户编号',
  `prompt` text COMMENT '提示词',
  `platform` varchar(64) DEFAULT NULL COMMENT '平台',
  `model_id` bigint DEFAULT NULL COMMENT '模型编号',
  `model` varchar(128) DEFAULT NULL COMMENT '模型标识',
  `width` int DEFAULT NULL COMMENT '图片宽度',
  `height` int DEFAULT NULL COMMENT '图片高度',
  `status` int DEFAULT NULL COMMENT '生成状态',
  `finish_time` datetime DEFAULT NULL COMMENT '完成时间',
  `error_message` varchar(512) DEFAULT NULL COMMENT '错误信息',
  `pic_url` varchar(512) DEFAULT NULL COMMENT '图片地址',
  `public_status` tinyint(1) DEFAULT NULL COMMENT '是否公开',
  `options` json COMMENT '绘制参数',
  `buttons` json COMMENT 'MJ buttons',
  `task_id` varchar(128) DEFAULT NULL COMMENT '任务编号',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  `creator` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='AI 绘画';

DROP TABLE IF EXISTS `ai_music`;
CREATE TABLE `ai_music` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint DEFAULT NULL COMMENT '用户编号',
  `title` varchar(255) DEFAULT NULL COMMENT '音乐名称',
  `lyric` longtext COMMENT '歌词',
  `image_url` varchar(512) DEFAULT NULL COMMENT '图片地址',
  `audio_url` varchar(512) DEFAULT NULL COMMENT '音频地址',
  `video_url` varchar(512) DEFAULT NULL COMMENT '视频地址',
  `status` int DEFAULT NULL COMMENT '音乐状态',
  `generate_mode` int DEFAULT NULL COMMENT '生成模式',
  `description` text COMMENT '描述词',
  `platform` varchar(64) DEFAULT NULL COMMENT '平台',
  `model` varchar(128) DEFAULT NULL COMMENT '模型',
  `tags` json COMMENT '音乐风格标签',
  `duration` double DEFAULT NULL COMMENT '音乐时长',
  `public_status` tinyint(1) DEFAULT NULL COMMENT '是否公开',
  `task_id` varchar(128) DEFAULT NULL COMMENT '任务编号',
  `error_message` varchar(512) DEFAULT NULL COMMENT '错误信息',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  `creator` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='AI 音乐';

DROP TABLE IF EXISTS `ai_write`;
CREATE TABLE `ai_write` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint DEFAULT NULL COMMENT '用户编号',
  `type` int DEFAULT NULL COMMENT '写作类型',
  `platform` varchar(64) DEFAULT NULL COMMENT '平台',
  `model_id` bigint DEFAULT NULL COMMENT '模型编号',
  `model` varchar(128) DEFAULT NULL COMMENT '模型',
  `prompt` text COMMENT '生成内容提示',
  `generated_content` longtext COMMENT '生成内容',
  `original_content` longtext COMMENT '原文',
  `length` int DEFAULT NULL COMMENT '长度提示词',
  `format` int DEFAULT NULL COMMENT '格式提示词',
  `tone` int DEFAULT NULL COMMENT '语气提示词',
  `language` int DEFAULT NULL COMMENT '语言提示词',
  `error_message` varchar(512) DEFAULT NULL COMMENT '错误信息',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  `creator` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='AI 写作';

DROP TABLE IF EXISTS `ai_mind_map`;
CREATE TABLE `ai_mind_map` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint DEFAULT NULL COMMENT '用户编号',
  `platform` varchar(64) DEFAULT NULL COMMENT '平台',
  `model_id` bigint DEFAULT NULL COMMENT '模型编号',
  `model` varchar(128) DEFAULT NULL COMMENT '模型',
  `prompt` text COMMENT '生成内容提示',
  `generated_content` longtext COMMENT '生成内容',
  `error_message` varchar(512) DEFAULT NULL COMMENT '错误信息',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  `creator` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='AI 思维导图';

DROP TABLE IF EXISTS `ai_workflow`;
CREATE TABLE `ai_workflow` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(100) DEFAULT NULL COMMENT '工作流名称',
  `code` varchar(100) DEFAULT NULL COMMENT '工作流标识',
  `graph` longtext COMMENT '工作流模型 JSON',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `status` int DEFAULT NULL COMMENT '状态',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  `creator` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='AI 工作流';

DROP TABLE IF EXISTS `ai_knowledge`;
CREATE TABLE `ai_knowledge` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(100) DEFAULT NULL COMMENT '知识库名称',
  `description` text COMMENT '知识库描述',
  `embedding_model_id` bigint DEFAULT NULL COMMENT '向量模型编号',
  `embedding_model` varchar(128) DEFAULT NULL COMMENT '向量模型标识',
  `top_k` int DEFAULT NULL COMMENT 'topK',
  `similarity_threshold` double DEFAULT NULL COMMENT '相似度阈值',
  `status` int DEFAULT NULL COMMENT '状态',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  `creator` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='AI 知识库';

DROP TABLE IF EXISTS `ai_knowledge_document`;
CREATE TABLE `ai_knowledge_document` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `knowledge_id` bigint DEFAULT NULL COMMENT '知识库编号',
  `name` varchar(255) DEFAULT NULL COMMENT '文档名称',
  `url` varchar(512) DEFAULT NULL COMMENT '文件 URL',
  `content` longtext COMMENT '内容',
  `content_length` int DEFAULT NULL COMMENT '文档长度',
  `tokens` int DEFAULT NULL COMMENT '文档 token 数量',
  `segment_max_tokens` int DEFAULT NULL COMMENT '分片最大 Token 数',
  `retrieval_count` int DEFAULT NULL COMMENT '召回次数',
  `status` int DEFAULT NULL COMMENT '状态',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  `creator` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='AI 知识库-文档';

DROP TABLE IF EXISTS `ai_knowledge_segment`;
CREATE TABLE `ai_knowledge_segment` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `knowledge_id` bigint DEFAULT NULL COMMENT '知识库编号',
  `document_id` bigint DEFAULT NULL COMMENT '文档编号',
  `content` longtext COMMENT '切片内容',
  `content_length` int DEFAULT NULL COMMENT '切片内容长度',
  `vector_id` varchar(255) DEFAULT NULL COMMENT '向量库编号',
  `tokens` int DEFAULT NULL COMMENT 'token 数量',
  `retrieval_count` int DEFAULT NULL COMMENT '召回次数',
  `status` int DEFAULT NULL COMMENT '状态',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  `creator` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='AI 知识库-文档分段';
