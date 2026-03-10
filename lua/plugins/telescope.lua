-- return {
-- 	"nvim-telescope/telescope.nvim",
-- 	version = "*",
-- 	dependencies = {
-- 		"nvim-lua/plenary.nvim",
-- 		"BurntSushi/ripgrep",
-- 		"sharkdp/fd",
-- 		"nvim-telescope/telescope-file-browser.nvim",
-- 		-- optional but recommended
-- 		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
-- 	},
-- 	config = function()
-- 		local builtin = require("telescope.builtin")
-- 		local telescope = require("telescope")
-- 		-- 快捷键映射
-- 		vim.keymap.set("n", "<leader>ff", function()
-- 			builtin.find_files({ cwd = vim.fn.expand("~/Documents") })
-- 		end, { desc = "查找Documents目录下的文件" })
-- 		vim.keymap.set("n", "<leader>fa", builtin.find_files, { desc = "查找文件" })
-- 		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "全局搜索" })
-- 		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "切换缓冲区" })
-- 		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "帮助文档" })
-- 		vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "最近文件" })
-- 		vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "快捷键" })
--
-- 		-- telescope-file-browser快捷键配置
-- 		vim.keymap.set("n", "<leader>fe", function()
-- 			require("telescope").extensions.file_browser.file_browser({
-- 				path = "%:p:h", -- 从当前文件所在目录开始
-- 				cwd = vim.fn.expand("%:p:h"),
-- 				hidden = true,
-- 			})
-- 		end, { desc = "文件浏览器" })
--
-- 		vim.keymap.set("n", "<leader>fp", function()
-- 			require("telescope").extensions.file_browser.file_browser({
-- 				path = vim.loop.cwd(), -- 从项目根目录开始
-- 				cwd = vim.loop.cwd(),
-- 			})
-- 		end, { desc = "项目文件浏览器" })
--
-- 		-- 快速打开特定目录
-- 		vim.keymap.set("n", "<leader>fc", function()
-- 			require("telescope").extensions.file_browser.file_browser({
-- 				path = "~/.config/nvim", -- Neovim配置目录
-- 			})
-- 		end, { desc = "打开Neovim配置" })
--
-- 		-- 基本配置
-- 		require("telescope").setup({
-- 			defaults = {
-- 				-- Default configuration for telescope goes here:
-- 				-- config_key = value,
-- 				mappings = {
-- 					i = {
-- 						-- map actions.which_key to <C-h> (default: <C-/>)
-- 						-- actions.which_key shows the mappings for your picker,
-- 						-- e.g. git_{create, delete, ...}_branch for the git_branches picker
-- 						["<C-h>"] = "which_key",
-- 					},
-- 				},
-- 			},
-- 			pickers = {
-- 				-- Default configuration for builtin pickers goes here:
-- 				-- picker_name = {
-- 				--   picker_config_key = value,
-- 				--   ...
-- 				-- }
-- 				-- Now the picker_config_key will be applied every time you call this
-- 				-- builtin picker
-- 			},
-- 			extensions = {
-- 				-- Your extension configuration goes here:
-- 				-- extension_name = {
-- 				--   extension_config_key = value,
-- 				-- }
-- 				-- please take a look at the readme of the extension you want to configure
-- 			},
-- 		})
-- 	end,
-- }
return {
	"nvim-telescope/telescope.nvim",
	version = "*", -- 或者使用 commit hash 锁定版本，如 commit = "abc123"
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
		-- fzf-native 需要编译，确保你有 make/gcc
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = function()
		local builtin = require("telescope.builtin")
		local telescope = require("telescope")
		
		-- ✅ 核心优化：配置 telescope 使用 fd 和 rg
		-- 注意：如果你在 Linux 上 fd 命令叫 fdfind，请把 'fd' 改为 'fdfind'
		local has_fd = vim.fn.executable("fd") == 1 or vim.fn.executable("fdfind") == 1
		local fd_cmd = vim.fn.executable("fd") == 1 and "fd" or "fdfind"
		
		telescope.setup({
			defaults = {
				-- 1. 强制使用 fd 进行文件查找 (速度提升关键)
				file_sorter = require("telescope.sorters").get_fuzzy_file,
				generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
				
				-- 如果检测到了 fd，就使用它
				find_command = has_fd and { fd_cmd, "--type", "f", "--strip-cwd-prefix", "--hidden" } or nil,
				
				-- 2. 忽略不必要的目录 (极大提升速度)
				file_ignore_patterns = { 
					"node_modules", 
					".git/", 
					"__pycache__", 
					"build/", 
					"dist/", 
					"venv/", 
					".venv/",
					"target/", -- Rust
					"vendor/" 
				},
				
				-- 3. 布局与预览优化
				layout_strategy = "horizontal",
				layout_config = {
					preview_width = 0.55,
				},
				-- 如果预览大文件卡顿，可以限制预览器或关闭语法高亮
				-- previewer = true, 
				
				mappings = {
					i = {
						["<C-h>"] = "which_key",
						["<C-j>"] = "move_selection_next",
						["<C-k>"] = "move_selection_previous",
					},
					n = {
						["<C-h>"] = "which_key",
					}
				},
			},
			pickers = {
				find_files = {
					-- 针对 find_files 的额外配置
					hidden = true, -- 显示隐藏文件
					no_ignore = false, -- 遵守 .gitignore
				},
				live_grep = {
					-- 针对 live_grep 的配置
					-- 确保 rg 参数正确
					additional_args = function()
						return { "--hidden", "--glob", "!**/.git/*" }
					end,
				},
			},
			extensions = {
				fzf = {
					fuzzy = true,                    -- false will only do exact matching
					override_generic_sorter = true,  -- override the generic sorter
					override_file_sorter = true,     -- override the file sorter
					case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
				},
				file_browser = {
					-- file_browser 扩展的配置
					hijack_netrw = true,
					hidden = true,
				}
			},
		})
		
		-- 加载扩展
		telescope.load_extension("fzf")
		telescope.load_extension("file_browser")

		-- ✅ 快捷键映射 (修复了路径问题)
		local home = vim.loop.os_homedir() or os.getenv("HOME") or "~"
		
		vim.keymap.set("n", "<leader>ff", function()
			builtin.find_files({ 
				cwd = home .. "/Documents", 
				hidden = true 
			})
		end, { desc = "查找 Documents 目录下的文件" })
		
		vim.keymap.set("n", "<leader>fa", builtin.find_files, { desc = "查找当前项目文件" })
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "全局搜索内容" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "切换缓冲区" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "帮助文档" })
		vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "最近打开的文件" })
		vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "查看所有快捷键" })

		-- telescope-file-browser 快捷键
		vim.keymap.set("n", "<leader>fe", function()
			local current_dir = vim.fn.expand("%:p:h")
			if current_dir == "" or current_dir == "." then
				current_dir = vim.loop.cwd()
			end
			telescope.extensions.file_browser.file_browser({
				path = current_dir,
				cwd = current_dir,
				hidden = true,
			})
		end, { desc = "文件浏览器 (当前目录)" })

		vim.keymap.set("n", "<leader>fp", function()
			local project_root = vim.loop.cwd()
			telescope.extensions.file_browser.file_browser({
				path = project_root,
				cwd = project_root,
				hidden = true,
			})
		end, { desc = "项目文件浏览器" })

		vim.keymap.set("n", "<leader>fc", function()
			telescope.extensions.file_browser.file_browser({
				path = home .. "/.config/nvim",
				cwd = home .. "/.config/nvim",
				hidden = true,
			})
		end, { desc = "打开 Neovim 配置目录" })
	end,
}
