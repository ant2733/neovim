return {
	"nvim-telescope/telescope.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"BurntSushi/ripgrep",
		"sharkdp/fd",
		"nvim-telescope/telescope-file-browser.nvim",
		-- optional but recommended
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = function()
		local builtin = require("telescope.builtin")
		local telescope = require("telescope")
		-- 快捷键映射
		vim.keymap.set("n", "<leader>ff", function()
			builtin.find_files({ cwd = vim.fn.expand("E:/") })
		end, { desc = "查找Documents目录下的文件" })
		vim.keymap.set("n", "<leader>fa", builtin.find_files, { desc = "查找文件" })
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "全局搜索" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "切换缓冲区" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "帮助文档" })
		vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "最近文件" })
		vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "快捷键" })

		-- telescope-file-browser快捷键配置
		vim.keymap.set("n", "<leader>fe", function()
			require("telescope").extensions.file_browser.file_browser({
				path = "%:p:h", -- 从当前文件所在目录开始
				cwd = vim.fn.expand("%:p:h"),
				hidden = true,
			})
		end, { desc = "文件浏览器" })

		vim.keymap.set("n", "<leader>fp", function()
			require("telescope").extensions.file_browser.file_browser({
				path = vim.loop.cwd(), -- 从项目根目录开始
				cwd = vim.loop.cwd(),
			})
		end, { desc = "项目文件浏览器" })

		-- 快速打开特定目录
		vim.keymap.set("n", "<leader>fc", function()
			require("telescope").extensions.file_browser.file_browser({
				path = "C:/Users/m2073/AppData/Local/nvim", -- Neovim配置目录
			})
		end, { desc = "打开Neovim配置" })

		-- 基本配置
		require("telescope").setup({
			defaults = {
				-- Default configuration for telescope goes here:
				-- config_key = value,
				mappings = {
					i = {
						-- map actions.which_key to <C-h> (default: <C-/>)
						-- actions.which_key shows the mappings for your picker,
						-- e.g. git_{create, delete, ...}_branch for the git_branches picker
						["<C-h>"] = "which_key",
					},
				},
			},
			pickers = {
				-- Default configuration for builtin pickers goes here:
				-- picker_name = {
				--   picker_config_key = value,
				--   ...
				-- }
				-- Now the picker_config_key will be applied every time you call this
				-- builtin picker
			},
			extensions = {
				-- Your extension configuration goes here:
				-- extension_name = {
				--   extension_config_key = value,
				-- }
				-- please take a look at the readme of the extension you want to configure
			},
		})
	end,
}
