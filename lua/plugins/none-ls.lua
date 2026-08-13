return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	ft = "lua",
	config = function()
		local null_ls = require("null-ls")
		local sources = {}
		if vim.fn.executable("stylua") == 1 then
			sources = { null_ls.builtins.formatting.stylua }
		end
		null_ls.setup({
			sources = sources,
		})
	end,
	keys = {
		{
			"<leader>lf",
			vim.lsp.buf.format,
		},
	},
}
