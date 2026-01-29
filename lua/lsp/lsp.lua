vim.lsp.enable 'lua_ls'
vim.lsp.enable 'pylsp'


-- lsp的一些配置
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('lsp-attach', {clear = true}),
    callback = function (event)
        -- obtain LSP client
        local client = vim.lsp.get_client_by_id(event.data.client_id)

        -- basic keymaps
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {buffer = event.buf, desc = 'LSP: Goto Definition'})
        vim.keymap.set('n', 'gD', vim.lsp.buf.definition, {buffer = event.buf, desc = 'LSP: Goto Declaration'})
    end
})
