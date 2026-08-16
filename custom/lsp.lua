vim.lsp.enable("lua_ls")
vim.lsp.enable("pyright")
vim.lsp.enable("html")
vim.lsp.enable("jdtls")
vim.lsp.enable("clangd")

-- lsp的一些配置

-- 转到定义，转到声明快捷键
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
	callback = function(event)
		-- obtain LSP client
		local client = vim.lsp.get_client_by_id(event.data.client_id)

		-- basic keymaps
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = event.buf, desc = "LSP: Goto Definition" })
		vim.keymap.set("n", "gD", vim.lsp.buf.definition, { buffer = event.buf, desc = "LSP: Goto Declaration" })
	end,
})

-- 在你的配置文件中（init.lua 或类似文件）加入
vim.lsp.handlers["textDocument/codeAction"] = function()
	-- 什么都不做，直接返回，不显示任何 UI
	return {}
end
-- 全局诊断显示
vim.diagnostic.config({
	-- virtual_text = true,    -- 在行右侧显示虚拟文本
	virtual_text = {
	    severity = { min = vim.diagnostic.severity.ERROR },  -- 只显示错误及以上级别
	    prefix = '●',
	},
	signs = {
	    severity = { min = vim.diagnostic.severity.ERROR },  -- 侧边栏只显示错误符号
	},
	underline = {
	    severity = { min = vim.diagnostic.severity.ERROR },  -- 只对错误加下划线
	},
	update_in_insert = false,
})
