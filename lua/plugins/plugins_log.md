1. mason.lua- 语言服务器和工具管理器
作用：一站式管理 LSP、DAP、linter、formatter
-- 它会自动安装和管理：
-- - 语言服务器 (lua_ls, pyright, tsserver 等)
-- - 调试器 (debugpy, codelldb)
-- - 代码格式化工具 (prettier, black, stylua)
-- - 语法检查器 (flake8, eslint)

2. nvim-treesitter.lua- 现代化语法系统
作用：超越传统正则表达式的高亮、代码折叠、增量选择
-- 特性：
-- - 基于抽象语法树的精准高亮
-- - 智能代码折叠（按函数/类折叠）
-- - 增量选择（v 选择代码块逐步扩大）
-- - 代码导航（跳转到函数定义）
-- - 支持 100+ 种编程语言

3. telescope.lua- 模糊查找器和交互界面
作用：快速查找文件、内容、Git提交、LSP符号等
<leader>ff        -- 查找文件
<leader>fg        -- 实时搜索内容
<leader>fb        -- 查找缓冲区
<leader>fh        -- 查找帮助文档
<leader>fd        -- 诊断问题
<leader>fr        -- 最近文件

4. lualine.lua- 现代化状态栏
作用：显示文件信息、Git状态、LSP状态、模式等
-- 显示内容：
-- - 文件名和路径
-- - Git分支和修改状态
-- - LSP服务器状态
-- - 行号/列号
-- - 文件编码和类型

5. nvim-tree.lua- 文件资源管理器
作用：侧边栏文件树，类似 VS Code 的资源管理器
<leader>e         -- 打开/关闭文件树
a                -- 创建新文件/目录
d                -- 删除
r                -- 重命名
o                -- 打开文件

🔧 代码增强插件
6. nvim-autopairs.lua- 自动括号补全
作用：输入 (自动补全 )，支持多种括号和引号
-- 示例：输入 `(` 自动变成 `()`
-- 支持：(), [], {}, "", '', ``
-- 智能处理：跳转、删除配对、回车后自动缩进

7. nvim-surround.lua- 环绕操作
作用：快速添加、修改、删除代码周围的符号
ysiw"            -- 用双引号包裹当前单词
cs"'             -- 把双引号改成单引号
ds"              -- 删除双引号
S"               -- 在可视模式下用双引号包裹选中内容

8. indent-blankline.lua- 缩进辅助线
作用：显示垂直缩进参考线，提升代码可读性
-- 特别适合 Python、Lua、YAML 等缩进敏感语言
-- 可自定义线型、颜色、特定文件类型

9. blink.lua- 代码高亮同步闪烁
作用：当使用查找或跳转时，相关代码会高亮闪烁
-- 增强用户体验：
-- - 查找时匹配项闪烁
-- - LSP 跳转时目标位置闪烁
-- - 替换时受影响代码闪烁

🚀 LSP 和诊断增强
10. lspsaga.lua- LSP 增强界面
作用：为 LSP 提供现代化 UI 和便捷操作
-- 功能包括：
-- - 漂亮的悬浮窗口显示文档
-- - 代码操作浮窗
-- - 重命名预览
-- - 大纲视图
-- - 诊断浮窗
-- - 调用层次结构

11. none-ls.lua(null-ls) - 代码格式化和诊断
作用：连接外部工具（如 prettier、eslint）到 LSP
-- 它允许你使用：
-- - ESLint 做 JavaScript 代码检查
-- - Prettier 格式化代码
-- - Black 格式化 Python
-- - stylua 格式化 Lua
-- 统一在 LSP 框架下工作

🎨 界面和主题
12. onedarkpro.lua- 主题配色
作用：流行的 One Dark 主题的专业版本
-- 特性：
-- - 多种变体（onedark, onelight, deep）
-- - 支持 Treesitter 高亮组
-- - 可自定义调色板
-- - Neovim 内置 LSP 支持

13. bufferline.lua- 标签页栏
作用：在顶部显示所有打开的文件标签
<leader>1        -- 切换到第一个标签
<leader>2        -- 切换到第二个标签
<leader>q        -- 关闭当前标签
<leader>b        -- 显示所有缓冲区

🛠️ 实用工具插件
14. toggleterm.lua- 集成终端
作用：在 Neovim 内打开浮动或分屏终端
<C-\>            -- 打开/关闭终端
<leader>tt       -- 水平分屏终端
<leader>tv       -- 垂直分屏终端
<leader>tf       -- 浮动终端

15. yazi-nvim.lua- 现代文件管理器集成
作用：集成 yazi（现代 TUI 文件管理器）
-- 相比 nvim-tree：
-- - 性能更好（异步操作）
-- - 预览功能强大（图片、视频、代码）
-- - 批量操作更方便
-- - 双栏模式

16. grug-far.lua- 搜索替换工具
作用：项目级别的搜索和替换
-- 类似 VSCode 的全局搜索替换
-- 支持正则表达式
-- 支持预览和批量操作
-- 异步执行不阻塞编辑器

17. snacks.lua- 提示通知系统
作用：现代化的通知和提示系统
-- 替代原生 vim.notify()
-- 更漂亮的 UI
-- 支持进度条
-- 可自定义位置、超时、样式
