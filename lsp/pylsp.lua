return {
	cmd = { "pylsp" },
	filetypes = { "python" },
	root_markers = {
		"pyproject.toml",
		"setup.py",
		"setup.cfg",
		"requirements.txt",
		"Pipfile",
		".git",
	},

	settings = {
		pylsp = {
			-- 忽略W391报错，也就是文件末尾有空白行
			pycodestyle = {
				enabled = true,
				ignore = { "W391" },
				maxLineLength = 100,
			},

		},
	},
}
