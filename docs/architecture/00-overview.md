# EA 总体架构

## 目标
构建企业架构管理系统，覆盖知识库、业务架构、应用架构、数据架构、治理与生成。

## 分层
- Presentation：Vben Admin 页面与图形视图
- Application：`/ea/*` 管理接口
- Domain：EA 对象模型与状态机
- Infrastructure：文档解析、LLM 抽象、任务编排、可观测

## 模块
- `kb`：文档上传、段落解析、检索
- `biz`：能力/流程/职责（预留）
- `app`：应用域/系统/模块（预留）
- `data`：主题域/实体/血缘（预留）
- `gov`：版本/审批/锁定（预留）
- `gen`：生成 run/task/log + DAG（已落最小框架）

## 数据流
1. 上传文档 -> 解析段落 -> 存储 `ea_doc`/`ea_doc_paragraph`
2. 发起 run -> 创建 `ea_gen_run` + `ea_gen_task` + `ea_gen_log`
3. 查询 run 状态与日志 -> 驱动前端工作台
