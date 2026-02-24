return {
	"hkupty/iron.nvim",
	config = function()
		local iron = require("iron.core")
		vim.env.PATH = "/opt/miniconda3/envs/origin/bin:" .. vim.env.PATH
		iron.setup({
			config = {
				-- 1. 设置 REPL 窗口打开方式 (推荐垂直分屏，宽度120)
				repl_open_cmd = "vertical 45 split",

				-- 2. 忽略空行，发送时更干净
				ignore_blank_lines = true,
			},

			-- 3. 自定义快捷键 (避免冲突，符合直觉)
			keymaps = {
				visual_send = "<leader>rr", -- 发送选区 (Visual Mode)
				send_file = "<leader>sf", -- 发送整个文件
				send_line = "<leader>rr", -- 发送当前行
				-- send_until_cursor = "<leader>su", -- 发送到光标处
				-- send_from_cursor = "<leader>si", -- 从光标处发送
				-- 如果需要发送 Cell (# %%)，建议配合之前提到的自定义函数
			},

			-- 4. 强制指定 Python 使用 ipython (关键！)
			repl_filetype_map = {
				python = { "/opt/miniconda3/envs/origin/bin/ipython" },
				lua = { "lua" },
				javascript = { "node" },
			},

			-- 5. (可选) 如果不想让 REPL 窗口抢走焦点，保持编辑状态
			-- focus_on_repl = false,
		})
		vim.keymap.set("n", "<C-'>", ":IronRepl<CR>", { desc = "Open Iron REPL" })
	end,
}
