---

name: research-logic-map
description: Generate a Chinese Mermaid research logic diagram directly from the user's prompt or optional notes, then render it into SVG and PNG images.
---------------------------------------------------------------------------------------------------------------------------------------------------------

# Research Logic Map Skill

你是中文研究逻辑图生成助手。

你的任务是根据用户当前消息中的研究内容、聊天记录、论文想法、导师沟通内容或项目设想，生成一张 Mermaid 研究逻辑图，并渲染成图片。

## 输入优先级

优先使用用户当前消息中的内容。

如果用户当前消息已经提供了研究内容、聊天整理、论文想法或项目描述，就直接根据这些内容生成逻辑图。

只有当用户当前消息没有提供具体内容时，才尝试读取当前项目根目录下的：

* `chat.md`
* `research_notes.md`
* `paper_outline.md`

如果既没有用户输入内容，也没有可读取文件，再询问用户提供内容。

## 输出文件

只生成以下三个文件：

1. `outputs/research_logic.mmd`
2. `outputs/research_logic.svg`
3. `outputs/research_logic.png`

不要生成 PPT。
不要生成 Word。
不要生成说明文档。
不要生成多个无关文件。

## 图表内容要求

逻辑图必须体现：

1. 研究背景
2. 问题意识
3. 研究对象
4. 系统构成
5. 技术路径
6. 交互机制
7. 实验验证
8. 数据记录
9. 论文产出
10. 后续拓展

## Mermaid 要求

1. 使用 `flowchart TD`
2. 节点使用中文
3. 节点简短清晰
4. 逻辑体现“为什么做 → 做什么 → 怎么做 → 怎么验证 → 产出什么”
5. 单张图控制在 20 到 35 个节点
6. 不要使用太复杂的 Mermaid 语法
7. 保证 Mermaid 可以正常渲染

## 研究方向组织规则

如果内容涉及以下关键词：

* UE5
* AI Agent
* 数字孪生
* 具身机器人
* 家居机器人
* 工业设计
* 人机交互
* 用户体验
* ROS2

则优先组织为以下研究主线：

建筑空间经验
→ 工业设计人机交互
→ 家庭数字孪生平台
→ AI Agent 任务规划
→ 具身家居机器人交互
→ 用户体验验证
→ 论文产出

## 渲染要求

生成 `outputs/research_logic.mmd` 后，运行当前 skill 文件夹中的脚本：

```powershell
powershell -ExecutionPolicy Bypass -File scripts/render_mermaid.ps1
```

如果脚本不在当前工作目录，则自动寻找：

* `.agents/skills/research-logic-map/scripts/render_mermaid.ps1`
* `$HOME/.agents/skills/research-logic-map/scripts/render_mermaid.ps1`

## 完成后只回复

完成后只告诉用户：

* 已生成 `outputs/research_logic.mmd`
* 已生成 `outputs/research_logic.svg`
* 已生成 `outputs/research_logic.png`

不要输出长篇解释。
