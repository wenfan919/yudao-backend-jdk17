INSERT INTO ea_doc (name, file_name, content, paragraph_count, status, lock_flag, current_version_id, creator, updater)
VALUES ('EA示例文档', 'ea-demo.txt', '能力域A\n\n流程B\n\n系统C', 3, 10, b'0', 0, 'system', 'system');

INSERT INTO ea_doc_paragraph (doc_id, paragraph_no, content, creator, updater)
VALUES (1, 1, '能力域A', 'system', 'system'),
       (1, 2, '流程B', 'system', 'system'),
       (1, 3, '系统C', 'system', 'system');
