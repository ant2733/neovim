local capabilities = vim.lsp.protocol.make_client_capabilities()
-- python-lsp-server can block for one second per synchronous lint task while
-- creating progress tokens. Diagnostics still work without progress tokens.
capabilities.window.workDoneProgress = false

return {
  cmd = { 'pylsp' },
  filetypes = { 'python' },
  capabilities = capabilities,
  root_markers = {
    'pyproject.toml',
    'setup.py',
    'setup.cfg',
    'requirements.txt',
    'Pipfile',
    '.git',
  },

  settings = {
    pylsp = {
        -- 忽略W391报错，也就是文件末尾有空白行
        pycodestyle = {
            enabled = true,
            ignore = {"391"},
            maxLineLength = 100,
        }
    }
  }
}

