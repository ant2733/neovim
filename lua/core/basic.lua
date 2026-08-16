vim.opt.number = true		-- 打开行号
vim.opt.relativenumber = true	-- 打开相对行号

vim.opt.cursorline = true	-- 当前行高亮

vim.opt.expandtab = true	-- 设置tab为空格
vim.opt.tabstop = 4		-- 设置tab缩进个数
vim.opt.shiftwidth = 0   -- 设置缩进

vim.opt.autoread = true     -- 正常加载外部改变

vim.opt.splitbelow = true       -- 在下方分屏
vim.opt.splitright = true       -- 在右方分屏

-- 对自动补全大小写的设置
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.termguicolors = true    -- 使用更多的颜色

vim.opt.showmode = false        -- 是否显示左下角的模式

vim.opt.clipboard = "unnamedplus"       -- 默认使用系统剪切板

vim.opt.nrformats = "bin,hex,alpha"

vim.opt.wrap = false             -- 关闭自动换行
vim.opt.sidescroll = 5      -- 每次横向滚动 0 列（平滑）或设置为具体数字
vim.opt.sidescrolloff = 5   -- 光标距离屏幕边缘 5 列时开始滚动，保持上下文
