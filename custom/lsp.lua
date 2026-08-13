-- Use Mason-installed servers without eagerly loading Mason. Eager setup adds
-- a VimLeavePre handler that may wait up to five seconds for installers.
local mason_bin = vim.fn.stdpath('data') .. '/mason/bin'
local path_separator = vim.fn.has('win32') == 1 and ';' or ':'
if not vim.env.PATH:find(mason_bin, 1, true) then
    vim.env.PATH = mason_bin .. path_separator .. vim.env.PATH
end

-- Avoid unbounded LSP log growth during save-time diagnostics.
vim.lsp.set_log_level('off')

vim.lsp.enable "lua_ls"
vim.lsp.enable "pylsp"
vim.lsp.enable "jdtls"

-- lsp的一些配置

-- 转到定义，转到声明快捷键
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('lsp-attach', {clear = true}),
    callback = function (event)
        -- obtain LSP client
        local client = vim.lsp.get_client_by_id(event.data.client_id)

        if not client then
            return
        end

        -- Neovim sends these notifications inside BufWritePre. On Windows an
        -- LSP that is still starting can block :write for seconds. didSave,
        -- diagnostics, completion, navigation and manual formatting remain on.
        local sync = client.server_capabilities.textDocumentSync
        if type(sync) == 'table' then
            sync.willSave = false
            sync.willSaveWaitUntil = false
        end

        -- basic keymaps
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {buffer = event.buf, desc = 'LSP: Goto Definition'})
        vim.keymap.set('n', 'gD', vim.lsp.buf.definition, {buffer = event.buf, desc = 'LSP: Goto Declaration'})
    end
})

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
