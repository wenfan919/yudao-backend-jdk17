# EA 数据库设计

## 核心表
- `ea_doc`
- `ea_doc_paragraph`
- `ea_gen_run`
- `ea_gen_task`
- `ea_gen_log`
- `ea_evidence`（预留）

## 公共字段规范
- `id` bigint
- `create_time/update_time/creator/updater/deleted`
- `status/lock_flag/current_version_id`（关键对象）

## 索引
- `ea_doc(name)`
- `ea_doc_paragraph(doc_id, paragraph_no)`
- `ea_gen_run(status, create_time)`
- `ea_gen_task(run_id, sort_no)`
- `ea_gen_log(run_id, id)`
