# EA 生成流水线

## DAG 节点（首版）
1. DOC_SLICE
2. TERM_NORMALIZE
3. ARCH_BUILD

## LLM 抽象
- 接口：`LlmClient`
- 默认实现：`MockLlmClient`

## 回放信息
- `ea_gen_run` 存储运行主记录
- `ea_gen_task` 存储节点状态
- `ea_gen_log` 存储过程日志
